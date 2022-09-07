import 'package:jera_muvver/src/modules/passenger/domain/model/radial_option.dart';

class PassengerRadialOptions {
  static final availableTransportList = <RadialOptionModel>[
    RadialOptionModel(asset: "ic_car.png", name: "Carro"),
    RadialOptionModel(asset: "ic_aviao.png", name: "Avião"),
    RadialOptionModel(asset: "ic_caminhao.png", name: "Caminhão"),
    RadialOptionModel(asset: "ic_van.png", name: "Van"),
    RadialOptionModel(asset: "ic_moto.png", name: "Moto"),
    RadialOptionModel(asset: "ic_bike.png", name: "Bicicleta"),
    RadialOptionModel(asset: "ic_trem.png", name: "Trem"),
    RadialOptionModel(asset: "ic_bus.png", name: "Ônibus"),
    RadialOptionModel(asset: "ic_barco.png", name: "Embarcação"),
  ];

  static final availablePackageTypeList = <RadialOptionModel>[
    RadialOptionModel(asset: 'ic_email.png', name: "Envelope", description: "9 x 13 cm"),
    RadialOptionModel(asset: 'ic_book.png', name: "Livro", description: "15 x 22 cm"),
    RadialOptionModel(asset: 'ic_box.png', name: "Caixa de sapato", description: "32 x 20 cm"),
    RadialOptionModel(asset: 'ic_backpack.png', name: "Mochila", description: "40 x 30 cm"),
    RadialOptionModel(asset: 'ic_mala.png', name: "Mala grande", description: "55 x 35 cm"),
    RadialOptionModel(asset: 'ic_big_box.png', name: "Caixa grande", description: "60 x 40 cm"),
  ];

  static final availablePackageWeightList = <RadialOptionModel>[
    RadialOptionModel(asset: "ic_balance.png", name: "Até 1 kg"),
    RadialOptionModel(asset: "ic_balance.png", name: "Até 5 kg"),
    RadialOptionModel(asset: "ic_balance.png", name: "Até 10 kg"),
    RadialOptionModel(asset: "ic_balance.png", name: "Até 20 kg"),
    RadialOptionModel(asset: "ic_balance.png", name: "Acima de 20 kg"),
  ];
}
