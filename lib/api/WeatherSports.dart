/// football : [{"stadium":"Imortal Albufeira","country":"Portugal","region":"","tournament":"International Match","start":"2023-01-12 17:00","match":"Finland vs Estonia"},{"stadium":"Stadio Artemio Franchi, Florence","country":"Italy","region":"","tournament":"Coppa Italia","start":"2023-01-12 17:00","match":"Fiorentina vs Sampdoria"},{"stadium":"National Stadium - King Fahd International Stadium","country":"Saudi Arabia","region":"","tournament":"Spanish Super Cup","start":"2023-01-12 19:00","match":"Real Betis vs Barcelona"},{"stadium":"Roma","country":"Italy","region":"","tournament":"Coppa Italia","start":"2023-01-12 20:00","match":"Roma vs Genoa"},{"stadium":"Napoli","country":"Italy","region":"","tournament":"Italian Serie A","start":"2023-01-13 19:45","match":"Napoli vs Juventus"},{"stadium":"Kvc Westerlo","country":"Belgium","region":"","tournament":"Belgian First Division A","start":"2023-01-13 19:45","match":"Westerlo vs Oud-Heverlee Leuven"},{"stadium":"Celta Vigo","country":"Spain","region":"","tournament":"Spanish La Liga","start":"2023-01-13 20:00","match":"Celta Vigo vs Villarreal"},{"stadium":"Portimonense","country":"Portugal","region":"","tournament":"Portuguese Primeira Liga","start":"2023-01-13 20:15","match":"Portimonense vs Santa Clara"},{"stadium":"Real Valladolid","country":"Spain","region":"","tournament":"Spanish La Liga","start":"2023-01-14 13:00","match":"Real Valladolid vs Rayo Vallecano"},{"stadium":"Accrington Stanley","country":"United Kingdom","region":"","tournament":"Sky Bet League One","start":"2023-01-14 15:00","match":"Accrington Stanley vs Bristol Rovers"}]
/// cricket : [{"stadium":"Eden Gardens, Kolkata","country":"India","region":"","tournament":"India v Sri Lanka ODI Series 2023","start":"2023-01-12 08:00","match":"India v Sri Lanka"},{"stadium":"Harare Sports Club","country":"Zimbabwe","region":"","tournament":"Zimbabwe v Ireland Twenty20 Series 2023","start":"2023-01-12 11:00","match":"Zimbabwe v Ireland"},{"stadium":"National Stadium, Karachi","country":"Pakistan","region":"","tournament":"Pakistan v New Zealand ODI Series 2022/23","start":"2023-01-13 09:30","match":"Pakistan v New Zealand"}]
/// golf : [{"stadium":"Waialae Country Club,Hawaii","country":"United States of America","region":"","tournament":"Sony Open in Hawaii Round 1","start":"2023-01-12 17:10","match":"Jonathan Byrd, Matthias Schwab, Brendan Steele"},{"stadium":"Waialae Country Club,Hawaii","country":"United States of America","region":"","tournament":"Sony Open in Hawaii Round 1","start":"2023-01-12 17:10","match":"Christiaan Bezuidenhout, Troy Merritt, Kyle Stanley"},{"stadium":"Waialae Country Club,Hawaii","country":"United States of America","region":"","tournament":"Sony Open in Hawaii Round 1","start":"2023-01-12 17:20","match":"Michael Kim, Parker McLachlin, Doc Redman"},{"stadium":"Waialae Country Club,Hawaii","country":"United States of America","region":"","tournament":"Sony Open in Hawaii Round 1","start":"2023-01-12 17:20","match":"Emiliano Grillo, Chesson Hadley, Alex Smalley"},{"stadium":"Waialae Country Club,Hawaii","country":"United States of America","region":"","tournament":"Sony Open in Hawaii Round 1","start":"2023-01-12 17:30","match":"K.J. Choi, Mark Hubbard, Andrew Putnam"},{"stadium":"Waialae Country Club,Hawaii","country":"United States of America","region":"","tournament":"Sony Open in Hawaii Round 1","start":"2023-01-12 17:30","match":"Chris Kirk, Kelly Kraft, Maverick McNealy"},{"stadium":"Waialae Country Club,Hawaii","country":"United States of America","region":"","tournament":"Sony Open in Hawaii Round 1","start":"2023-01-12 17:40","match":"Stewart Cink, Jim Herman, Si Woo Kim"},{"stadium":"Waialae Country Club,Hawaii","country":"United States of America","region":"","tournament":"Sony Open in Hawaii Round 1","start":"2023-01-12 17:40","match":"Cameron Davis, Lucas Glover, Chad Ramey"},{"stadium":"Waialae Country Club,Hawaii","country":"United States of America","region":"","tournament":"Sony Open in Hawaii Round 1","start":"2023-01-12 17:50","match":"Harris English, Adam Svensson, Michael Thompson"},{"stadium":"Waialae Country Club,Hawaii","country":"United States of America","region":"","tournament":"Sony Open in Hawaii Round 1","start":"2023-01-12 17:50","match":"Russell Henley, Tom Hoge, Matt Kuchar"}]

