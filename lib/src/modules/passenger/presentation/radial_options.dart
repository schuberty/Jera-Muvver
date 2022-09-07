import 'package:jera_muvver/src/modules/passenger/data/model/radial_option.dart';

class PassengerRadialOptions {
  static final availableTransportList = <RadialOption>[
    RadialOption(asset: "ic_car.png", name: "Carro"),
    RadialOption(asset: "ic_aviao.png", name: "Avião"),
    RadialOption(asset: "ic_caminhao.png", name: "Caminhão"),
    RadialOption(asset: "ic_van.png", name: "Van"),
    RadialOption(asset: "ic_moto.png", name: "Moto"),
    RadialOption(asset: "ic_bike.png", name: "Bicicleta"),
    RadialOption(asset: "ic_trem.png", name: "Trem"),
    RadialOption(asset: "ic_bus.png", name: "Ônibus"),
    RadialOption(asset: "ic_barco.png", name: "Embarcação"),
  ];

  static final availablePackageList = <RadialOption>[
    RadialOption(asset: 'ic_email.png', name: "Envelope", description: ""),
    RadialOption(asset: 'ic_book.png', name: "Livro", description: ""),
    RadialOption(asset: 'ic_box.png', name: "Caixa de sapato", description: ""),
    RadialOption(asset: 'ic_backpack.png', name: "Mochila", description: ""),
    RadialOption(asset: 'ic_mala.png', name: "Mala grande", description: ""),
    RadialOption(asset: 'ic_big_box.png', name: "Caixa grande", description: ""),
  ];
}
