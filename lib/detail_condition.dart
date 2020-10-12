class Condition {
  int sendFee(int amount) {
    if (amount > 0 && amount <= 10000) {
      return 400;
    } else if (amount > 10000 && amount <= 25000) {
      return 700;
    } else if (amount > 25000 && amount <= 50000) {
      return 1000;
    } else if (amount > 50000 && amount <= 100000) {
      return 1500;
    } else if (amount > 100000 && amount <= 150000) {
      return 2000;
    }else if(amount>150000 && amount<=200000){
      return 2500;
    }else if(amount>200000 && amount<=300000){
      return 3000;
    }else if(amount>300000 && amount<=400000){
      return 4000;
    }else if(amount>400000 && amount<=500000){
      return 4500;
    }else if(amount>500000 && amount<=600000){
      return 5400;
    }else if(amount>600000 && amount<=700000){
      return 6000;
    }else if(amount>700000 && amount<=800000){
      return 6700;
    }else if(amount>800000&& amount<=900000){
      return 7400;
    }else if(amount>900000 && amount<=1000000){
      return 8000;

    }else return 0;

  }

  int sendCom(int amount) {
    if (amount > 0 && amount <= 10000) {
      return 69;
    } else if (amount > 10000 && amount <= 25000) {
      return 123;
    } else if (amount > 25000 && amount <= 50000) {
      return 147;
    } else if (amount > 50000 && amount <= 100000) {
      return 196;
    } else if (amount > 100000 && amount <= 150000) {
      return 294;
    }else if(amount>150000 && amount<=200000){
      return 392;
    }else if(amount>200000 && amount<=300000){
      return 490;
    }else if(amount>300000 && amount<=400000){
      return 653;
    }else if(amount>400000 && amount<=500000){
      return 735;
    }else if(amount>500000 && amount<=600000){
      return 882;
    }else if(amount>600000 && amount<=700000){
      return 980;
    }else if(amount>700000 && amount<=800000){
      return 1094;
    }else if(amount>800000&& amount<=900000){
      return 1209;
    }else if(amount>900000 && amount<=1000000){
      return 1307;

    }else return 0;

  }

  int receiveCom(int amount) {
    if (amount > 0 && amount <= 10000) {
      return 88;
    } else if (amount > 10000 && amount <= 25000) {
      return 172;
    } else if (amount > 25000 && amount <= 50000) {
      return 245;
    } else if (amount > 50000 && amount <= 100000) {
      return 392;
    } else if (amount > 100000 && amount <= 150000) {
      return 490;
    }else if(amount>150000 && amount<=200000){
      return 588;
    }else if(amount>200000 && amount<=300000){
      return 686;
    }else if(amount>300000 && amount<=400000){
      return 915;
    }else if(amount>400000 && amount<=500000){
      return 1029;
    }else if(amount>500000 && amount<=600000){
      return 1235;
    }else if(amount>600000 && amount<=700000){
      return 1372;
    }else if(amount>700000 && amount<=800000){
      return 1532;
    }else if(amount>800000&& amount<=900000){
      return 1692;
    }else if(amount>900000 && amount<=1000000){
      return 1829;

    }else return 0;

  }

  int phoneBailCom(int amount){
    num bailCom=0.05*amount;
    return bailCom;
  }

}
