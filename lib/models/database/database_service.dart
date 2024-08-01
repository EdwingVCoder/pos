import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pos/objectbox.g.dart';

class DatabaseService {
  late final Store store;

  DatabaseService._create(this.store);

  static Future<DatabaseService> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: join(docsDir.path, 'pos'));
    return DatabaseService._create(store);
  }
}
