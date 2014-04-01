within ;
package control "modelo y control a corto plazo" 
  
  partial model compartimentogeneral 
    annotation (Diagram, Icon(
        Rectangle(extent=[-66, 48; -8, -52], style(fillColor=54)),
        Text(
          extent=[-64, 32; -10, -8],
          style(fillColor=69, fillPattern=7),
          string="compartimento"),
        Text(
          extent=[-52, 8; -22, -4],
          style(fillColor=69, fillPattern=7),
          string="general")));
    Modelica.Blocks.Interfaces.RealInput 
                                      flujent 
      annotation (extent=[-84, 30; -68, 50]);
    Modelica.Blocks.Math.Add Add1(k1=-1) annotation (extent=[-60, 24; -40, 44]);
    Modelica.Blocks.Continuous.Integrator Integrator1(y_start=scalar(c)) 
      annotation (extent=[-28, 24; -8, 44]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       volusal 
      annotation (extent=[-8, 26; 8, 44]);
    Modelica.Blocks.Math.Product Product1 annotation (extent=[-60, -12; -40, 8]);
    Modelica.Blocks.Interfaces.RealInput 
                                      elastancia 
      annotation (extent=[-82, -4; -66, 14]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       presisal 
      annotation (extent=[-8, -4; 10, 12]);
    Modelica.Blocks.Math.Add Add2(k1=-1) 
      annotation (extent=[-54, -42; -34, -22]);
    Modelica.Blocks.Interfaces.RealInput 
                                      present 
      annotation (extent=[-84, -36; -66, -18]);
    Modelica.Blocks.Math.Product Product2 annotation (extent=[-18, -48; 2, -28]);
    Modelica.Blocks.Sources.Constant admitancia(k=scalar(admitancia)) 
      annotation (extent=[-54, -72; -34, -52]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       flujsal 
      annotation (extent=[-8, -34; 8, -16]);
  equation 
    connect(flujent,Add1.u1) 
      annotation (points=[-76, 40; -62, 40], style(color=3));
    connect(Add1.y,Integrator1.u) 
      annotation (points=[-39, 34; -30, 34], style(color=3));
    connect(Integrator1.y,       volusal) 
      annotation (points=[-7, 34; 18.5, 34; 18.5, 35; 0, 35], style(color=3));
    connect(Integrator1.y,Product1.u1)             annotation (points=[-7, 34;
          -8, 34; -8, 12; -70, 12; -70, 4; -62, 4], style(color=3));
    connect(elastancia,Product1.u2) 
      annotation (points=[-74, 5; -73, 5; -73, -8; -62, -8], style(color=3));
    connect(Product1.y,       presisal) 
      annotation (points=[-39, -2; -19.5, -2; -19.5, 4; 1, 4], style(color=3));
    connect(present,Add2.u2)       annotation (points=[-75, -27; -58.5, -27; -58.5,
           -38; -56, -38], style(color=3));
    connect(Product1.y,Add2.u1)             annotation (points=[-39, -2; -38, -2;
           -38, -18; -66, -18; -66, -26; -56, -26], style(color=3));
    connect(Add2.y,Product2.u1) 
      annotation (points=[-33, -32; -20, -32], style(color=3));
    connect(admitancia.y,Product2.u2)             annotation (points=[-33, -62;
           -26, -62; -26, -44; -20, -44], style(color=3));
    connect(Product2.y,       flujsal) 
      annotation (points=[3, -38; 6.5, -38; 6.5, -25; 0, -25], style(color=3));
    connect(Product2.y,Add1.u2)             annotation (points=[3, -38; 4, -38;
           4, -14; -72, -14; -72, 28; -62, 28], style(color=3));
  end compartimentogeneral;
  
  model circulacion 
    annotation (Diagram);
    venderecho venderecho1 annotation (extent=[-108, -20; -10, 62]);
    venizquierdo venizquierdo1 annotation (extent=[-42, -26; 46, 60]);
    circulacionsistemica circulacionsistemica1 
      annotation (extent=[-78, -112; 8, -46]);
    modulocontrol modulocontrol1 annotation (extent=[18, -102; 84, 0]);
    arteriaaorta arteriaaorta1 annotation (extent=[-52, -68; 34, 6]);
    sistemapulmonarterial sistemapulmonarterial1 
      annotation (extent=[-122, 34; -18, 118]);
    sistemapulmonarvenoso sistemapulmonarvenoso1 
      annotation (extent=[-60, 20; 36, 112]);
    venacava venacava1 annotation (extent=[-114, -70; -18, 12]);
    Modelica.Blocks.Sources.Clock Clock1 
      annotation (extent=[-22, -82; -12, -72]);
    Modelica.Blocks.Logical.LogicalSwitch          LogicalSwitch1 
      annotation (extent=[14, -92; 22, -68]);
    Modelica.Blocks.Sources.BooleanConstant BooleanConstant1 
      annotation (extent=[-2, -64; 10, -54]);
    Modelica.Blocks.Sources.BooleanConstant BooleanConstant2(k=false) 
      annotation (extent=[-6, -100; 8, -90]);
    Modelica.Blocks.Logical.GreaterEqualThreshold GreaterEqual1(threshold=0) 
      annotation (extent=[-8, -82; 8, -72]);
    Modelica.Blocks.Math.Division Division1 
      annotation (extent=[88, -88; 100, -76]);
    Modelica.Blocks.Math.Division Division2 
      annotation (extent=[88, -72; 100, -60]);
    Modelica.Blocks.Math.Division Division3 annotation (extent=[84, -12; 96, 0]);
    Modelica.Blocks.Sources.Constant Constant2 
      annotation (extent=[72, -30; 82, -20]);
    Modelica.Blocks.Sources.Constant Constant3(k=60) 
      annotation (extent=[52, 2; 64, 12]);
    Modelica.Blocks.Sources.Constant hemorragia(k=0) 
      annotation (extent=[-130, -86; -116, -74]);
    Modelica.Blocks.Sources.Constant ingesta(k=0) 
      annotation (extent=[-130, -64; -116, -52]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       VPA 
      annotation (extent=[-42, 88; -32, 100]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       VPV annotation (extent=[26, 80; 36, 92]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       VVD 
      annotation (extent=[-38, 52; -28, 64]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       VVI annotation (extent=[34, 42; 44, 54]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       VVC 
      annotation (extent=[-48, -20; -38, -8]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       VAO 
      annotation (extent=[16, -22; 26, -10]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       VCS 
      annotation (extent=[-22, -66; -12, -54]);
  equation 
    connect(LogicalSwitch1.y,       modulocontrol1.activado) annotation (points=
         [22.4, -80; 38, -80; 38, -77.01; 31.2, -77.01], style(
        color=5,
        gradient=2,
        fillColor=58));
    connect(Clock1.y,GreaterEqual1.u)             annotation (points=[-11.5, -77;
           -9.6, -77], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(GreaterEqual1.y,LogicalSwitch1.u2)             annotation (points=[
          8.8, -77; 9.4, -77; 9.4, -80; 13.2, -80], style(
        color=5,
        gradient=2,
        fillColor=58));
    connect(BooleanConstant2.y,LogicalSwitch1.u3)             annotation (
        points=[8.7,-95; 13.35,-95; 13.35,-89.6; 13.2,-89.6],     style(
        color=5,
        gradient=2,
        fillColor=58));
    connect(BooleanConstant1.y,LogicalSwitch1.u1)             annotation (
        points=[10.6,-59; 10.6,-62.5; 13.2,-62.5; 13.2,-70.4],     style(
        color=5,
        gradient=2,
        fillColor=58));
    connect(modulocontrol1.HR,Division3.u2)       annotation (points=[72.78,
          -11.22; 74.39, -11.22; 74.39, -9.6; 82.8, -9.6], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(Constant3.y,Division3.u1)             annotation (points=[64.6, 7;
          72.3, 7; 72.3, -2.4; 82.8, -2.4], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(Constant2.y,Division2.u1)             annotation (points=[82.5, -25;
           82.5, -62.4; 86.8, -62.4], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(Constant2.y,Division1.u1)             annotation (points=[82.5, -25;
           84, -78; 86.8, -78.4], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(modulocontrol1.CV,Division2.u2)       annotation (points=[72.78, -64.77;
           79.39, -64.77; 79.39, -69.6; 86.8, -69.6], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(modulocontrol1.RS,Division1.u2)       annotation (points=[73.11, -83.64;
           80.555, -83.64; 80.555, -85.6; 86.8, -85.6], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(sistemapulmonarvenoso1.FSP, sistemapulmonarterial1.FSP) annotation (
       points=[2.88, 69.68; 18, 69.68; 18, 102; -104, 102; -104, 90.28; -92.36,
           90.28], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(venderecho1.PVD, sistemapulmonarterial1.PVD) annotation (points=[-51.16,
           29.2; -44, 29.2; -44, 50; -100, 50; -100, 78.1; -92.88, 78.1], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(venizquierdo1.FVM, sistemapulmonarvenoso1.FMV) annotation (points=[
          6.84, 14.42; 26, 14.42; 26, 50; -42, 50; -42, 84.4; -32.16, 84.4],
        style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(sistemapulmonarterial1.PAP, sistemapulmonarvenoso1.PPA) annotation (
       points=[-55.44, 81.88; -43.72, 81.88; -43.72, 68.76; -30.72, 68.76],
        style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(sistemapulmonarterial1.FVP, venderecho1.FVP) annotation (points=[-55.44,
           73.06; -55.44, 52; -102, 52; -102, 39.04; -90.85, 39.04], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(Division3.y,       venderecho1.HR) annotation (points=[96.6, -6; 94,
           -6; 94, 16; 34, 16; 34, 0; -106, 0; -106, 30; -90.85, 30; -90.85,
          30.84], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(modulocontrol1.EVderecho, venderecho1.EVderecho) annotation (points=
         [72.78, -35.7; 100, -35.7; 100, 24; 30, 24; 30, -2; -104, -2; -104,
          21.82; -91.34, 21.82], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(venacava1.PVC, venderecho1.PVC) annotation (points=[-56.88, -24.08;
           -44, -24.08; -44, -4; -100, -4; -100, 12.8; -91.34, 12.8], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(arteriaaorta1.FVA, venizquierdo1.FVA) annotation (points=[3.47,
          -38.03; 20, -38.03; 20, 4; -36, 4; -36, 37.64; -27.92, 37.64], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(Division3.y,       venizquierdo1.HR1) annotation (points=[96.6, -6;
           94, -6; 94, 16; 34, 16; 34, 0; -40, 0; -40, 28.61; -28.36, 28.61],
        style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(modulocontrol1.EVizquierda, venizquierdo1.EVizquierdo) annotation (
        points=[72.45, -49.98; 106, -49.98; 106, 34; 28, 34; 28, 2; -34, 2; -34,
           20.44; -27.92, 20.44], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(sistemapulmonarvenoso1.PPV, venizquierdo1.PPV) annotation (points=[
          4.32, 78.42; 4.32, 48; -42, 48; -42, 10.55; -27.48, 10.55], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(venderecho1.FVT, venacava1.FVT) annotation (points=[-50.67, 20.59;
          -50.67, 2; -98, 2; -98, -15.47; -90, -15.47], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(Division2.y,       venacava1.Elastancia) annotation (points=[100.6,
           -66; 110, -66; 110, -106; -102, -106; -102, -24.49; -90, -24.49],
        style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(circulacionsistemica1.PCS, venacava1.PCS) annotation (points=[-30.27,
           -75.04; -30.27, -52; -98, -52; -98, -33.51; -90, -33.51], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(circulacionsistemica1.FAS, arteriaaorta1.FAS) annotation (points=[
          -30.7, -85.93; -30.5, -85.93; -30.5, -17.31], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(venizquierdo1.PVI, arteriaaorta1.PVI) annotation (points=[6.84,
          25.6; 6.84, -4; -36, -4; -36, -32.48; -29.64, -32.48], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(venacava1.FSV, circulacionsistemica1.FSV) annotation (points=[
          -56.88, -32.28; -56.88, -52; -80, -52; -80, -57.22; -65.96, -57.22],
        style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(ingesta.y,       circulacionsistemica1.ingesta) annotation (points=
          [-115.3, -58; -91.19, -58; -91.19, -65.14; -65.96, -65.14], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(hemorragia.y,       circulacionsistemica1.hemorragia) annotation (
        points=[-115.3, -80; -92, -80; -92, -73.72; -65.53, -73.72], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(arteriaaorta1.PAO, circulacionsistemica1.PAO) annotation (points=[
          4.76, -28.41; 24, -28.41; 24, -104; -84, -104; -84, -81.97; -66.39, -81.97],
         style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(Division1.y,       circulacionsistemica1.admitancia) annotation (
        points=[100.6, -82; 104, -82; 104, -102; -74, -102; -74, -89.56; -65.53,
           -89.56], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(arteriaaorta1.PAO, modulocontrol1.PAO) annotation (points=[4.76, -28.41;
           24, -28.41; 24, -32.64; 31.86, -32.64], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(sistemapulmonarterial1.VPA, VPA) annotation (points=[-55.44, 90.28;
           -46.72, 90.28; -46.72, 94; -37, 94], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(sistemapulmonarvenoso1.VPV, VPV) annotation (points=[3.36, 87.62;
          15.68, 87.62; 15.68, 86; 31, 86], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(venderecho1.VVD, VVD) annotation (points=[-50.67, 39.04; -50.67, 58;
           -33, 58], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(venizquierdo1.VVI, VVI) annotation (points=[6.84, 38.5; 21.42, 38.5;
           21.42, 48; 39, 48], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(venacava1.VVC, VVC) annotation (points=[-56.88, -15.88; -51.44, -15.88;
           -51.44, -14; -43, -14], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(arteriaaorta1.VAO, VAO) annotation (points=[4.76, -19.16; 13.38, -19.16;
           13.38, -16; 21, -16], style(
        color=3,
        gradient=2,
        fillColor=58));
    connect(circulacionsistemica1.VCS, VCS) annotation (points=[-30.7, -64.15;
          -22.35, -64.15; -22.35, -60; -17, -60], style(
        color=3,
        gradient=2,
        fillColor=58));
  end circulacion;
  
  partial model limite "accion de la valvula" 
    Modelica.Blocks.Interfaces.RealInput 
                                      incpres 
      "presion entrada - presion de salida" 
      annotation (extent=[-56, 20; -40, 38]);
    annotation (Diagram, Icon(Rectangle(extent=[-34, 16; 0, -6], style(
              fillColor=67)), Text(extent=[-28, 8; -6, 6], string="limite")));
    Modelica.Blocks.Sources.Constant cero(k=0) 
      annotation (extent=[-56, -44; -38, -26]);
    Modelica.Blocks.Logical.Switch          Switch1 
      annotation (extent=[-6, -8; 14, 12]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       OutPort1 
      annotation (extent=[44, -6; 60, 12]);
    Modelica.Blocks.Logical.GreaterEqualThreshold GreaterEqual1(threshold=0) 
      annotation (extent=[-56, -14; -36, 6]);
  equation 
    connect(incpres,Switch1.u1) 
      annotation (points=[-48, 29; -33, 29; -33, 9; -8, 9], style(color=3));
    connect(cero.y,Switch1.u3)             annotation (points=[-37.1, -35; -19.55,
           -35; -19.55, -5; -8, -5], style(color=3));
    connect(Switch1.y,       OutPort1) 
      annotation (points=[15, 2; 12.5, 2; 12.5, 3; 52, 3], style(color=3));
    connect(GreaterEqual1.y,Switch1.u2) 
      annotation (points=[-35, -4; -4, -4; -4, 2; -8, 2], style(color=5));
    connect(incpres,GreaterEqual1.u)       annotation (points=[-48, 29; -68, 29;
           -68, -4; -58, -4], style(
        color=3,
        gradient=2,
        fillColor=58));
  end limite;
  
  partial model compartimentoconvalvula 
    Modelica.Blocks.Interfaces.RealInput 
                                      flujent "flujo de entrada" 
      annotation (extent=[-70, 28; -54, 44]);
    Modelica.Blocks.Math.Add Add1(k1=-1) annotation (extent=[-58, 22; -38, 42]);
    annotation (Diagram, Icon(
        Rectangle(extent=[-52, 50; -4, -40], style(fillColor=69)),
        Text(extent=[-44, 32; -6, 8], string="compartimento"),
        Text(extent=[-40, 12; -20, 10], string="con"),
        Text(extent=[-46, 4; -14, -2], string="válvula")));
    Modelica.Blocks.Continuous.Integrator Integrator1 
      annotation (extent=[-28, 22; -8, 42]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       volsal "volumen de salida" 
      annotation (extent=[-4, 24; 10, 42]);
    Modelica.Blocks.Math.Product Product1 annotation (extent=[-24, -12; -4, 8]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       pressal "presion de salida" 
      annotation (extent=[-4, 2; 12, 20]);
    Modelica.Blocks.Math.Add Add2(k1=-1) 
      annotation (extent=[-68, -46; -48, -26], rotation=-90);
    Modelica.Blocks.Interfaces.RealInput 
                                      present "presion de entrada" 
      annotation (extent=[-70, -30; -52, -12]);
    limite limite1 annotation (extent=[-84, -118; 6, -16]);
    Modelica.Blocks.Math.Product Product2 annotation (extent=[-18, -64; 2, -44]);
    Modelica.Blocks.Sources.Constant admitancia(k=1) 
      annotation (extent=[-44, -46; -28, -30]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       flujsal "Flujo de salida" 
      annotation (extent=[-4, -20; 12, -4]);
    Modelica.Blocks.Interfaces.RealInput 
                                      ELASTAN "elastancia" 
      annotation (extent=[-68, 2; -52, 18]);
  equation 
    connect(flujent,Add1.u1)       annotation (points=[-62, 36; -60, 36; -60,
          38], style(
        color=3,
        fillColor=67,
        fillPattern=1));
    connect(Add1.y,Integrator1.u)             annotation (points=[-37, 32; -30,
           32], style(
        color=3,
        fillColor=67,
        fillPattern=1));
    connect(Integrator1.y,       volsal) annotation (points=[-7, 32; 4, 32; 4,
          33; 3, 33], style(
        color=3,
        fillColor=67,
        fillPattern=1));
    connect(Integrator1.y,Product1.u1)             annotation (points=[-7, 32;
          -8, 32; -8, 16; -26, 16; -26, 4], style(
        color=3,
        fillColor=67,
        fillPattern=1));
    connect(Product1.y,       pressal) annotation (points=[-3, -2; -2.5, -2; -2.5,
           11; 4, 11], style(
        color=3,
        fillColor=67,
        fillPattern=1));
    connect(Product1.y,Add2.u1)             annotation (points=[-3, -2; -2, -2;
           -2, -16; -16, -16; -16, -24; -52, -24], style(
        color=3,
        fillColor=67,
        fillPattern=1));
    connect(present,Add2.u2)       annotation (points=[-61, -21; -64.5, -21; -64.5,
           -24; -64, -24], style(
        color=3,
        fillColor=67,
        fillPattern=1));
    connect(Add2.y,       limite1.incpres) annotation (points=[-58, -47; -67.26,
           -47; -67.26, -52.21; -60.6, -52.21], style(
        color=3,
        fillColor=67,
        fillPattern=1));
    connect(admitancia.y,Product2.u1)             annotation (points=[-27.2, -38;
           -14, -38; -14, -48; -20, -48], style(color=3));
    connect(limite1.OutPort1,Product2.u2)       annotation (points=[-15.6, -65.47;
           -21.25, -65.47; -21.25, -60; -20, -60], style(color=3));
    connect(Product2.y,       flujsal) 
      annotation (points=[3, -54; 8, -54; 8, -12; 4, -12], style(color=3));
    connect(Product2.y,Add1.u2)             annotation (points=[3, -54; 0, -54;
           0, -20; -66, -20; -66, 26; -60, 26], style(color=3));
    connect(ELASTAN,Product1.u2) 
      annotation (points=[-60, 10; -52, 10; -52, -8; -26, -8], style(color=3));
  end compartimentoconvalvula;
  
  partial model pulsos 
    Modelica.Blocks.Interfaces.RealInput 
                                      InPort1 
      annotation (extent=[-70, -6; -58, 10]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       OutPort1 
      annotation (extent=[-14, -8; 0, 10]);
    Modelica.Blocks.Sources.Clock Clock1 annotation (extent=[-78, 46; -60, 64]);
    Modelica.Blocks.Math.Division Division1 
      annotation (extent=[-80, -12; -60, 8]);
    annotation (Diagram, Icon(Ellipse(extent=[-58, 12; -14, -10], style(
              fillColor=67)), Text(extent=[-48, 2; -20, -2], string="pulsos")));
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[-98, 10; -80, 26]);
    Modelica.Blocks.Math.Product Product1 annotation (extent=[-18, 46; 2, 66]);
    Modelica.Blocks.Math.Product Product2 annotation (extent=[-48, -16; -28, 4]);
    Modelica.Blocks.Math.Add Add1(k2=-1) annotation (extent=[44, -14; 64, 6]);
    Modelica.Blocks.Sources.Constant Constant2(k=0.5) 
      annotation (extent=[-30, -48; -12, -32]);
    Modelica.Blocks.Math.Add Add2(k1=1, k2=-1) 
      annotation (extent=[-22, -16; -2, 4]);
    Modelica.Blocks.Math.RealToInteger RealToInteger1 
      annotation (extent=[8, -16; 28, 4]);
  equation 
    connect(Constant1.y,Division1.u1) 
      annotation (points=[-79.1, 18; -82, 18; -82, 4], style(color=3));
    connect(InPort1,Division1.u2) 
      annotation (points=[-64, 2; -84, 2; -84, -8; -82, -8], style(color=3));
    connect(Clock1.y,Product1.u1)             annotation (points=[-59.1, 55; -54,
           54; -42, 54; -42, 62; -20, 62], style(color=3));
    connect(Clock1.y,Product2.u2)             annotation (points=[-59.1, 55; -42,
           55; -42, -12; -50, -12], style(color=3));
    connect(Division1.y,Product2.u1) 
      annotation (points=[-59, -2; -44, -2; -44, 0; -50, 0], style(color=3));
    connect(Division1.y,Product1.u2) 
      annotation (points=[-59, -2; -34, -2; -34, 50; -20, 50], style(color=3));
    connect(Product1.y,Add1.u1) 
      annotation (points=[3, 56; 14, 56; 14, 2; 42, 2], style(color=3));
    connect(Add1.y,       OutPort1) 
      annotation (points=[65, -4; 72, -4; 72, 1; -7, 1], style(color=3));
    connect(Product2.y,Add2.u1) 
      annotation (points=[-27, -6; 0, -6; 0, 0; -24, 0], style(color=3));
    connect(Constant2.y,Add2.u2)             annotation (points=[-11.1, -40; -4,
           -40; -4, -12; -24, -12], style(color=3));
    connect(Add2.y,RealToInteger1.u) 
      annotation (points=[-1, -6; 6, -6], style(color=3));
    connect(RealToInteger1.y,Add1.u2) 
      annotation (points=[29, -6; 36, -6; 36, -10; 42, -10], style(color=45));
  end pulsos;
  
  partial model ventriculo 
    Modelica.Blocks.Interfaces.RealInput 
                                      EV "Entrada al ventriculo" 
      annotation (extent=[-80, 4; -64, 20]);
    annotation (Diagram, Icon(Rectangle(extent=[-64, 52; 0, -70], style(
              fillColor=69, fillPattern=7)), Text(
          extent=[-54, 14; -4, -10],
          style(fillColor=69, fillPattern=7),
          string="ventriculo")));
    Modelica.Blocks.Math.Product Product1 
      annotation (extent=[-76, -24; -58, -8]);
    Modelica.Blocks.Interfaces.RealInput 
                                      Maxelas "Maximo de la eslastancia " 
      annotation (extent=[-80, -24; -64, -6]);
    Modelica.Blocks.Sources.Constant Einicial(k=scalar(elastancia)) 
      "Elastancia inicial del ventriculo" 
      annotation (extent=[-78, -78; -62, -62]);
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[-76, -54; -60, -38]);
    Modelica.Blocks.Math.Division Division1 
      annotation (extent=[-48, -60; -28, -40]);
    Modelica.Blocks.Math.Product Product2 annotation (extent=[-18, -34; 0, -18]);
    Modelica.Blocks.Interfaces.RealInput 
                                      FEV "Flujo entrada al ventriculo" 
      annotation (extent=[-80, 32; -66, 46]);
    compartimentoconvalvula compartimentoconvalvula1 
      annotation (extent=[-6, -68; 108, 28]);
    Modelica.Blocks.Interfaces.RealInput 
                                      PEV "Presion de entrada al ventriculo" 
      annotation (extent=[-78, -48; -64, -30]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       FSV "Flujo de salida del ventriculo" 
      annotation (extent=[0, -42; 14, -28]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       VSV "Volumen de salida del ventriculo" 
      annotation (extent=[0, 24; 14, 38]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       PSV "Presion de salida del ventriculo" 
      annotation (extent=[0, -8; 14, 8]);
  equation 
    connect(Maxelas,Product1.u2)       annotation (points=[-72, -15; -90, -15;
          -90, -20.8; -77.8, -20.8], style(
        color=3,
        fillColor=67,
        fillPattern=1));
    connect(Constant1.y,Division1.u1)             annotation (points=[-59.2, -46;
           -56, -46; -56, -44; -50, -44], style(
        color=3,
        fillColor=67,
        fillPattern=1));
    connect(Einicial.y,Division1.u2)             annotation (points=[-61.2, -70;
           -54, -70; -54, -56; -50, -56], style(
        color=3,
        fillColor=67,
        fillPattern=1));
    connect(Product1.y,Product2.u1)             annotation (points=[-57.1, -16;
           -38, -16; -38, -21.2; -19.8, -21.2], style(
        color=3,
        fillColor=67,
        fillPattern=1));
    connect(Division1.y,Product2.u2)             annotation (points=[-27, -50;
          -24, -50; -24, -30.8; -19.8, -30.8], style(
        color=3,
        fillColor=67,
        fillPattern=1));
    connect(EV,Product1.u1)       annotation (points=[-72, 12; -88, 12; -88, -11.2;
           -77.8, -11.2], style(color=3));
    connect(FEV, compartimentoconvalvula1.flujent) annotation (points=[-73, 39;
           -41.5, 39; -41.5, -2.72; 15.66, -2.72], style(color=3));
    connect(Product2.y,       compartimentoconvalvula1.ELASTAN) annotation (
        points=[0.9, -26; 6, -26; 6, -15.2; 16.8, -15.2], style(color=3));
    connect(PEV, compartimentoconvalvula1.present) annotation (points=[-71, -39;
           4, -39; 4, -30.08; 16.23, -30.08], style(color=3));
    connect(compartimentoconvalvula1.volsal, VSV) annotation (points=[52.71, -4.16;
           52.71, 23.92; 7, 23.92; 7, 31], style(color=3));
    connect(compartimentoconvalvula1.pressal, PSV) annotation (points=[53.28, -14.72;
           62.64, -14.72; 62.64, 0; 7, 0], style(color=3));
    connect(compartimentoconvalvula1.flujsal, FSV) annotation (points=[53.28, -25.76;
           53.28, -45.88; 7, -45.88; 7, -35], style(color=3));
  end ventriculo;
  
  model venderecho "Ventriculo derecho" 
    ventriculo ventriculo1(compartimentoconvalvula1(admitancia(k=78),
          Integrator1(y_start=150)),
                                  Einicial(k=0.87)) 
      annotation (extent=[-48, -32; 64, 62]);
    Modelica.Blocks.Interfaces.RealInput 
                                      FVP "Flujo valvula pulmonar" 
      annotation (extent=[-72, 36; -58, 52]);
    annotation (Diagram, Icon(
        Rectangle(extent=[-58, 68; 10, -40], style(gradient=2, fillColor=1)),
        Text(extent=[-48, 50; -2, 32], string="ventriculo "),
        Text(extent=[-70, 34; 18, 22], string="derecho")));
    Modelica.Blocks.Interfaces.RealInput 
                                      HR "Duracion de un ciclo cardiaco" 
      annotation (extent=[-72, 16; -58, 32]);
    pulsos pulsos1 annotation (extent=[-98, -18; -32, 60]);
    Modelica.Blocks.Interfaces.RealInput 
                                      EVderecho 
      "Maximo de la elastancia en el ventriculo derecho" 
      annotation (extent=[-74, -6; -58, 10]);
    Modelica.Blocks.Interfaces.RealInput 
                                      PVC "Presion vena cava" 
      annotation (extent=[-74, -28; -58, -12]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       VVD "Volumen ventriculo derecho" 
      annotation (extent=[10, 36; 24, 52]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       PVD "Presion ventriculo derecho" 
      annotation (extent=[10, 12; 22, 28]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       FVT "Flujo valvula tricuspide" 
      annotation (extent=[10, -8; 24, 6]);
    Modelica.Blocks.Tables.CombiTable1D   CombiTable1D1(table=[0,0.0066; 0.0625,
          0.16; 0.125,0.32; 0.1875,0.45; 0.25,0.625; 0.3125,0.78; 0.375,0.27; 
          0.4375,0.0066; 1,0.0066]) 
                             annotation (extent=[-60, 10; -40, 30]);
  equation 
    connect(FVP, ventriculo1.FEV) annotation (points=[-65, 44; -56, 44; -56,
          33.33; -32.88, 33.33], style(
        color=3,
        fillColor=1,
        fillPattern=1));
    connect(HR, pulsos1.InPort1) annotation (points=[-65, 24; -75.56, 24; -75.56,
           21.78; -86.12, 21.78], style(
        color=3,
        fillColor=1,
        fillPattern=1));
    connect(EVderecho, ventriculo1.Maxelas) annotation (points=[-66, 2; -54, 2;
           -54, 7.95; -32.32, 7.95], style(
        color=3,
        fillColor=1,
        fillPattern=1));
    connect(PVC, ventriculo1.PEV) annotation (points=[-66, -20; -54, -20; -54,
          -3.33; -31.76, -3.33], style(
        color=3,
        fillColor=1,
        fillPattern=1));
    connect(ventriculo1.VSV, VVD) annotation (points=[11.92, 29.57; 11.92,
          38.785; 17, 38.785; 17, 44], style(
        color=3,
        fillColor=1,
        fillPattern=1));
    connect(ventriculo1.PSV, PVD) annotation (points=[11.92, 15; 20.96, 15;
          20.96, 20; 16, 20], style(
        color=3,
        fillColor=1,
        fillPattern=1));
    connect(ventriculo1.FSV, FVT) annotation (points=[11.92, -1.45; 18.96, -1.45;
           18.96, -1; 17, -1], style(
        color=3,
        fillColor=1,
        fillPattern=1));
    connect(pulsos1.OutPort1,CombiTable1D1.u[1])    annotation (points=[-67.31,
           21.39; -64.655, 21.39; -64.655, 20; -62, 20], style(
        color=3,
        gradient=2,
        fillColor=1));
    connect(CombiTable1D1.y[1],    ventriculo1.EV) annotation (points=[-39, 20;
           -38, 20; -38, 20.64; -32.32, 20.64], style(
        color=3,
        gradient=2,
        fillColor=1));
  end venderecho;
  
  model venizquierdo "ventriculo izquierdo" 
    ventriculo ventriculo1(compartimentoconvalvula1(admitancia(k=17),
          Integrator1(y_start=150)),
                                  Einicial(k=0.8)) 
      annotation (extent=[-46, -22; 68, 68]);
    Modelica.Blocks.Interfaces.RealInput 
                                      FVA "Flujo valvula aortica" 
      annotation (extent=[-76, 40; -60, 56]);
    Modelica.Blocks.Interfaces.RealInput 
                                      HR1 "Duracion del ciclo cardiaco" 
      annotation (extent=[-76, 20; -62, 34]);
    Modelica.Blocks.Interfaces.RealInput 
                                      EVizquierdo 
      "Maximo de la elastancia del ventriculo izquierdo" 
      annotation (extent=[-76, 0; -60, 16]);
    Modelica.Blocks.Interfaces.RealInput 
                                      PPV "Presion sistema pulmonar venoso" 
      annotation (extent=[-74, -24; -60, -6]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       VVI "Volumen ventriculo izquierdo" 
      annotation (extent=[4, 42; 18, 58]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       PVI "Presion ventriculo izquierdo" 
      annotation (extent=[4, 12; 18, 28]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       FVM "Flujo valvula mitral" 
      annotation (extent=[4, -14; 18, 2]);
    annotation (Diagram, Icon(
        Rectangle(extent=[-60, 66; 4, -38], style(fillColor=1)),
        Text(extent=[-72, 48; 12, 36], string="ventriculo"),
        Text(extent=[-62, 34; 2, 22], string="izquierdo")));
    pulsos pulsos1 annotation (extent=[-88, -6; -24, 60]);
    Modelica.Blocks.Tables.CombiTable1D   CombiTable1D1(table=[0,0.0033; 0.0625,
          0.41; 0.125,0.63; 0.1875,0.73; 0.25,0.8; 0.3125,0.76; 0.375,0.25; 
          0.4375,0.0033; 1,0.0033]) 
                            annotation (extent=[-52, 20; -36, 36]);
  equation 
    connect(FVA, ventriculo1.FEV) annotation (points=[-68, 48; -50, 48; -50,
          40.55; -30.61, 40.55], style(
        color=3,
        gradient=2,
        fillColor=1));
    connect(HR1, pulsos1.InPort1) annotation (points=[-69, 27; -81.5, 27; -81.5,
           27.66; -76.48, 27.66], style(
        color=3,
        gradient=2,
        fillColor=1));
    connect(pulsos1.OutPort1,CombiTable1D1.u[1])    annotation (points=[-58.24,
           27.33; -58.24, 26.665; -53.6, 26.665; -53.6, 28], style(
        color=3,
        gradient=2,
        fillColor=1));
    connect(CombiTable1D1.y[1],    ventriculo1.EV) annotation (points=[-35.2,
          28; -28, 28; -28, 28.4; -30.04, 28.4], style(
        color=3,
        gradient=2,
        fillColor=1));
    connect(EVizquierdo, ventriculo1.Maxelas) annotation (points=[-68, 8; -58,
          8; -58, 16.25; -30.04, 16.25], style(
        color=3,
        gradient=2,
        fillColor=1));
    connect(PPV, ventriculo1.PEV) annotation (points=[-67, -15; -59.5, -15; -59.5,
           5.45; -29.47, 5.45], style(
        color=3,
        gradient=2,
        fillColor=1));
    connect(ventriculo1.VSV, VVI) annotation (points=[14.99, 36.95; 34.495,
          36.95; 34.495, 50; 11, 50], style(
        color=3,
        gradient=2,
        fillColor=1));
    connect(ventriculo1.PSV, PVI) annotation (points=[14.99, 23; 36.495, 23;
          36.495, 20; 11, 20], style(
        color=3,
        gradient=2,
        fillColor=1));
    connect(ventriculo1.FSV, FVM) annotation (points=[14.99, 7.25; 41.495, 7.25;
           41.495, -6; 11, -6], style(
        color=3,
        gradient=2,
        fillColor=1));
  end venizquierdo;
  
  model circulacionsistemica 
    Modelica.Blocks.Interfaces.RealInput 
                                      FSV 
      "Flujo circulación sistémica-vena cava" 
      annotation (extent=[-80, 56; -64, 76]);
    Modelica.Blocks.Continuous.Integrator Integrator1(y_start=3340) 
      annotation (extent=[-18, 34; 2, 54]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       VCS "Volumen circulación sistémica" 
      annotation (extent=[2, 36; 18, 54]);
    Modelica.Blocks.Math.Product Product1 annotation (extent=[-50, -2; -30, 18]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       PCS "Presión circulación sistémica" 
      annotation (extent=[2, 4; 20, 20]);
    Modelica.Blocks.Math.Add Add2(k1=-1) 
      annotation (extent=[-44, -32; -24, -12]);
    Modelica.Blocks.Interfaces.RealInput 
                                      PAO "Presión aórtica" 
      annotation (extent=[-82, -18; -64, 0]);
    Modelica.Blocks.Math.Product Product2 annotation (extent=[-8, -38; 12, -18]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       FAS 
      "Flujo aorta-circulación sistémica" 
      annotation (extent=[2, -30; 18, -12]);
    Modelica.Blocks.Math.Add3 Add3_1(k1=-1, k3=-1) 
      annotation (extent=[-64, 58; -44, 78]);
    Modelica.Blocks.Interfaces.RealInput 
                                      ingesta "Volumen líquido ingesta" 
      annotation (extent=[-80, 34; -64, 50]);
    Modelica.Blocks.Interfaces.RealInput 
                                      hemorragia "Volumen líquido hemorragia" 
      annotation (extent=[-78, 8; -64, 24], style(fillColor=43));
    Modelica.Blocks.Math.Add Add1 annotation (extent=[-48, 34; -28, 54]);
    Modelica.Blocks.Sources.Constant elastancia(k=0.0153) 
      annotation (extent=[-72, -6; -56, 8]);
    Modelica.Blocks.Interfaces.RealInput 
                                      admitancia 
      annotation (extent=[-78, -40; -64, -24]);
  equation 
    connect(Integrator1.y,       VCS) 
      annotation (points=[3, 44; 28.5, 44; 28.5, 45; 10, 45], style(color=3));
    connect(Integrator1.y,Product1.u1)             annotation (points=[3, 44; 2,
           44; 2, 22; -60, 22; -60, 14; -52, 14], style(color=3));
    connect(Product1.y,       PCS) 
      annotation (points=[-29, 8; -9.5, 8; -9.5, 12; 11, 12], style(color=3));
    connect(PAO,Add2.u2)       annotation (points=[-73, -9; -48.5, -9; -48.5, -28;
           -46, -28], style(color=3));
    connect(Product1.y,Add2.u1)             annotation (points=[-29, 8; -28, 8;
           -28, -8; -56, -8; -56, -16; -46, -16], style(color=3));
    connect(Add2.y,Product2.u1) 
      annotation (points=[-23, -22; -10, -22], style(color=3));
    connect(Product2.y,       FAS) annotation (points=[13, -28; 16.5, -28; 16.5,
           -21; 10, -21], style(color=3));
    annotation (Diagram, Icon(
        Rectangle(extent=[-64, 74; 2, -66], style(fillColor=43, fillPattern=1)),
        Text(extent=[-58, 44; -2, 30], string="circulacion"),
        Text(extent=[-60, 30; -4, 16], string="sistemica")));
    connect(FSV,Add3_1.u1)       annotation (points=[-72, 66; -74, 66; -74, 76;
           -66, 76], style(
        color=3,
        fillColor=1,
        fillPattern=1));
    
    connect(ingesta,Add3_1.u2)       annotation (points=[-72, 42; -76, 42; -76,
           68; -66, 68], style(
        color=3,
        fillColor=1,
        fillPattern=1));
    connect(hemorragia,Add3_1.u3)       annotation (points=[-71, 16; -72, 16; -72,
           42; -66, 42; -66, 60], style(
        color=3,
        fillColor=1,
        fillPattern=1));
    connect(Add3_1.y,Add1.u1)             annotation (points=[-43, 68; -36, 68;
           -36, 50; -50, 50], style(
        color=3,
        fillColor=1,
        fillPattern=1));
    connect(Add1.y,Integrator1.u)             annotation (points=[-27, 44; -20,
           44], style(
        color=3,
        fillColor=1,
        fillPattern=1));
    connect(elastancia.y,Product1.u2)             annotation (points=[-55.2, 1;
           -64.6, 1; -64.6, 2; -52, 2], style(
        color=3,
        fillColor=1,
        fillPattern=1));
    connect(admitancia,Product2.u2)       annotation (points=[-71, -32; -40.5,
          -32; -40.5, -34; -10, -34], style(
        color=3,
        fillColor=1,
        fillPattern=1));
    connect(Product2.y,Add1.u2)             annotation (points=[13, -28; 14, -28;
           14, -54; -64, -54; -64, 38; -50, 38], style(
        color=3,
        fillColor=1,
        fillPattern=1));
  end circulacionsistemica;
  
  partial model modulocontrol "modulo de control" 
    Modelica.Blocks.Interfaces.RealInput 
                                      PAO "Presion aortica" 
      annotation (extent=[-66, 28; -50, 44]);
    annotation (Diagram, Icon(
        Rectangle(extent=[-48, 96; 56, -96], style(fillColor=6, fillPattern=1)),
        Text(extent=[-72, 52; 76, 30], string="Modulo"),
        Text(extent=[-14, 24; 16, 2], string="de"),
        Text(extent=[-34, -12; 46, -38], string="Control")));
    
    media media1 annotation (extent=[-70, 44; -46, 96]);
    Modelica.Blocks.Logical.Switch          Switch1 
      annotation (extent=[-72, 2; -58, 18]);
    Modelica.Blocks.Interfaces.BooleanInput  activado 
      annotation (extent=[-68, -60; -52, -42]);
    Modelica.Blocks.Sources.Constant PAOmedia(k=103.9884) 
      "Presion aortica media de referencia" 
      annotation (extent=[-94, -22; -78, -6]);
    Modelica.Blocks.Math.Add Add1(k1=-1) annotation (extent=[-32, -4; -20, 12]);
    Modelica.Blocks.Nonlinear.DeadZone DeadZone1(uMax=0.1, uMin=-0.1) 
      annotation (extent=[-14, -6; 2, 8]);
    Modelica.Blocks.Continuous.TransferFunction H1(a={15,1}) 
      annotation (extent=[8, 60; 24, 74]);
    Modelica.Blocks.Continuous.TransferFunction H2(a={15,1}, b={0.048}) 
      annotation (extent=[10, 16; 26, 30]);
    Modelica.Blocks.Continuous.TransferFunction H3(b={0.194}, a={30,1}) 
      annotation (extent=[12, -30; 28, -16]);
    Modelica.Blocks.Continuous.TransferFunction H4(b={0.1}, a={2,1}) 
      annotation (extent=[8, -74; 24, -60]);
    Modelica.Blocks.Math.Add Add2 annotation (extent=[46, -32; 60, -18]);
    Modelica.Blocks.Math.Add Add3 annotation (extent=[46, 20; 60, 34]);
    Modelica.Blocks.Math.Add Add4 annotation (extent=[34, 78; 48, 92]);
    Modelica.Blocks.Math.Add Add5 annotation (extent=[40, -90; 54, -76]);
    Modelica.Blocks.Sources.Constant HR0(k=80) 
      "Frecuencia cardiaca de referencia" annotation (extent=[6, 82; 22, 96]);
    Modelica.Blocks.Sources.Constant EV0izquierdo(k=0.8) 
      "Elastancia ventricular izquierda maxima de referencia" 
      annotation (extent=[10, -6; 26, 8]);
    Modelica.Blocks.Sources.Constant EV0derecho(k=0.78) 
      "Elastancia ventricular derecha maxima de refencia" 
      annotation (extent=[10, 38; 26, 52]);
    Modelica.Blocks.Sources.Constant RS0(k=0.6135) 
      "Resistencia circulatoria sistemica de referencia" 
      annotation (extent=[10, -98; 26, -82]);
    Modelica.Blocks.Math.Add Add6 annotation (extent=[46, -2; 60, 12]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       HR "Frecuencia cardiaca" 
      annotation (extent=[58, 70; 74, 86]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       EVizquierda 
      "Elastancia ventricular izquierda maxima" 
      annotation (extent=[58, -6; 72, 10]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       CV "Compilancia vena cava" 
      annotation (extent=[58, -36; 74, -18]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       RS "Resistencia circulatoria sistemica" 
      annotation (extent=[58, -72; 76, -56]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       EVderecho 
      "Elastancia ventricular derecha maxima" 
      annotation (extent=[58, 22; 74, 38]);
    Modelica.Blocks.Sources.Step Step1(
      height=200, 
      offset=250, 
      startTime=20) annotation (extent=[-44, -48; -24, -28]);
  equation 
    connect(PAO, media1.PAO) annotation (points=[-58, 36; -77.46, 36; -77.46,
          72.34; -68.92, 72.34], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(media1.media,Switch1.u1)       annotation (points=[-47.32, 72.6;
          -41.66, 72.6; -41.66, 15.6; -73.4, 15.6], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(activado,Switch1.u2)       annotation (points=[-60, -51; -56, -51;
          -58, 10; -73.4, 10], style(
        color=5,
        fillColor=76,
        fillPattern=1));
    connect(PAOmedia.y,Switch1.u3)             annotation (points=[-77.2, -14;
          -68, -14; -68, 4.4; -73.4, 4.4], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(PAOmedia.y,Add1.u2)             annotation (points=[-77.2, -14; -36,
           -14; -36, -0.8; -33.2, -0.8], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(Switch1.y,Add1.u1)             annotation (points=[-57.3, 10; -43.25,
           10; -43.25, 8.8; -33.2, 8.8], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(Add1.y,DeadZone1.u)             annotation (points=[-19.4, 4; -16,
          4; -16, 1; -15.6, 1], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(DeadZone1.y,H1.u)             annotation (points=[2.8, 1; 4, 1; 4,
          67; 6.4, 67], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(DeadZone1.y,H2.u)             annotation (points=[2.8, 1; 4.6, 1;
          4.6, 23; 8.4, 23], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(DeadZone1.y,H3.u)             annotation (points=[2.8, 1; 2.8, -26;
           4, -26; 4, -23; 10.4, -23], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(DeadZone1.y,H4.u)             annotation (points=[2.8, 1; 4, -70;
          6.4, -67], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(H1.y,Add4.u2)             annotation (points=[24.8, 67; 30.4, 67;
          30.4, 80.8; 32.6, 80.8], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(H2.y,Add3.u2)             annotation (points=[26.8, 23; 33.4, 23;
          33.4, 22.8; 44.6, 22.8], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(H3.y,Add2.u1)             annotation (points=[28.8, -23; 35.4, -23;
           35.4, -20.8; 44.6, -20.8], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(HR0.y,Add4.u1)             annotation (points=[22.8, 89; 22.8, 89.5;
           32.6, 89.5; 32.6, 89.2], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(EV0derecho.y,Add3.u1)             annotation (points=[26.8, 45;
          26.8, 45.5; 44.6, 45.5; 44.6, 31.2], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(H2.y,Add6.u1)             annotation (points=[26.8, 23; 36, 23; 36,
           9.2; 44.6, 9.2], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(EV0izquierdo.y,Add6.u2)             annotation (points=[26.8, 1;
          37.4, 1; 37.4, 0.8; 44.6, 0.8], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(RS0.y,Add5.u2)             annotation (points=[26.8, -90; 34, -90;
          34, -87.2; 38.6, -87.2], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(H4.y,Add5.u1)             annotation (points=[24.8, -67; 31.4, -67;
           31.4, -78.8; 38.6, -78.8], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(Add4.y,       HR) annotation (points=[48.7, 85; 60.35, 85; 60.35,
          78; 66, 78], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(Add3.y,       EVderecho) annotation (points=[60.7, 27; 68.35, 27;
          68.35, 30; 66, 30], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(Add6.y,       EVizquierda) annotation (points=[60.7, 5; 68.35, 5;
          68.35, 2; 65, 2], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(Add2.y,       CV) annotation (points=[60.7, -25; 68.35, -25; 68.35,
           -27; 66, -27], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(Add5.y,       RS) annotation (points=[54.7, -83; 64.35, -83; 64.35,
           -64; 67, -64], style(
        color=3,
        fillColor=76,
        fillPattern=1));
    connect(Step1.y,Add2.u2)             annotation (points=[-23, -38; 12, -38;
           12, -29.2; 44.6, -29.2], style(color=3));
  end modulocontrol;
  
  partial model acumulador 
    Modelica.Blocks.Interfaces.RealInput 
                                      PAO "Presion aortica" 
      annotation (extent=[-98, 34; -84, 50]);
    annotation (Diagram, Icon(Rectangle(extent=[-40, 20; 0, -20], style(
              fillColor=83)), Text(extent=[-36, 20; -2, -16], string=
              "acumulador")));
    Modelica.Blocks.Sources.Constant cero(k=0) 
      annotation (extent=[-98, -48; -84, -34]);
    Modelica.Blocks.Logical.Switch          Switch1 
      annotation (extent=[-46, -10; -26, 10]);
    Modelica.Blocks.Interfaces.BooleanInput  subida "salida de < =" 
      annotation (extent=[-94, -10; -80, 8]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       acumulador 
      annotation (extent=[92, 16; 108, 32]);
    Modelica.Blocks.Math.Sum Sum1(nin=2) annotation (extent=[32, -12; 52, 8]);
    Modelica.Blocks.Routing.Multiplex2              Multiplex2_1 
      annotation (extent=[-8, -12; 12, 8]);
  equation 
    connect(PAO,Switch1.u1) 
      annotation (points=[-91, 42; -66, 42; -66, 7; -48, 7], style(color=3));
    connect(cero.y,Switch1.u3)             annotation (points=[-83.3, -41;
          -52.65, -41; -52.65, -7; -48, -7], style(color=3));
    connect(subida,Switch1.u2) 
      annotation (points=[-87, -1; -88, -1; -88, 0; -48, 0], style(color=5));
    connect(Sum1.y,       acumulador) 
      annotation (points=[53, -2; 76, -2; 76, 24; 100, 24], style(color=3));
    connect(Switch1.y,Multiplex2_1.u1[1]) 
      annotation (points=[-25, 0; -18, 0; -18, 4; -10, 4], style(color=3));
    connect(Multiplex2_1.y,Sum1.u) 
      annotation (points=[13, -2; 30, -2], style(color=3));
    connect(Sum1.y,Multiplex2_1.u2[1])          annotation (points=[53, -2; 56,
           -2; 56, -46; -18, -46; -18, -8; -10, -8], style(color=3));
  end acumulador;
  
  partial model contador 
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[-84, 28; -70, 44]);
    annotation (Diagram, Icon(Rectangle(extent=[-10, 24; 20, -4], style(
              fillColor=83, fillPattern=8)), Text(extent=[-8, 28; 18, -8],
            string="contador")));
    Modelica.Blocks.Interfaces.BooleanInput  subida "salida de < =" 
      annotation (extent=[-84, -10; -70, 6]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       contador 
      annotation (extent=[42, 0; 56, 18]);
    
    acumulador acumulador1 annotation (extent=[-44, -22; 20, 26]);
  equation 
    connect(Constant1.y,       acumulador1.PAO) annotation (points=[-69.3, 36;
          -56, 36; -56, 12.08; -41.12, 12.08], style(color=3));
    connect(subida, acumulador1.subida) annotation (points=[-77, -2; -58, -2;
          -58, 1.76; -39.84, 1.76], style(color=5));
    connect(acumulador1.acumulador, contador) 
      annotation (points=[20, 7.76; 34, 7.76; 34, 9; 49, 9], style(color=3));
  end contador;
  
  partial model media "calcula la presion media aortica" 
    Modelica.Blocks.Interfaces.RealInput 
                                      PAO "Presion aortica" 
      annotation (extent=[-100, 0; -82, 18]);
    annotation (Icon(Rectangle(extent=[-82, 22; 80, -4], style(fillColor=76)),
          Text(extent=[-94, 18; 82, -2], string="media")), Diagram);
    Modelica.Blocks.Discrete.UnitDelay          UnitDelay1(samplePeriod=0.03) 
      annotation (extent=[-76, -10; -60, 6]);
    Modelica.Blocks.Logical.Greater          Compare1 
      annotation (extent=[-62, 14; -42, 34]);
    Modelica.Blocks.Math.Division Division1 
      annotation (extent=[-24, 52; -10, 68]);
    Modelica.Blocks.Logical.Switch          Switch1 
      annotation (extent=[14, -2; 34, 18]);
    Modelica.Blocks.Discrete.UnitDelay          UnitDelay2(samplePeriod=0.03) 
      annotation (extent=[42, 0; 58, 16]);
    Modelica.Blocks.Logical.Switch          Switch2 
      annotation (extent=[-24, -50; -4, -30]);
    Modelica.Blocks.Logical.Greater          Compare2 
      annotation (extent=[-64, -48; -44, -28]);
    Modelica.Blocks.Discrete.UnitDelay          UnitDelay3(samplePeriod=0.03) 
      annotation (extent=[10, -46; 26, -30]);
    Modelica.Blocks.Logical.Switch          Switch3 
      annotation (extent=[50, -72; 70, -52]);
    Modelica.Blocks.Sources.Constant PAOmedia(k=103.9884) 
      "Presion aortica media de referencia" 
      annotation (extent=[-26, -88; -8, -74]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       media annotation (extent=[80, 2; 98, 18]);
    acumulador acumulador1 annotation (extent=[-66, 66; 10, 108]);
    contador contador1 annotation (extent=[-28, -32; -2, 24]);
  equation 
    connect(PAO,UnitDelay1.u)       annotation (points=[-91, 9; -83.5, 9; -83.5,
           -2; -77.6, -2], style(
        color=3,
        fillColor=83,
        fillPattern=8));
    connect(UnitDelay1.y,Compare1.u2)             annotation (points=[-59.2, -2;
           -66, -2; -66, 18; -64, 18], style(
        color=3,
        fillColor=83,
        fillPattern=8));
    connect(PAO,Compare1.u1)       annotation (points=[-91, 9; -91, 38; -64, 38;
           -64, 30], style(
        color=3,
        fillColor=83,
        fillPattern=8));
    connect(Division1.y,Switch1.u1) 
      annotation (points=[-9.3, 60; 8, 60; 8, 15; 12, 15], style(color=3));
    connect(Compare1.y,Switch1.u2) 
      annotation (points=[-41, 24; -30, 24; -30, 8; 12, 8], style(color=5));
    connect(Switch1.y,UnitDelay2.u) 
      annotation (points=[35, 8; 40.4, 8], style(color=3));
    connect(UnitDelay2.y,Switch1.u3)             annotation (points=[58.8, 8;
          68, 8; 68, -12; 0, -12; 0, 1; 12, 1], style(color=3));
    connect(UnitDelay1.y,Compare2.u1)             annotation (points=[-59.2, -2;
           -68, -2; -68, -32; -66, -32], style(color=3));
    connect(PAO,Compare2.u2) 
      annotation (points=[-91, 9; -91, -44; -66, -44], style(color=3));
    connect(Compare2.y,Switch2.u2)             annotation (points=[-43, -38;
          -36, -38; -36, -40; -26, -40], style(color=5));
    connect(Switch2.y,UnitDelay3.u) 
      annotation (points=[-3, -40; 2, -40; 2, -38; 8.4, -38], style(color=3));
    connect(UnitDelay3.y,Switch3.u1) 
      annotation (points=[26.8, -38; 48, -38; 48, -55], style(color=3));
    connect(UnitDelay3.y,Switch2.u3)             annotation (points=[26.8, -38;
           28, -38; 28, -54; -38, -54; -38, -47; -26, -47], style(color=3));
    connect(Compare2.y,Switch3.u2)             annotation (points=[-43, -38;
          -40, -38; -40, -62; 48, -62], style(color=5));
    connect(PAOmedia.y,Switch3.u3)             annotation (points=[-7.1, -81;
          15.45, -81; 15.45, -69; 48, -69], style(color=3));
    connect(Switch3.y,       media) 
      annotation (points=[71, -62; 76, -62; 76, 10; 89, 10], style(color=3));
    connect(Compare1.y,       acumulador1.subida) annotation (points=[-41, 24;
          -42, 24; -42, 62; -78, 62; -78, 76; -61.06, 76; -61.06, 86.79], style(
          color=5));
    connect(PAO, acumulador1.PAO) 
      annotation (points=[-91, 9; -91, 97.5; -51.94, 97.5], style(color=3));
    connect(acumulador1.acumulador,Division1.u1)       annotation (points=[10,
          92.04; 10, 66.71; -25.4, 66.71; -25.4, 64.8], style(color=3));
    connect(Division1.u2,      contador1.contador) annotation (points=[-25.4,
          55.2; -8.63, 55.2; -8.63, -1.48], style(color=3));
    connect(Compare1.y,       contador1.subida) annotation (points=[-41, 24;
          -34, 24; -34, -11.84; -26.31, -11.84], style(color=5));
    connect(UnitDelay2.y,Switch2.u1)             annotation (points=[58.8, 8;
          58, 8; 58, -18; -30, -18; -30, -33; -26, -33], style(color=3));
  end media;
  
  model arteriaaorta 
    compartimentoconvalvula compartimentoconvalvula1(admitancia(k=80),
        Integrator1(y_start=100)) 
                               annotation (extent=[-48, -56; 108, 62]);
    Modelica.Blocks.Sources.Constant elastancia(k=0.8) 
      "elastancia de la arteria aorta" annotation (extent=[-44, 2; -28, 16]);
    annotation (Diagram, Icon(
        Rectangle(extent=[-40, 68; 24, -54], style(gradient=2, fillColor=69)),
        Text(
          extent=[-32, 42; 14, 30],
          style(gradient=2, fillColor=69),
          string="arteria"),
        Text(
          extent=[-24, 18; 4, 4],
          style(gradient=2, fillColor=69),
          string="aorta")));
    Modelica.Blocks.Interfaces.RealInput 
                                      FAS "Flujo aorta-circulacion sistemica" 
      annotation (extent=[-58, 30; -42, 44]);
    Modelica.Blocks.Interfaces.RealInput 
                                      PVI "Presion ventriculo izquierdo" 
      annotation (extent=[-56, -12; -40, 4]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       VAO "Voumen aorta" 
      annotation (extent=[26, 24; 38, 40]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       PAO "Presion aorta" 
      annotation (extent=[26, 0; 38, 14]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       FVA "Flujo valvula aórtica" 
      annotation (extent=[24, -26; 34, -12]);
  equation 
    connect(elastancia.y,       compartimentoconvalvula1.ELASTAN) annotation (
        points=[-27.2, 9; -40.7, 9; -40.7, 8.9; -16.8, 8.9], style(color=3));
    connect(FAS, compartimentoconvalvula1.flujent) annotation (points=[-50, 37;
           -50, 37; -50, 24.24; -18.36, 24.24], style(color=3));
    connect(PVI, compartimentoconvalvula1.present) annotation (points=[-48, -4;
           -52, -4; -52, -9.39; -17.58, -9.39], style(color=3));
    connect(compartimentoconvalvula1.volsal, VAO) annotation (points=[32.34,
          22.47; 27.385, 22.47; 27.385, 32; 32, 32], style(color=3));
    connect(compartimentoconvalvula1.pressal, PAO) annotation (points=[33.12,
          9.49; 29.68, 9.49; 29.68, 7; 32, 7], style(color=3));
    connect(compartimentoconvalvula1.flujsal, FVA) annotation (points=[33.12, -4.08;
           27.68, -4.08; 27.68, -19; 29, -19], style(color=3));
  end arteriaaorta;
  
  model sistemapulmonarterial 
    compartimentoconvalvula compartimentoconvalvula1(admitancia(k=90),
        Integrator1(y_start=120)) 
                               annotation (extent=[-68, -66; 88, 86]);
    Modelica.Blocks.Interfaces.RealInput 
                                      FSP "Flujo sistema pulmonar" 
      annotation (extent=[-50, 28; -36, 40]);
    Modelica.Blocks.Interfaces.RealInput 
                                      PVD "Presion ventriculo derecho" 
      annotation (extent=[-50, -2; -38, 12]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       VPA 
      "Volumen del sistema pulmonar arterial" 
      annotation (extent=[22, 28; 34, 40]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       PAP "Presion arterial pulmonar" 
      annotation (extent=[22, 8; 34, 20]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       FVP "Flujo válvula pulmonar" 
      annotation (extent=[22, -14; 34, 0]);
    Modelica.Blocks.Sources.Constant elastancia(k=0.1333) 
      "elastancia del sistema pulmonar arterial" 
      annotation (extent=[-72, 12; -56, 24]);
    annotation (Diagram, Icon(
        Rectangle(extent=[-36, 60; 22, -50], style(gradient=3, fillColor=69)),
        Text(
          extent=[-24, 34; 8, 8],
          style(gradient=3, fillColor=69),
          string="sistema"),
        Text(
          extent=[-24, 18; 12, 2],
          style(gradient=3, fillColor=69),
          string="pulmonar"),
        Text(
          extent=[-26, 6; 10, -12],
          style(gradient=3, fillColor=69),
          string="arterial")));
  equation 
    connect(elastancia.y,       compartimentoconvalvula1.ELASTAN) annotation (
        points=[-55.2, 18; -54, 18; -54, 17.6; -36.8, 17.6], style(
        color=3,
        gradient=2,
        fillColor=69));
    connect(FSP, compartimentoconvalvula1.flujent) annotation (points=[-43, 34;
           -52, 34; -52, 37.36; -38.36, 37.36], style(
        color=3,
        gradient=2,
        fillColor=69));
    connect(PVD, compartimentoconvalvula1.present) annotation (points=[-44, 5;
          -61, 5; -61, -5.96; -37.58, -5.96], style(
        color=3,
        gradient=2,
        fillColor=69));
    connect(compartimentoconvalvula1.volsal, VPA) annotation (points=[12.34,
          35.08; 26.17, 35.08; 26.17, 34; 28, 34], style(
        color=3,
        gradient=2,
        fillColor=69));
    connect(compartimentoconvalvula1.pressal, PAP) annotation (points=[13.12,
          18.36; 28.56, 18.36; 28.56, 14; 28, 14], style(
        color=3,
        gradient=2,
        fillColor=69));
    connect(compartimentoconvalvula1.flujsal, FVP) annotation (points=[13.12,
          0.88; 13.12, -15.56; 28, -15.56; 28, -7], style(
        color=3,
        gradient=2,
        fillColor=69));
  end sistemapulmonarterial;
  
  model sistemapulmonarvenoso 
    compartimentogeneral compartimentogeneral1(admitancia(k=7),   Integrator1(y_start=
            240))    annotation (extent=[-36, -36; 76, 66]);
    Modelica.Blocks.Sources.Constant elastancia(k=0.033) 
      annotation (extent=[-74, 6; -58, 22]);
    Modelica.Blocks.Interfaces.RealInput 
                                      FMV "Flujo válvula mitral" 
      annotation (extent=[-48, 34; -36, 46]);
    Modelica.Blocks.Interfaces.RealInput 
                                      PPA "Presión sistema pulmonar arterial" 
      annotation (extent=[-46, -2; -32, 14]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       VPV "Volumen sistema pulmonar venoso" 
      annotation (extent=[26, 40; 38, 54]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       PPV "Presión sistema pulmonar venoso" 
      annotation (extent=[28, 20; 40, 34]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       FSP "Flujo sistema pulmonar" 
      annotation (extent=[26, 2; 36, 14]);
    annotation (Diagram, Icon(
        Rectangle(extent=[-32, 68; 26, -32], style(gradient=3, fillColor=58)),
        Text(
          extent=[-24, 48; 18, 38],
          style(gradient=3, fillColor=58),
          string="sistema"),
        Text(
          extent=[-24, 38; 20, 26],
          style(gradient=3, fillColor=58),
          string="pulmonar"),
        Text(
          extent=[-22, 28; 16, 16],
          style(gradient=3, fillColor=58),
          string="venoso")));
  equation 
    connect(FMV, compartimentogeneral1.flujent) annotation (points=[-42, 40; -44,
           40; -44, 35.4; -22.56, 35.4], style(
        color=3,
        fillColor=69,
        fillPattern=7));
    connect(elastancia.y,       compartimentogeneral1.elastancia) annotation (
        points=[-57.2, 14; -40, 14; -40, 17.55; -21.44, 17.55], style(
        color=3,
        fillColor=69,
        fillPattern=7));
    connect(PPA, compartimentogeneral1.present) annotation (points=[-39, 6; -44,
           6; -44, 1.23; -22, 1.23], style(
        color=3,
        fillColor=69,
        fillPattern=7));
    connect(compartimentogeneral1.volusal, VPV) annotation (points=[20, 32.85;
          37, 32.85; 37, 47; 32, 47], style(
        color=3,
        fillColor=69,
        fillPattern=7));
    connect(compartimentogeneral1.presisal, PPV) annotation (points=[20.56,
          17.04; 34.28, 17.04; 34.28, 27; 34, 27], style(
        color=3,
        fillColor=69,
        fillPattern=7));
    connect(compartimentogeneral1.flujsal, FSP) annotation (points=[20, 2.25;
          20, -15.875; 31, -15.875; 31, 8], style(
        color=3,
        fillColor=69,
        fillPattern=7));
  end sistemapulmonarvenoso;
  
  model venacava 
    compartimentogeneral compartimentogeneral1(admitancia(k=1.65),
        Integrator1(y_start=500)) 
                               annotation (extent=[-50, -46; 60, 66]);
    Modelica.Blocks.Interfaces.RealInput 
                                      FVT "Flujo válvula tricúspide" 
      annotation (extent=[-56, 26; -44, 40]);
    annotation (Diagram, Icon(
        Rectangle(extent=[-42, 58; 14, -52], style(gradient=2, fillColor=58)),
        Text(
          extent=[-32, 32; 2, 16],
          style(gradient=2, fillColor=58),
          string="vena"),
        Text(
          extent=[-30, 22; 2, 6],
          style(gradient=2, fillColor=58),
          string="cava")));
    Modelica.Blocks.Interfaces.RealInput 
                                      Elastancia "Copilancia de la vena cava" 
      annotation (extent=[-56, 4; -44, 18]);
    Modelica.Blocks.Interfaces.RealInput 
                                      PCS "Presión ciculación sistémica" 
      annotation (extent=[-56, -18; -44, -4]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       PVC "Presión vena cava" 
      annotation (extent=[14, 6; 24, 18]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       VVC "Volumen vena cava" 
      annotation (extent=[14, 26; 24, 38]);
    Modelica.Blocks.Interfaces.RealOutput 
                                       FSV 
      "Flujo circulación sistémica-vena cava" 
      annotation (extent=[14, -14; 24, -2]);
  equation 
    connect(FVT, compartimentogeneral1.flujent) annotation (points=[-50, 33; -53,
           33; -53, 32.4; -36.8, 32.4], style(
        color=3,
        gradient=3,
        fillColor=58));
    connect(Elastancia, compartimentogeneral1.elastancia) annotation (points=[-50,
           11; -52, 11; -52, 12.8; -35.7, 12.8], style(
        color=3,
        gradient=3,
        fillColor=58));
    connect(PCS, compartimentogeneral1.present) annotation (points=[-50, -11; -53,
           -11; -53, -5.12; -36.25, -5.12], style(
        color=3,
        gradient=3,
        fillColor=58));
    connect(compartimentogeneral1.volusal, VVC) annotation (points=[5, 29.6;
          13.5, 29.6; 13.5, 32; 19, 32], style(
        color=3,
        gradient=3,
        fillColor=58));
    connect(compartimentogeneral1.presisal, PVC) annotation (points=[5.55,
          12.24; 16.775, 12.24; 16.775, 12; 19, 12], style(
        color=3,
        gradient=3,
        fillColor=58));
    connect(compartimentogeneral1.flujsal, FSV) annotation (points=[5, -4; 20,
          -4; 20, -8; 19, -8], style(
        color=3,
        gradient=3,
        fillColor=58));
  end venacava;
  annotation(uses(Modelica(version="2.2.2")));
end control;
