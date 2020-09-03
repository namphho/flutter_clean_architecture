import 'package:basecleanarchitecture/di/dependency_injection.dart';
import 'package:basecleanarchitecture/presentation/screens/base/base_view_state.dart';
import 'package:basecleanarchitecture/presentation/screens/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseViewState<HomeViewModel, HomeScreen> {
  _HomeScreenState() : super(DependencyInjection.instance.get<HomeViewModel>());


  @override
  Widget buildPage(BuildContext context) {
	return Scaffold(
	  body: SafeArea(
		child: Container(
		  color: Colors.blue,
		  child: Column(
			mainAxisAlignment: MainAxisAlignment.center,
			crossAxisAlignment: CrossAxisAlignment.stretch,
			children: [
			  RaisedButton(
				onPressed: (){
				  print("abc");
				  model.getMovies();
				},
				child: Text('click here'),
			  ),
			],
		  ),
		),
	  ),
	);
  }
}
