enum TransportType {
  car("ic_car.png", "Carro"),
  plane("ic_aviao.png", "Avião"),
  truck("ic_caminhao.png", "Caminhão"),
  van("ic_van.png", "Van"),
  motorcycle("ic_moto.png", "Moto"),
  bike("ic_bike.png", "Bicicleta"),
  train("ic_trem.png", "Trem"),
  bus("ic_bus.png", "Ônibus"),
  ship("ic_barco.png", "Embarcação");

  final String iconAsset;
  final String transportName;

  const TransportType(this.iconAsset, this.transportName);
}
