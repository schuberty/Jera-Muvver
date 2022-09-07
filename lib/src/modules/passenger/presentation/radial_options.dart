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
    RadialOption(asset: 'ic_email.png', name: "Envelope", description: "9 x 13 cm"),
    RadialOption(asset: 'ic_book.png', name: "Livro", description: "15 x 22 cm"),
    RadialOption(asset: 'ic_box.png', name: "Caixa de sapato", description: "32 x 20 cm"),
    RadialOption(asset: 'ic_backpack.png', name: "Mochila", description: "40 x 30 cm"),
    RadialOption(asset: 'ic_mala.png', name: "Mala grande", description: "55 x 35 cm"),
    RadialOption(asset: 'ic_big_box.png', name: "Caixa grande", description: "60 x 40 cm"),
  ];

  static final availableWeightList = <RadialOption>[
    RadialOption(asset: "ic_balance.png", name: "Até 1 kg"),
    RadialOption(asset: "ic_balance.png", name: "Até 5 kg"),
    RadialOption(asset: "ic_balance.png", name: "Até 10 kg"),
    RadialOption(asset: "ic_balance.png", name: "Até 20 kg"),
    RadialOption(asset: "ic_balance.png", name: "Acima de 20 kg"),
  ];
}
