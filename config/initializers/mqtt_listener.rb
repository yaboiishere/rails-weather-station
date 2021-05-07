ids = WeatherStation.pluck(:weatherStation).uniq
require "amqp"

class Consumer
  def handle_message(metadata, payload)
    puts "Received a message: #{payload}, content_type = #{metadata.content_type}"
  end
end

class Worker
  def initialize(channel, queue_name = AMQ::Protocol::EMPTY_STRING, consumer = Consumer.new)
    @queue_name = queue_name

    @channel = channel
    @channel.on_error(&method(:handle_channel_exception))

    @consumer = consumer
  end

  def start
    @queue = @channel.queue(@queue_name, :exclusive => true)
    @queue.subscribe(&@consumer.method(:handle_message))
  end

  def handle_channel_exception(channel, channel_close)
    puts "Oops... a channel-level exception: code = #{channel_close.reply_code}, message = #{channel_close.reply_text}"
  end
end

Thread.new do
  AMQP.start("amqp://guest:guest@localhost:5672") do |connection|
    channel = AMQP::Channel.new(connection)
    worker = Worker.new(channel, "weather.stations")
    worker.start
  end
end