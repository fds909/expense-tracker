class ExpenseModel {
  String uuid;
  double amount;
  String? description;
  DateTime createdOn;

  ExpenseModel({
    required this.uuid,
    required this.amount,
    required this.description,
    required this.createdOn,
  });

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      uuid: map['uuid'],
      amount: map['amount'],
      description: map['description'],
      createdOn: DateTime.fromMillisecondsSinceEpoch(map['created_on']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'amount': amount,
      'description': description,
      'created_on': createdOn.millisecondsSinceEpoch,
    };
  }
}
