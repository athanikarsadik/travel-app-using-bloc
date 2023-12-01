import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/pages/detail_pages.dart/cubit/store_page_info_states.dart';

class StorePageInfoCubits extends Cubit<List<StorePageInfoStates>>{
  StorePageInfoCubits():super([]);

  addPageInfo(String? name,int? index){
    emit([StorePageInfoStates(name: name,index: index), ...state]);
  }

  updatePageInfo(String? name,int? index){
    var list = state;
    for(int i=0;i<list.length;i++){
      if(list[i].name == name){
        state.removeAt(i);
      }
    }
    emit([StorePageInfoStates(name: name,index: index), ...state]);
  }
  
} 