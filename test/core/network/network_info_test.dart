import 'package:clean_tdd/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class MockDataConnecitionChecker extends Mock implements DataConnectionChecker {
}

void main() {
  NetworkInfoImpl networkInfo;
  MockDataConnecitionChecker mockDataConnecitionChecker;

  setUp(() {
    mockDataConnecitionChecker = MockDataConnecitionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnecitionChecker);
  });

  group('isConnected', () {
    test(
      'should forward the call to DataConnectionCheck.hasConnection',
      () async {
        // arrrange
        final tHasConnectionFuture = Future.value(true);

        when(mockDataConnecitionChecker.hasConnection)
            .thenAnswer((_) => tHasConnectionFuture);
        // act
        final result = networkInfo.isConnected;
        // assert
        verify(mockDataConnecitionChecker.hasConnection);
        expect(result, tHasConnectionFuture);
      },
    );
  });
}
