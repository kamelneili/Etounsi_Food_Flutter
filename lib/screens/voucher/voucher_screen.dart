import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamelfoodapp/blocs/basket/basket_bloc.dart';
import 'package:kamelfoodapp/models/voucher_model.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          title: Text('Voucher'),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).accentColor,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Apply"),
              )
            ],
          )),
        ),
        //*
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text("Enter a voucher code"),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Voucher code',
                                contentPadding: const EdgeInsets.all(10))))
                  ],
                ),
              ),
              Text("Your vouchers"),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: Voucher.vouchers.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      //*
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1x'),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(child: Text(Voucher.vouchers[index].code)),
                          BlocBuilder<BasketBloc, BasketState>(
                            builder: (context, state) {
                              return TextButton(
                                  onPressed: () {
                                    context.read<BasketBloc>().add(
                                        AddVoucher(Voucher.vouchers[index]));
                                    Navigator.pop(context);
                                  },
                                  child: Text('Apply'));
                            },
                          ),
                        ],
                      ),
                      //
                    );
                  })
            ],
          ),
        ));
  }
}
