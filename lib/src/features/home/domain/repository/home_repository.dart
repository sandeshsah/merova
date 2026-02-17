import '../entity/home_entity.dart';

abstract class HomeRepository {
  Future<HomeEntity> getHomeData();
  Future<List<TransactionEntity>> getRecentTransactions();
}
