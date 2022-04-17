import 'package:mobx/mobx.dart';
import 'package:wattio_frontend/data/infos.dart';
part 'slider_store.g.dart';

class SliderStore = _SliderStoreBase with _$SliderStore;

abstract class _SliderStoreBase with Store {
  // Singleton SliderStore
  static SliderStore? _instance;

  @observable
  int actualValue = 1000;

  @observable
  ObservableList<Map<String, dynamic>> businessList =
      ObservableList<Map<String, dynamic>>();

  @action
  SliderStore getInstance() => _instance ??= SliderStore();

  @action
  void getListOfBusiness({required int value}) {
    businessList.clear();
    for (Map<String, dynamic> business in infos) {
      int minV = int.tryParse(business['valorMinimoMensal'].toString()) ?? 0;
      int maxV = int.tryParse(business['valorMaximoMensal'].toString()) ?? 0;

      if (minV <= value && maxV >= value) {
        businessList.add(business);
      }
    }
  }
}
