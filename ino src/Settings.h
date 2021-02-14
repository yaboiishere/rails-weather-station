/*----------------------------------------------------------------------------------------------------
  Project Name : Solar Powered WiFi Weather Station V2.31
  Features: temperature, dewpoint, dewpoint spread, heat index, humidity, absolute pressure, relative pressure, battery status and
  the famous Zambretti Forecaster (multi lingual)
  Authors: Keith Hungerford, Debasish Dutta and Marc Stähli
  Website : www.opengreenenergy.com



******* configuration control constant for use of Blynk and/or Thingspeak ***/


int weatherstationid = 3;
//kiro=1 misho=2 kres=3 zlatin=4 kaloqn=5
const String App1 = "Heroku";         // empty string if not applicable -> "" else "Heroku" 
const String App2 = "";    // empty string if not applicable -> "" else "THINGSPEAK"


/****** Blink or ThingSpeak Settings ****************************************/

char ssid[] = "A1_570C";                           // WiFi Router ssid
char pass[] = "48575443BD0FA9A3";                                // WiFi Router password

const char* server = "";        // Thingspeak Write API
const char* api_key = "";         // API write key 

/****** MQTT Settings ********************************************************/

const char* mqtt_server = "192.xxx.xxx.xxx";      // MQTT Server (broker) address


/****** Additional Settings **************************************************/

#define LANGUAGE 'BG'               //either 'DE' for German or 'EN' for English

#define TEMP_CORR (0)              //Manual correction of temp sensor (mine reads 1 degree too high)
#define HUMI_CORR (0)               // Changing temperature -1 equals humidity +4 (average, not precise but good enough for me)

#define ELEVATION (86)             //Enter your elevation in m ASL to calculate rel pressure (ASL/QNH) at your place

#define sleepTimeMin (2)           //setting of deepsleep time in minutes (default: 10)

// NTP   --> Just a remark - the program needs the time only for the timestamp, so for the Zambretti forecast
//           the timezone and the DST (Daylight Saving Time) is irrelevant. This is why I did not take care of DST 
//           in the code. I saw a fork on Github (truckershitch) which I believe has covered this.

#define NTP_SERVER      "bg.pool.ntp.org"
#define TZ              2           // (utc+) TZ in hours
#define DST_MN          60          // use 60mn for summer time in some countries

#define TZ_SEC          ((TZ)*3600)  // don't change this
#define DST_SEC         ((DST_MN)*60)// don't change this

/**********Blynk & ThingSpeak assginments ---------------------------------

Heroku:

virtual pin 0 Temperature (Celcius)
virtual pin 1 Humidity (%)
virtual pin 2 Absolute Pressure (hPa)
virtual pin 3 Relative Pressure (hPa)
virtual pin 4 Battery Volts (V)
virtual pin 5 Dewpoint (Celcius)
virtual pin 6 HeatIndex (Celcius)
virtual pin 7 Zambrettis Words
virtual pin 8 Accuracy in percent (%)
virtual pin 9 Trend in Words
virtual pin 10 Dewpoint Spread

***************************************************************************/
