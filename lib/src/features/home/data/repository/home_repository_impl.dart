import 'package:merova/src/features/home/domain/entity/home_entity.dart';
import 'package:merova/src/features/home/domain/repository/home_repository.dart';
import 'package:merova/src/features/home/data/datasource/home_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<HomeEntity> getHomeData() async {
    return await dataSource.getHomeData();
  }

  @override
  Future<List<TransactionEntity>> getRecentTransactions() async {
    return await dataSource.getRecentTransactions();
  }
}