class WeatherSports {

  List<Football>? football;
  List<Cricket>? cricket;
  List<Golf>? golf;
  String? code ;
  String? message ;

  WeatherSports({
      this.football, 
      this.cricket, 
      this.golf,
       this.code ,
       this.message});

  WeatherSports.fromJson(dynamic json) {
    if (json['football'] != null) {
      football = [];
      json['football'].forEach((v) {
        football?.add(Football.fromJson(v));
      });
    }
    if (json['cricket'] != null) {
      cricket = [];
      json['cricket'].forEach((v) {
        cricket?.add(Cricket.fromJson(v));
      });
    }
    if (json['golf'] != null) {
      golf = [];
      json['golf'].forEach((v) {
        golf?.add(Golf.fromJson(v));
      });
    }
    message = json['code'];
    code = json['message'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (football != null) {
      map['football'] = football?.map((v) => v.toJson()).toList();
    }
    if (cricket != null) {
      map['cricket'] = cricket?.map((v) => v.toJson()).toList();
    }
    if (golf != null) {
      map['golf'] = golf?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// stadium : "Waialae Country Club,Hawaii"
/// country : "United States of America"
/// region : ""
/// tournament : "Sony Open in Hawaii Round 1"
/// start : "2023-01-12 17:10"
/// match : "Jonathan Byrd, Matthias Schwab, Brendan Steele"

class Golf {

  String? stadium;
  String? country;
  String? region;
  String? tournament;
  String? start;
  String? match;

  Golf({
      this.stadium, 
      this.country, 
      this.region, 
      this.tournament, 
      this.start, 
      this.match,});

  Golf.fromJson(dynamic json) {
    stadium = json['stadium'];
    country = json['country'];
    region = json['region'];
    tournament = json['tournament'];
    start = json['start'];
    match = json['match'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stadium'] = stadium;
    map['country'] = country;
    map['region'] = region;
    map['tournament'] = tournament;
    map['start'] = start;
    map['match'] = match;
    return map;
  }

}

/// stadium : "Eden Gardens, Kolkata"
/// country : "India"
/// region : ""
/// tournament : "India v Sri Lanka ODI Series 2023"
/// start : "2023-01-12 08:00"
/// match : "India v Sri Lanka"

class Cricket {
  String? stadium;
  String? country;
  String? region;
  String? tournament;
  String? start;
  String? match;

  Cricket({
      this.stadium, 
      this.country, 
      this.region, 
      this.tournament, 
      this.start, 
      this.match,});

  Cricket.fromJson(dynamic json) {
    stadium = json['stadium'];
    country = json['country'];
    region = json['region'];
    tournament = json['tournament'];
    start = json['start'];
    match = json['match'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stadium'] = stadium;
    map['country'] = country;
    map['region'] = region;
    map['tournament'] = tournament;
    map['start'] = start;
    map['match'] = match;
    return map;
  }

}

/// stadium : "Imortal Albufeira"
/// country : "Portugal"
/// region : ""
/// tournament : "International Match"
/// start : "2023-01-12 17:00"
/// match : "Finland vs Estonia"

class Football {
  String? stadium;
  String? country;
  String? region;
  String? tournament;
  String? start;
  String? match;

  Football({
      this.stadium, 
      this.country, 
      this.region, 
      this.tournament, 
      this.start, 
      this.match,});

  Football.fromJson(dynamic json) {
    stadium = json['stadium'];
    country = json['country'];
    region = json['region'];
    tournament = json['tournament'];
    start = json['start'];
    match = json['match'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stadium'] = stadium;
    map['country'] = country;
    map['region'] = region;
    map['tournament'] = tournament;
    map['start'] = start;
    map['match'] = match;
    return map;
  }

}