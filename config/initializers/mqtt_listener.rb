ids = WeatherStation.pluck(:weatherStation).uniq
require "amqp"

class Consumer
  def handle_message(metadata, payload)
    puts "Received a message: #{payload}, content_type = #{metadata}"
  end
end

class Worker
  def initialize(channel, queue_name = AMQ::Protocol::EMPTY_STRING, consumer = Consumer.new)
    @queue_name = queue_name
    @channel = channel
    @exchange = @channel.topic("weather.stations", :auto_delete => true)

    @channel.on_error(&method(:handle_channel_exception))

    @consumer = consumer
  end

  def start id
    @channel.queue("#{@queue_name}.#{id}", :exclusive => true, :auto_delete => true) do |queue|
      queue.bind(@exchange, :routing_key => "#{@queue_name}.#{id}").subscribe(&@consumer.method(:handle_message))
    end
  end

  def handle_channel_exception(channel, channel_close)
    puts "Oops... a channel-level exception: code = #{channel_close.reply_code}, message = #{channel_close.reply_text}"
  end
end

class Producer
  def initialize(channel, exchange)
    @channel = channel
    @exchange = exchange
  end

  def publish(message, options = {})
    @exchange.publish(message, options)
  end

  def handle_channel_exception(channel, channel_close)
    puts "Oops... a channel-level exception: code = #{channel_close.reply_code}, message = #{channel_close.reply_text}"
  end
end

Thread.new do
  AMQP.start(ENV["CLOUDAMQP_URL"]) do |connection|
    channel = AMQP::Channel.new(connection)
    worker = Worker.new(channel, "id")
    ids.each do |id|
      worker.start id
    end
  end
end