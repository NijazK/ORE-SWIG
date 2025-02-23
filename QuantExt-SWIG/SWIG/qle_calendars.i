/*
 Copyright (C) 2018, 2020 Quaternion Risk Management Ltd
 All rights reserved.

 This file is part of ORE, a free-software/open-source library
 for transparent pricing and risk analysis - http://opensourcerisk.org

 ORE is free software: you can redistribute it and/or modify it
 under the terms of the Modified BSD License.  You should have received a
 copy of the license along with this program.
 The license is also available online at <http://opensourcerisk.org>

 This program is distributed on the basis that it will form a useful
 contribution to risk analytics and model standardisation, but WITHOUT
 ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 FITNESS FOR A PARTICULAR PURPOSE. See the license for more details.
*/

#ifndef qle_calendars_i
#define qle_calendars_i

%include calendars.i

%{
using QuantExt::Austria;
using QuantExt::Belgium;
using QuantExt::CME;
using QuantExt::Colombia;
using QuantExt::Cyprus;
using QuantExt::France;
using QuantExt::Greece;
using QuantExt::ICE;
using QuantExt::Ireland;
using QuantExt::IslamicWeekendsOnly;
using QuantExt::Israel;
using QuantExt::Luxembourg;
using QuantExt::Malaysia;
using QuantExt::Netherlands;
using QuantExt::Peru;
using QuantExt::Philippines;
using QuantExt::RussiaModified;
using QuantExt::Switzerland;
using QuantExt::Wmr;
using QuantExt::LargeJointCalendar;
%}

%shared_ptr(Austria)
class Austria : public Calendar {
	public:
		enum Market {Settlement};
		Austria(Market m = Settlement);
};

%shared_ptr(Belgium)
class Belgium : public Calendar {
	public:
		enum Market {Settlement};
		Belgium(Market m = Settlement);
};

%shared_ptr(CME)
class CME : public Calendar {
	public:
		CME();
};

%shared_ptr(Colombia)
class Colombia : public Calendar {
	public:
		enum Market {CSE};
		Colombia(:Market m = CSE);
};


/*! Cyrpus Calendar
    Public holidays (data from https://www.centralbank.cy/en/the-bank/working-hours-bank-holidays):
    
    Fixed Dates
    <ul>
    <li>Saturdays</li>
    <li>Sundays</li>
    <li>New Year's Day, January 1st</li>
    <li>Ephiphany Day, 6th January</li>
    <li>Greek Independence Day, 25th March</li>
    <li>National Day, 1st April</li>
    <li>Labour Day, 1st May</li>
    <li>Assumption (Theotokos) Day, 15st August</li>
    <li>Cyprus Independence Day, 1st October</li>
    <li>Greece National Day, 28th October</li>
    <li>Christmas Day, December 25th</li>
    <li>Boxing Day, December 26th</li>
    </ul>

    Variable days
    <ul>
    <li>Green Monday</li>
    <li>Good Friday</li>
    <li>Easter Monday</li>
    <li>Easter Tuesday/li>
    <li>Orthodox Pentecost (Whit) Monday</li>
    </ul>

    \ingroup calendars

    \test the correctness of the returned results is tested
          against a list of known holidays.
*/
%shared_ptr(Cyprus)
class Cyprus : public Calendar {
	public:
		Cyprus();
};

%shared_ptr(France)
class France : public Calendar {
	public:
        enum Market {Settlement};
		France(Market m = Settlement);
};

%shared_ptr(Greece)
class Greece : public Calendar {
    public:
        Greece();
};

