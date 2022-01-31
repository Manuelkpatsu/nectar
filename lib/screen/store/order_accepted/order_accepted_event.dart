abstract class OrderAcceptedEvent {}

class TrackOrderEvent extends OrderAcceptedEvent {}

class BackToHomeEvent extends OrderAcceptedEvent {}
