import 'package:movie_booking_mobile/providers/global_model.dart';
import 'package:movie_booking_mobile/providers/movie_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> getProviders() {
  return [
    ChangeNotifierProvider(create: (context) => GlobalModel()),
    ChangeNotifierProvider(create: (context) => MovieModel()),
  ];
}