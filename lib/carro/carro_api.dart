import 'package:carros/carro/carro.dart';

class CarroApi {
  static List<Carro> getCarros() {
    final carros = List<Carro>();

    carros.add(Carro(nome: "Mustang GT", urlFoto: "https://s2.glbimg.com/EHilP0NhYVdrx5qE8jQ1w8XoLy8=/1200x/smart/filters:cover():strip_icc()/i.s3.glbimg.com/v1/AUTH_f035dd6fd91c438fa04ab718d608bbaa/internal_photos/bs/2019/w/I/4MLWEbQHaeoZVqB0nKpg/mustang.jpg"));
    carros.add(Carro(nome: "Poshe", urlFoto: "https://fotos.jornaldocarro.estadao.com.br/uploads/2019/10/02155243/45326304.jpg"));
    carros.add(Carro(nome: "Buggat", urlFoto: "https://i.ytimg.com/vi/4gAF0lYV5Bg/maxresdefault.jpg"));
    return carros;
  }
}