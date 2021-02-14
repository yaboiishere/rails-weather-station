/*----------------------------------------------------------------------------------------------------
  Project Name : Solar Powered WiFi Weather Station V2.31
  Features: temperature, dewpoint, dewpoint spread, heat index, humidity, absolute pressure, relative pressure, battery status and
  the famous Zambretti Forecaster (multi lingual)
  Authors: Keith Hungerford, Debasish Dutta and Marc Stähli
  Website : www.opengreenenergy.com
  
******* Transaltion tables ****************************************/

#if LANGUAGE == 'EN'
  const char TEXT_RISING_FAST[]       = "rising fast";
  const char TEXT_RISING[]            = "rising";
  const char TEXT_RISING_SLOW[]       = "rising slow";
  const char TEXT_STEADY[]            = "steady";
  const char TEXT_FALLING_SLOW[]      = "falling slow";
  const char TEXT_FALLING[]           = "falling";
  const char TEXT_FALLING_FAST[]      = "falling fast";

  const char TEXT_ZAMBRETTI_A[]       = "Settled Fine Weather";
  const char TEXT_ZAMBRETTI_B[]       = "Fine Weather";
  const char TEXT_ZAMBRETTI_C[]       = "Becoming Fine";
  const char TEXT_ZAMBRETTI_D[]       = "Fine, Becoming Less Settled";
  const char TEXT_ZAMBRETTI_E[]       = "Fine, Possibly showers";
  const char TEXT_ZAMBRETTI_F[]       = "Fairly Fine, Improving";
  const char TEXT_ZAMBRETTI_G[]       = "Fairly Fine, Possibly showers early";
  const char TEXT_ZAMBRETTI_H[]       = "Fairly Fine, Showers Later";
  const char TEXT_ZAMBRETTI_I[]       = "Showery Early, Improving";
  const char TEXT_ZAMBRETTI_J[]       = "Changeable Improving";
  const char TEXT_ZAMBRETTI_K[]       = "Fairly Fine, Showers likely";
  const char TEXT_ZAMBRETTI_L[]       = "Rather Unsettled Clearing Later";
  const char TEXT_ZAMBRETTI_M[]       = "Unsettled, Probably Improving";
  const char TEXT_ZAMBRETTI_N[]       = "Showery Bright Intervals";
  const char TEXT_ZAMBRETTI_O[]       = "Showery Becoming Unsettled";
  const char TEXT_ZAMBRETTI_P[]       = "Changeable some rain";
  const char TEXT_ZAMBRETTI_Q[]       = "Unsettled, short fine Intervals";
  const char TEXT_ZAMBRETTI_R[]       = "Unsettled, Rain later";
  const char TEXT_ZAMBRETTI_S[]       = "Unsettled, rain at times";
  const char TEXT_ZAMBRETTI_T[]       = "Very Unsettled, Finer at times";
  const char TEXT_ZAMBRETTI_U[]       = "Rain at times, Worse later";
  const char TEXT_ZAMBRETTI_V[]       = "Rain at times, becoming very unsettled";
  const char TEXT_ZAMBRETTI_W[]       = "Rain at Frequent Intervals";
  const char TEXT_ZAMBRETTI_X[]       = "Very Unsettled, Rain";
  const char TEXT_ZAMBRETTI_Y[]       = "Stormy, possibly improving";
  const char TEXT_ZAMBRETTI_Z[]       = "Stormy, much rain";
  const char TEXT_ZAMBRETTI_DEFAULT[] = "Sorry, no forecast for the moment";

#elif LANGUAGE == 'BG'
  const char TEXT_AIR_PRESSURE[]      = "Налягане:";
  const char TEXT_RISING_FAST[]       = "бързо се вдига";
  const char TEXT_RISING[]            = "вдига се";
  const char TEXT_RISING_SLOW[]       = "бавно се вдига";
  const char TEXT_STEADY[]            = "стабилно";
  const char TEXT_FALLING_SLOW[]      = "бавно пада";
  const char TEXT_FALLING[]           = "пада";
  const char TEXT_FALLING_FAST[]      = "бързо пада";

  const char TEXT_ZAMBRETTI_FORECAST[]= "Прогноза";
  const char TEXT_ZAMBRETTI_ACCURACY[]= "Точносттa на прогнозата e:";
  const char TEXT_ZAMBRETTI_A[]       = "Хубаво, стабилно време";
  const char TEXT_ZAMBRETTI_B[]       = "Хубаво време";
  const char TEXT_ZAMBRETTI_C[]       = "Оправя се";
  const char TEXT_ZAMBRETTI_D[]       = "Хубаво, става не постоянно";
  const char TEXT_ZAMBRETTI_E[]       = "Хубаво, вероятен дъжд";
  const char TEXT_ZAMBRETTI_F[]       = "Сравнително добро, очаква се подобрение";
  const char TEXT_ZAMBRETTI_G[]       = "Сравнително добро, вероятен дъжд скоро";
  const char TEXT_ZAMBRETTI_H[]       = "Сравнително добро, вероятен дъжд по - късно";
  const char TEXT_ZAMBRETTI_I[]       = "Валяло е, подобрява се";
  const char TEXT_ZAMBRETTI_J[]       = "Променливо, подобрява се";
  const char TEXT_ZAMBRETTI_K[]       = "Сравнително добро, вероятен дъжд";
  const char TEXT_ZAMBRETTI_L[]       = "Непредвидимо, ще се изясни";
  const char TEXT_ZAMBRETTI_M[]       = "Непредвидимо, вероятно ще се изясни";
  const char TEXT_ZAMBRETTI_N[]       = "Превалявания, слънчеви паузи";
  const char TEXT_ZAMBRETTI_O[]       = "Превалявания, разваля се";
  const char TEXT_ZAMBRETTI_P[]       = "Променливо, превалявания";
  const char TEXT_ZAMBRETTI_Q[]       = "Променливо, слънчеви интервали";
  const char TEXT_ZAMBRETTI_R[]       = "Променливо, вероятен дъжд";
  const char TEXT_ZAMBRETTI_S[]       = "Променливо, вероятни интервали с дъжд";
  const char TEXT_ZAMBRETTI_T[]       = "Много променливо, слънчеви интервали";
  const char TEXT_ZAMBRETTI_U[]       = "Дъжд, разваля се";
  const char TEXT_ZAMBRETTI_V[]       = "Дъжд, разваля се доста бързо";
  const char TEXT_ZAMBRETTI_W[]       = "Чести превалявания";
  const char TEXT_ZAMBRETTI_X[]       = "Непредвидимо, дъжд";
  const char TEXT_ZAMBRETTI_Y[]       = "Буря, вероятно подобряване скоро";
  const char TEXT_ZAMBRETTI_Z[]       = "Силна буря";
  const char TEXT_ZAMBRETTI_0[]       = "Батерията е празна, моля презаредете я!";
  const char TEXT_ZAMBRETTI_DEFAULT[] = "Как стана туй ве?";

#endif