%shared_ptr(ICE)
class ICE : public Calendar {
    public:
        enum Market {
            FuturesUS,       /*!< ICE Futures U.S. Currency, Stock and Credit Index,
                              Metal, Nat Gas, Power, Oil and Environmental */
            FuturesUS_1,     //!< ICE Futures U.S. Sugar, Cocoa, Coffee, Cotton and FCOJ
            FuturesUS_2,     //!< ICE Futures U.S. Canola
            FuturesEU,       //!< ICE Futures Europe
            FuturesEU_1,     //!< ICE Futures Europe for contracts where 26 Dec is a holiday
            EndexEnergy,     //!< ICE Endex European power and natural gas products
            EndexEquities,   //!< ICE Endex European equities
            SwapTradeUS,     //!< ICE Swap Trade U.S.
            SwapTradeUK,     //!< ICE Swap Trade U.K.
            FuturesSingapore //!< ICE futures Singapore
        };
        ICE(Market market);
};



//! Ireland Calendars
/*! Public holidays:
    <ul>
    <li>Saturdays</li>
    <li>Sundays</li>
    <li>New Year's Day, January 1st (possibly moved to Monday)</li>
    <li>Good Friday</li>
    <li>Easter Monday</li>
    <li>St. Patricks Day,March 17th</li>
    <li>May Bank Holiday, first Monday of May</li>
    <li>June Bank Holiday, first Monday of June</li>
    <li>August Bank Holiday, first Monday of August</li>
    <li>October Bank Holiday, last Monday of August</li>
    <li>Christmas Day, December 25th (possibly moved to Monday or
        Tuesday)</li>
    <li>Boxing Day, December 26th (possibly moved to Monday or
        Tuesday)</li>
    </ul>


    \ingroup calendars

    \test the correctness of the returned results is tested
          against a list of known holidays.
*/

%shared_ptr(Ireland)
class Ireland : public Calendar {
    enum Market {IrishStockExchange, BankHolidays};

    Ireland(const Market market=IrishStockExchange);

};

%shared_ptr(IslamicWeekendsOnly)
class IslamicWeekendsOnly : public Calendar {
    IslamicWeekendsOnly();
};


//! Israel calendar
/*! Extend Israel calendar to cover TELBOR publication dates as described at:
    https://www.boi.org.il/en/Markets/TelborMarket/Documents/telbordef_eng.pdf
    Telbor holidays 2019, 2020:
    https://www.boi.org.il/en/Markets/TelborMarket/Documents/NoTelborRates2019.pdf
    https://www.boi.org.il/en/Markets/TelborMarket/Documents/NoTelborRates2020.pdf

    \ingroup calendars
*/

%shared_ptr(Israel)
class Israel : public Calendar {
    enum MarketExt { Settlement, TASE, Telbor };
    Israel(MarketExt market = Telbor);
};

%shared_ptr(Luxembourg)
class Luxembourg : public Calendar {
    enum Market {Settlement};
    Luxembourg(Market m = Settlement);
};


%shared_ptr(Malaysia)
class Malaysia : public Calendar {
    enum Market {MYX};
    Malaysia(Market m = MYX);
};

%shared_ptr(Netherlands)
class Netherlands : public Calendar {
    enum Market {Settlement};
    Netherlands(Market m = Settlement);
};

%shared_ptr(Peru)
class Peru : public Calendar {
    enum Market {LSE};
    Peru(Market m = LSE);
};

%shared_ptr(Philippines)
class Philippines : public Calendar {
    enum Market {PHE};
    Philippines(Market m = PHE);
};

%shared_ptr(RussiaModified) 
class RussiaModified : public Calendar {
    RussiaModified(Russia::Market = Russia::Settlement);
};

%shared_ptr(Spain)
class Spain : public Calendar {
    enum Market {Settlement};
    Spain(Market m = Settlement)
};

%shared_ptr(Switzerland)
class Switzerland : public Calendar {
    enum Market(Settlement, SIX);
    Switzerland(Market matker = Settlement);
};

%shared_ptr(Wmr)
class Wr : public Calendar {
    enum Market(Settlement);
    Wmr(Market market = Settlement);
};

%shared_ptr(LargeJointCalendar)
class LargeJointCalendar : public QuantLib::Calendar {
    LargeJointCalendar(const std::vector<QuantLib::Calendar>&,
                                QuantLib::JointCalendarRule = QuantLib::JoinHolidays);
};















