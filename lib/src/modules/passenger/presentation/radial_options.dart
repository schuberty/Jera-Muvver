import 'package:jera_muvver/src/modules/passenger/domain/model/radial_option.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/model/package_type_option_model.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/model/package_weight_option_model.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/model/transport_type_option_model.dart';

class PassengerRadialOptions {
  static final availableTransportList = <RadialOptionBase>[
    TransportTypeOptionModel(asset: "ic_car.png", name: "Carro"),
    TransportTypeOptionModel(asset: "ic_aviao.png", name: "Avião"),
    TransportTypeOptionModel(asset: "ic_caminhao.png", name: "Caminhão"),
    TransportTypeOptionModel(asset: "ic_van.png", name: "Van"),
    TransportTypeOptionModel(asset: "ic_moto.png", name: "Moto"),
    TransportTypeOptionModel(asset: "ic_bike.png", name: "Bicicleta"),
    TransportTypeOptionModel(asset: "ic_trem.png", name: "Trem"),
    TransportTypeOptionModel(asset: "ic_bus.png", name: "Ônibus"),
    TransportTypeOptionModel(asset: "ic_barco.png", name: "Embarcação"),
  ];

  static final availablePackageTypeList = <RadialOptionBase>[
    PackageTypeOptionModel(asset: 'ic_email.png', name: "Envelope", description: "9 x 13 cm"),
    PackageTypeOptionModel(asset: 'ic_book.png', name: "Livro", description: "15 x 22 cm"),
    PackageTypeOptionModel(asset: 'ic_box.png', name: "Caixa de sapato", description: "32 x 20 cm"),
    PackageTypeOptionModel(asset: 'ic_backpack.png', name: "Mochila", description: "40 x 30 cm"),
    PackageTypeOptionModel(asset: 'ic_mala.png', name: "Mala grande", description: "55 x 35 cm"),
    PackageTypeOptionModel(
        asset: 'ic_big_box.png', name: "Caixa grande", description: "60 x 40 cm"),
  ];

  static final availablePackageWeightList = <RadialOptionBase>[
    PackageWeightOptionModel(asset: "ic_balance.png", name: "Até 1 kg"),
    PackageWeightOptionModel(asset: "ic_balance.png", name: "Até 5 kg"),
    PackageWeightOptionModel(asset: "ic_balance.png", name: "Até 10 kg"),
    PackageWeightOptionModel(asset: "ic_balance.png", name: "Até 20 kg"),
    PackageWeightOptionModel(asset: "ic_balance.png", name: "Acima de 20 kg"),
  ];
}
