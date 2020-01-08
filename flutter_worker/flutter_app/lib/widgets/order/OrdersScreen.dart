import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/demo_paging_post/BottomLoader.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';


import 'order_bloc.dart';
import 'order_event.dart';
import 'order_state.dart';
import 'order_widget.dart';


class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _scrollController = ScrollController();
  final OrderBloc _orderItemBloc = OrderBloc(httpClient: http.Client());
  final _scrollThreshold = 200.0;

  _OrderScreenState(){
    _scrollController.addListener(_onScroll);
    _orderItemBloc.dispatch(Fetch());
  }
  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _orderItemBloc.dispatch(Fetch());
    }
  }

   @override
  void dispose() {
    _orderItemBloc.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Orders'),
        ),
        body: BlocBuilder(
          bloc: _orderItemBloc,
          builder: (BuildContext context, OrderState state){
            if (state is OrderUninitialized){
              return Center(child: CircularProgressIndicator(),);
            }

            if (state is OrderError){
              return Center(child: Text('failed to fetch orders'),);
            }

            if (state is OrderLoaded){
                if (state.orderItems.isEmpty){
                  return Center(child: Text('no orders'),);
                }
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index){
                    return index >= state.orderItems.length ?  BottomLoader() : Padding(
                      padding: const EdgeInsets.fromLTRB(16,0,16,8),
                      child: OrderWidget(order: state.orderItems[index]),
                    );
                  },
                  itemCount: state.hasReachMax ? state.orderItems.length : state.orderItems.length + 1,
                  controller: _scrollController,
                );
            }
          },
        ) ,
      ),
    );
  }
}