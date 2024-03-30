class Dashboard {
  List<Overview>? overview;
  Dailyactivity? dailyactivity;

  Dashboard({this.overview, this.dailyactivity});

  Dashboard.fromJson(Map<String, dynamic> json) {
    if (json['overview'] != null) {
      overview = <Overview>[];
      json['overview'].forEach((v) {
        overview!.add(Overview.fromJson(v));
      });
    }
    dailyactivity = json['dailyactivity'] != null
        ? Dailyactivity.fromJson(json['dailyactivity'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (overview != null) {
      data['overview'] = overview!.map((v) => v.toJson()).toList();
    }
    if (dailyactivity != null) {
      data['dailyactivity'] = dailyactivity!.toJson();
    }
    return data;
  }
}

class Overview {
  String? title;
  int? value;

  Overview({this.title, this.value});

  Overview.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['value'] = value;
    return data;
  }
}

class Dailyactivity {
  int? noofsteps;
  List<Overview>? moredata;

  Dailyactivity({this.noofsteps, this.moredata});

  Dailyactivity.fromJson(Map<String, dynamic> json) {
    noofsteps = json['noofsteps'];
    if (json['moredata'] != null) {
      moredata = <Overview>[];
      json['moredata'].forEach((v) {
        moredata!.add(Overview.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['noofsteps'] = noofsteps;
    if (moredata != null) {
      data['moredata'] = moredata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
