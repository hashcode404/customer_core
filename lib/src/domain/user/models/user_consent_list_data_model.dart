// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserConsentRawDataModel {
  final UserConsentDataModel? consentList;
  final UserConsentUserDetailsDataModel? userData;
  UserConsentRawDataModel({
    this.consentList,
    this.userData,
  });

  UserConsentRawDataModel copyWith({
    UserConsentDataModel? consentList,
    UserConsentUserDetailsDataModel? userData,
  }) {
    return UserConsentRawDataModel(
      consentList: consentList ?? this.consentList,
      userData: userData ?? this.userData,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'consentList': consentList?.toMap(),
      'userData': userData?.toMap(),
    };
  }

  factory UserConsentRawDataModel.fromMap(Map<String, dynamic> map) {
    return UserConsentRawDataModel(
      consentList: map['consentList'] != null
          ? UserConsentDataModel.fromMap(
              map['consentList'] as Map<String, dynamic>)
          : null,
      userData: map['userData'] != null
          ? UserConsentUserDetailsDataModel.fromMap(
              map['userData'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserConsentRawDataModel.fromJson(String source) =>
      UserConsentRawDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserConsentRawDataModel(consentList: $consentList, userData: $userData)';

  @override
  bool operator ==(covariant UserConsentRawDataModel other) {
    if (identical(this, other)) return true;

    return other.consentList == consentList && other.userData == userData;
  }

  @override
  int get hashCode => consentList.hashCode ^ userData.hashCode;
}

class UserConsentDataModel {
  final String? shopID;
  final UserConsentSubDataModel? transactional;
  final UserConsentSubDataModel? promotional;
  final UserConsentSubDataModel? newsletter;
  UserConsentDataModel({
    this.shopID,
    this.transactional,
    this.promotional,
    this.newsletter,
  });

  UserConsentDataModel copyWith({
    String? shopID,
    UserConsentSubDataModel? transactional,
    UserConsentSubDataModel? promotional,
    UserConsentSubDataModel? newsletter,
  }) {
    return UserConsentDataModel(
      shopID: shopID ?? this.shopID,
      transactional: transactional ?? this.transactional,
      promotional: promotional ?? this.promotional,
      newsletter: newsletter ?? this.newsletter,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shopID': shopID,
      'transactional': transactional?.toMap(),
      'promotional': promotional?.toMap(),
      'newsletter': newsletter?.toMap(),
    };
  }

  factory UserConsentDataModel.fromMap(Map<String, dynamic> map) {
    return UserConsentDataModel(
      shopID: map['shopID'] != null ? map['shopID'] as String : null,
      transactional: map['transactional'] != null
          ? UserConsentSubDataModel.fromMap(
              map['transactional'] as Map<String, dynamic>)
          : null,
      promotional: map['promotional'] != null
          ? UserConsentSubDataModel.fromMap(
              map['promotional'] as Map<String, dynamic>)
          : null,
      newsletter: map['newsletter'] != null
          ? UserConsentSubDataModel.fromMap(
              map['newsletter'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserConsentDataModel.fromJson(String source) =>
      UserConsentDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserConsentDataModel(shopID: $shopID, transactional: $transactional, promotional: $promotional, newsletter: $newsletter)';
  }

  @override
  bool operator ==(covariant UserConsentDataModel other) {
    if (identical(this, other)) return true;

    return other.shopID == shopID &&
        other.transactional == transactional &&
        other.promotional == promotional &&
        other.newsletter == newsletter;
  }

  @override
  int get hashCode {
    return shopID.hashCode ^
        transactional.hashCode ^
        promotional.hashCode ^
        newsletter.hashCode;
  }
}

class UserConsentSubDataModel {
  final String? title;
  final String? content;
  UserConsentSubDataModel({
    this.title,
    this.content,
  });

  UserConsentSubDataModel copyWith({
    String? title,
    String? content,
  }) {
    return UserConsentSubDataModel(
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
    };
  }

  factory UserConsentSubDataModel.fromMap(Map<String, dynamic> map) {
    return UserConsentSubDataModel(
      title: map['title'] != null ? map['title'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserConsentSubDataModel.fromJson(String source) =>
      UserConsentSubDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserConsentSubDataModel(title: $title, content: $content)';

  @override
  bool operator ==(covariant UserConsentSubDataModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.content == content;
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode;
}

class UserConsentUserDetailsDataModel {
  final String? userID;
  final String? userFirstName;
  final String? userLastName;
  final String? userEmail;
  final String? userMobile;
  final UserConsentDetailsDataModel? consents;
  UserConsentUserDetailsDataModel({
    this.userID,
    this.userFirstName,
    this.userLastName,
    this.userEmail,
    this.userMobile,
    this.consents,
  });

  UserConsentUserDetailsDataModel copyWith({
    String? userID,
    String? userFirstName,
    String? userLastName,
    String? userEmail,
    String? userMobile,
    UserConsentDetailsDataModel? consents,
  }) {
    return UserConsentUserDetailsDataModel(
      userID: userID ?? this.userID,
      userFirstName: userFirstName ?? this.userFirstName,
      userLastName: userLastName ?? this.userLastName,
      userEmail: userEmail ?? this.userEmail,
      userMobile: userMobile ?? this.userMobile,
      consents: consents ?? this.consents,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userID': userID,
      'userFirstName': userFirstName,
      'userLastName': userLastName,
      'userEmail': userEmail,
      'userMobile': userMobile,
      'consents': consents?.toMap(),
    };
  }

  factory UserConsentUserDetailsDataModel.fromMap(Map<String, dynamic> map) {
    return UserConsentUserDetailsDataModel(
      userID: map['userID'] != null ? map['userID'] as String : null,
      userFirstName:
          map['userFirstName'] != null ? map['userFirstName'] as String : null,
      userLastName:
          map['userLastName'] != null ? map['userLastName'] as String : null,
      userEmail: map['userEmail'] != null ? map['userEmail'] as String : null,
      userMobile:
          map['userMobile'] != null ? map['userMobile'] as String : null,
      consents: map['consents'] != null
          ? UserConsentDetailsDataModel.fromMap(
              map['consents'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserConsentUserDetailsDataModel.fromJson(String source) =>
      UserConsentUserDetailsDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserConsentUserDetailsDataModel(userID: $userID, userFirstName: $userFirstName, userLastName: $userLastName, userEmail: $userEmail, userMobile: $userMobile, consents: $consents)';
  }

  @override
  bool operator ==(covariant UserConsentUserDetailsDataModel other) {
    if (identical(this, other)) return true;

    return other.userID == userID &&
        other.userFirstName == userFirstName &&
        other.userLastName == userLastName &&
        other.userEmail == userEmail &&
        other.userMobile == userMobile &&
        other.consents == consents;
  }

  @override
  int get hashCode {
    return userID.hashCode ^
        userFirstName.hashCode ^
        userLastName.hashCode ^
        userEmail.hashCode ^
        userMobile.hashCode ^
        consents.hashCode;
  }
}

class UserConsentDetailsDataModel {
  final String? id;
  final String? transactional;
  final String? promotional;
  final String? newsletter;
  final String? updatedTime;
  UserConsentDetailsDataModel({
    this.id,
    this.transactional,
    this.promotional,
    this.newsletter,
    this.updatedTime,
  });

  UserConsentDetailsDataModel copyWith({
    String? id,
    String? transactional,
    String? promotional,
    String? newsletter,
    String? updatedTime,
  }) {
    return UserConsentDetailsDataModel(
      id: id ?? this.id,
      transactional: transactional ?? this.transactional,
      promotional: promotional ?? this.promotional,
      newsletter: newsletter ?? this.newsletter,
      updatedTime: updatedTime ?? this.updatedTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'transactional': transactional,
      'promotional': promotional,
      'newsletter': newsletter,
      'updatedTime': updatedTime,
    };
  }

  factory UserConsentDetailsDataModel.fromMap(Map<String, dynamic> map) {
    return UserConsentDetailsDataModel(
      id: map['id'] != null ? map['id'] as String : null,
      transactional:
          map['transactional'] != null ? map['transactional'] as String : null,
      promotional:
          map['promotional'] != null ? map['promotional'] as String : null,
      newsletter:
          map['newsletter'] != null ? map['newsletter'] as String : null,
      updatedTime:
          map['updatedTime'] != null ? map['updatedTime'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserConsentDetailsDataModel.fromJson(String source) =>
      UserConsentDetailsDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserConsentDetailsDataModel(id: $id, transactional: $transactional, promotional: $promotional, newsletter: $newsletter, updatedTime: $updatedTime)';
  }

  @override
  bool operator ==(covariant UserConsentDetailsDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.transactional == transactional &&
        other.promotional == promotional &&
        other.newsletter == newsletter &&
        other.updatedTime == updatedTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        transactional.hashCode ^
        promotional.hashCode ^
        newsletter.hashCode ^
        updatedTime.hashCode;
  }
}
