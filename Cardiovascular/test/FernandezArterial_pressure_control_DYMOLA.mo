within ;
package control "modelo y control a corto plazo"

   model compartimentogeneral

    Modelica.Blocks.Interfaces.RealInput
                                      flujent
      annotation (Placement(transformation(extent={{-84,30},{-68,50}}, rotation=
             0)));
    Modelica.Blocks.Math.Add Add1(k1=-1) annotation (Placement(transformation(
            extent={{-60,24},{-40,44}}, rotation=0)));
    Modelica.Blocks.Continuous.Integrator Integrator1(y_start=scalar(c))
      annotation (Placement(transformation(extent={{-28,24},{-8,44}}, rotation=
              0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       volusal
      annotation (Placement(transformation(extent={{24,28},{40,46}},rotation=0),
          iconTransformation(extent={{-8,26},{8,44}})));
    Modelica.Blocks.Math.Product Product1 annotation (Placement(transformation(
            extent={{-60,-12},{-40,8}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput
                                      elastancia
      annotation (Placement(transformation(extent={{-98,-2},{-82,16}}, rotation=
             0), iconTransformation(extent={{-82,-4},{-66,14}})));
    Modelica.Blocks.Interfaces.RealOutput
                                       presisal
      annotation (Placement(transformation(extent={{-8,-4},{10,12}}, rotation=0)));
    Modelica.Blocks.Math.Add Add2(k1=-1)
      annotation (Placement(transformation(extent={{-54,-42},{-34,-22}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealInput
                                      present
      annotation (Placement(transformation(extent={{-84,-36},{-66,-18}},
            rotation=0)));
    Modelica.Blocks.Math.Product Product2 annotation (Placement(transformation(
            extent={{-18,-48},{2,-28}}, rotation=0)));
    Modelica.Blocks.Sources.Constant admitancia(k=scalar(admitancia))
      annotation (Placement(transformation(extent={{-54,-72},{-34,-52}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       flujsal
      annotation (Placement(transformation(extent={{-8,-34},{8,-16}}, rotation=
              0)));
   equation
    connect(flujent,Add1.u1)
      annotation (Line(points={{-76,40},{-62,40}}, color={0,0,255}));
    connect(Add1.y,Integrator1.u)
      annotation (Line(points={{-39,34},{-30,34}}, color={0,0,255}));
    connect(Integrator1.y,       volusal)
      annotation (Line(points={{-7,34},{18.5,34},{18.5,37},{32,37}},color={0,0,
            255}));
    connect(Integrator1.y,Product1.u1)             annotation (Line(points={{-7,
            34},{-8,34},{-8,12},{-70,12},{-70,4},{-62,4}}, color={0,0,255}));
    connect(elastancia,Product1.u2)
      annotation (Line(points={{-90,7},{-73,7},{-73,-8},{-62,-8}}, color={0,0,
            255}));
    connect(Product1.y,       presisal)
      annotation (Line(points={{-39,-2},{-19.5,-2},{-19.5,4},{1,4}}, color={0,0,
            255}));
    connect(present,Add2.u2)       annotation (Line(points={{-75,-27},{-58.5,
            -27},{-58.5,-38},{-56,-38}}, color={0,0,255}));
    connect(Product1.y,Add2.u1)             annotation (Line(points={{-39,-2},{
            -38,-2},{-38,-18},{-66,-18},{-66,-26},{-56,-26}}, color={0,0,255}));
    connect(Add2.y,Product2.u1)
      annotation (Line(points={{-33,-32},{-20,-32}}, color={0,0,255}));
    connect(admitancia.y,Product2.u2)             annotation (Line(points={{-33,
            -62},{-26,-62},{-26,-44},{-20,-44}}, color={0,0,255}));
    connect(Product2.y,       flujsal)
      annotation (Line(points={{3,-38},{6.5,-38},{6.5,-25},{0,-25}}, color={0,0,
            255}));
    connect(Product2.y,Add1.u2)             annotation (Line(points={{3,-38},{4,
            -38},{4,-14},{-72,-14},{-72,28},{-62,28}}, color={0,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}),
                        graphics),
                         Icon(graphics={
          Rectangle(
            extent={{-66,48},{-8,-52}},
            lineColor={0,0,255},
            fillColor={95,191,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-64,32},{-10,-8}},
            lineColor={0,0,255},
            fillColor={0,127,255},
            fillPattern=FillPattern.Forward,
            textString=
                 "compartimento"),
          Text(
            extent={{-52,8},{-22,-4}},
            lineColor={0,0,255},
            fillColor={0,127,255},
            fillPattern=FillPattern.Forward,
            textString=
                 "general")}));
   end compartimentogeneral;

  model circulacion

    venderecho venderecho1 annotation (Placement(transformation(extent={{-110,
              -20},{-12,62}}, rotation=0)));
    venizquierdo venizquierdo1 annotation (Placement(transformation(extent={{
              -42,-26},{46,60}}, rotation=0)));
    circulacionsistemica circulacionsistemica1
      annotation (Placement(transformation(extent={{-78,-112},{8,-46}},
            rotation=0)));
    modulocontrol modulocontrol1(Step1(height=0), HR0(k=120))
                                 annotation (Placement(transformation(extent={{16,-102},
              {82,0}},          rotation=0)));
    arteriaaorta arteriaaorta1 annotation (Placement(transformation(extent={{
              -52,-68},{34,6}}, rotation=0)));
    sistemapulmonarterial sistemapulmonarterial1
      annotation (Placement(transformation(extent={{-122,34},{-18,118}},
            rotation=0)));
    sistemapulmonarvenoso sistemapulmonarvenoso1
      annotation (Placement(transformation(extent={{-60,20},{36,112}}, rotation=
             0)));
    venacava venacava1 annotation (Placement(transformation(extent={{-114,-70},
              {-18,12}}, rotation=0)));
    Modelica.Blocks.Sources.Clock Clock1(startTime=10)
      annotation (Placement(transformation(extent={{-22,-82},{-12,-72}},
            rotation=0)));
    Modelica.Blocks.Logical.LogicalSwitch          LogicalSwitch1
      annotation (Placement(transformation(extent={{14,-92},{22,-68}}, rotation=
             0)));
    Modelica.Blocks.Sources.BooleanConstant BooleanConstant1
      annotation (Placement(transformation(extent={{-2,-64},{10,-54}}, rotation=
             0)));
    Modelica.Blocks.Sources.BooleanConstant BooleanConstant2(k=false)
      annotation (Placement(transformation(extent={{-6,-100},{8,-90}}, rotation=
             0)));
    Modelica.Blocks.Logical.GreaterEqualThreshold GreaterEqual1(threshold=0)
      annotation (Placement(transformation(extent={{-8,-82},{8,-72}}, rotation=
              0)));
    Modelica.Blocks.Math.Division Division1
      annotation (Placement(transformation(extent={{88,-88},{100,-76}},
            rotation=0)));
    Modelica.Blocks.Math.Division Division2
      annotation (Placement(transformation(extent={{88,-72},{100,-60}},
            rotation=0)));
    Modelica.Blocks.Math.Division Division3 annotation (Placement(
          transformation(extent={{84,-12},{96,0}}, rotation=0)));
    Modelica.Blocks.Sources.Constant Constant2
      annotation (Placement(transformation(extent={{72,-30},{82,-20}}, rotation=
             0)));
    Modelica.Blocks.Sources.Constant Constant3(k=60)
      annotation (Placement(transformation(extent={{52,2},{64,12}}, rotation=0)));
    Modelica.Blocks.Sources.Constant hemorragia(k=0)
      annotation (Placement(transformation(extent={{-130,-86},{-116,-74}},
            rotation=0)));
    Modelica.Blocks.Sources.Constant ingesta(k=0)
      annotation (Placement(transformation(extent={{-130,-64},{-116,-52}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       VPA
      annotation (Placement(transformation(extent={{-42,88},{-32,100}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       VPV annotation (Placement(transformation(
            extent={{26,80},{36,92}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       VVD
      annotation (Placement(transformation(extent={{-38,52},{-28,64}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       VVI annotation (Placement(transformation(
            extent={{34,42},{44,54}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       VVC
      annotation (Placement(transformation(extent={{-48,-20},{-38,-8}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       VAO
      annotation (Placement(transformation(extent={{16,-22},{26,-10}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       VCS
      annotation (Placement(transformation(extent={{-22,-66},{-12,-54}},
            rotation=0)));
  equation
    connect(LogicalSwitch1.y,       modulocontrol1.activado) annotation (Line(
          points={{22.4,-80},{38,-80},{38,-77.01},{29.2,-77.01}}, color={255,0,
            255}));
    connect(Clock1.y,GreaterEqual1.u)             annotation (Line(points={{
            -11.5,-77},{-9.6,-77}}, color={0,0,255}));
    connect(GreaterEqual1.y,LogicalSwitch1.u2)             annotation (Line(
          points={{8.8,-77},{9.4,-77},{9.4,-80},{13.2,-80}}, color={255,0,255}));
    connect(BooleanConstant2.y,LogicalSwitch1.u3)             annotation (Line(
          points={{8.7,-95},{13.35,-95},{13.35,-89.6},{13.2,-89.6}}, color={255,
            0,255}));
    connect(BooleanConstant1.y,LogicalSwitch1.u1)             annotation (Line(
          points={{10.6,-59},{10.6,-62.5},{13.2,-62.5},{13.2,-70.4}}, color={
            255,0,255}));
    connect(modulocontrol1.HR,Division3.u2)       annotation (Line(points={{70.78,
            -11.22},{74.39,-11.22},{74.39,-9.6},{82.8,-9.6}},       color={0,0,
            255}));
    connect(Constant3.y,Division3.u1)             annotation (Line(points={{
            64.6,7},{72.3,7},{72.3,-2.4},{82.8,-2.4}}, color={0,0,255}));
    connect(Constant2.y,Division2.u1)             annotation (Line(points={{
            82.5,-25},{82.5,-62.4},{86.8,-62.4}}, color={0,0,255}));
    connect(Constant2.y,Division1.u1)             annotation (Line(points={{
            82.5,-25},{84,-78},{86.8,-78.4}}, color={0,0,255}));
    connect(modulocontrol1.CV,Division2.u2)       annotation (Line(points={{70.78,
            -64.77},{79.39,-64.77},{79.39,-69.6},{86.8,-69.6}},       color={0,
            0,255}));
    connect(modulocontrol1.RS,Division1.u2)       annotation (Line(points={{71.11,
            -83.64},{80.555,-83.64},{80.555,-85.6},{86.8,-85.6}},       color={
            0,0,255}));
    connect(sistemapulmonarvenoso1.FSP, sistemapulmonarterial1.FSP) annotation (Line(
          points={{2.88,69.68},{18,69.68},{18,102},{-104,102},{-104,90.28},{
            -92.36,90.28}}, color={0,0,255}));
    connect(venderecho1.PVD, sistemapulmonarterial1.PVD) annotation (Line(
          points={{-21.8,29.2},{-44,29.2},{-44,50},{-100,50},{-100,78.1},{
            -92.88,78.1}}, color={0,0,255}));
    connect(venizquierdo1.FVM, sistemapulmonarvenoso1.FMV) annotation (Line(
          points={{6.84,14.42},{26,14.42},{26,50},{-42,50},{-42,84.4},{-32.16,
            84.4}}, color={0,0,255}));
    connect(sistemapulmonarterial1.PAP, sistemapulmonarvenoso1.PPA) annotation (Line(
          points={{-55.44,81.88},{-43.72,81.88},{-43.72,68.76},{-30.72,68.76}},
          color={0,0,255}));
    connect(sistemapulmonarterial1.FVP, venderecho1.FVP) annotation (Line(
          points={{-55.44,73.06},{-55.44,52},{-102,52},{-102,39.04},{-92.85,
            39.04}}, color={0,0,255}));
    connect(Division3.y,       venderecho1.HR) annotation (Line(points={{96.6,-6},
            {94,-6},{94,16},{34,16},{34,0},{-106,0},{-106,30},{-105.59,30},{
            -105.59,30.02}},color={0,0,255}));
    connect(modulocontrol1.EVderecho, venderecho1.EVderecho) annotation (Line(
          points={{70.78,-35.7},{100,-35.7},{100,24},{30,24},{30,-2},{-104,-2},
            {-104,21.82},{-93.34,21.82}}, color={0,0,255}));
    connect(venacava1.PVC, venderecho1.PVC) annotation (Line(points={{-56.88,
            -24.08},{-44,-24.08},{-44,-4},{-100,-4},{-100,12.8},{-93.34,12.8}},
          color={0,0,255}));
    connect(arteriaaorta1.FVA, venizquierdo1.FVA) annotation (Line(points={{
            3.47,-38.03},{20,-38.03},{20,4},{-36,4},{-36,37.64},{-27.92,37.64}},
          color={0,0,255}));
    connect(Division3.y,       venizquierdo1.HR1) annotation (Line(points={{
            96.6,-6},{94,-6},{94,16},{34,16},{34,0},{-40,0},{-40,28.61},{-28.36,
            28.61}}, color={0,0,255}));
    connect(modulocontrol1.EVizquierda, venizquierdo1.EVizquierdo) annotation (Line(
          points={{70.45,-49.98},{106,-49.98},{106,34},{28,34},{28,2},{-34,2},{
            -34,20.44},{-27.92,20.44}}, color={0,0,255}));
    connect(sistemapulmonarvenoso1.PPV, venizquierdo1.PPV) annotation (Line(
          points={{4.32,78.42},{4.32,48},{-42,48},{-42,10.55},{-27.48,10.55}},
          color={0,0,255}));
    connect(venderecho1.FVT, venacava1.FVT) annotation (Line(points={{-19.35,
            19.77},{-19.35,2},{-98,2},{-98,-15.47},{-90,-15.47}}, color={0,0,
            255}));
    connect(Division2.y,       venacava1.Elastancia) annotation (Line(points={{
            100.6,-66},{110,-66},{110,-106},{-102,-106},{-102,-24.49},{-90,
            -24.49}}, color={0,0,255}));
    connect(circulacionsistemica1.PCS, venacava1.PCS) annotation (Line(points={
            {-30.27,-75.04},{-30.27,-52},{-98,-52},{-98,-33.51},{-90,-33.51}},
          color={0,0,255}));
    connect(circulacionsistemica1.FAS, arteriaaorta1.FAS) annotation (Line(
          points={{-30.7,-85.93},{-30.5,-85.93},{-30.5,-17.31}}, color={0,0,255}));
    connect(venizquierdo1.PVI, arteriaaorta1.PVI) annotation (Line(points={{
            6.84,25.6},{6.84,-4},{-36,-4},{-36,-32.48},{-29.64,-32.48}}, color=
            {0,0,255}));
    connect(venacava1.FSV, circulacionsistemica1.FSV) annotation (Line(points={
            {-56.88,-32.28},{-56.88,-52},{-80,-52},{-80,-57.22},{-65.96,-57.22}},
          color={0,0,255}));
    connect(ingesta.y,       circulacionsistemica1.ingesta) annotation (Line(
          points={{-115.3,-58},{-91.19,-58},{-91.19,-65.14},{-65.96,-65.14}},
          color={0,0,255}));
    connect(hemorragia.y,       circulacionsistemica1.hemorragia) annotation (Line(
          points={{-115.3,-80},{-92,-80},{-92,-73.72},{-65.53,-73.72}}, color={
            0,0,255}));
    connect(arteriaaorta1.PAO, circulacionsistemica1.PAO) annotation (Line(
          points={{4.76,-28.41},{24,-28.41},{24,-104},{-84,-104},{-84,-81.97},{
            -66.39,-81.97}}, color={0,0,255}));
    connect(Division1.y,       circulacionsistemica1.admitancia) annotation (Line(
          points={{100.6,-82},{104,-82},{104,-102},{-74,-102},{-74,-89.56},{
            -65.53,-89.56}}, color={0,0,255}));
    connect(arteriaaorta1.PAO, modulocontrol1.PAO) annotation (Line(points={{4.76,
            -28.41},{24,-28.41},{24,-32.64},{29.86,-32.64}},      color={0,0,
            255}));
    connect(sistemapulmonarterial1.VPA, VPA) annotation (Line(points={{-55.44,
            90.28},{-46.72,90.28},{-46.72,94},{-37,94}}, color={0,0,255}));
    connect(sistemapulmonarvenoso1.VPV, VPV) annotation (Line(points={{3.36,
            87.62},{15.68,87.62},{15.68,86},{31,86}}, color={0,0,255}));
    connect(venderecho1.VVD, VVD) annotation (Line(points={{-22.29,39.86},{
            -22.29,58},{-33,58}}, color={0,0,255}));
    connect(venizquierdo1.VVI, VVI) annotation (Line(points={{6.84,38.5},{21.42,
            38.5},{21.42,48},{39,48}}, color={0,0,255}));
    connect(venacava1.VVC, VVC) annotation (Line(points={{-56.88,-15.88},{
            -51.44,-15.88},{-51.44,-14},{-43,-14}}, color={0,0,255}));
    connect(arteriaaorta1.VAO, VAO) annotation (Line(points={{4.76,-19.16},{
            13.38,-19.16},{13.38,-16},{21,-16}}, color={0,0,255}));
    connect(circulacionsistemica1.VCS, VCS) annotation (Line(points={{-30.7,
            -64.15},{-22.35,-64.15},{-22.35,-60},{-17,-60}}, color={0,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                        graphics));
  end circulacion;

   model limite "accion de la valvula"

    Modelica.Blocks.Interfaces.RealInput
                                      incpres
      "presion entrada - presion de salida"
      annotation (Placement(transformation(extent={{-56,20},{-40,38}}, rotation=
             0)));
    Modelica.Blocks.Sources.Constant cero(k=0)
      annotation (Placement(transformation(extent={{-56,-44},{-38,-26}},
            rotation=0)));
    Modelica.Blocks.Logical.Switch          Switch1
      annotation (Placement(transformation(extent={{-6,-8},{14,12}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       OutPort1
      annotation (Placement(transformation(extent={{44,-6},{60,12}}, rotation=0)));
    Modelica.Blocks.Logical.GreaterEqualThreshold GreaterEqual1(threshold=0)
      annotation (Placement(transformation(extent={{-56,-14},{-36,6}}, rotation=
             0)));
   equation
    connect(incpres,Switch1.u1)
      annotation (Line(points={{-48,29},{-33,29},{-33,10},{-8,10}}, color={0,0,
            255}));
    connect(cero.y,Switch1.u3)             annotation (Line(points={{-37.1,-35},
            {-19.55,-35},{-19.55,-6},{-8,-6}}, color={0,0,255}));
    connect(Switch1.y,       OutPort1)
      annotation (Line(points={{15,2},{12.5,2},{12.5,3},{52,3}}, color={0,0,255}));
    connect(GreaterEqual1.y,Switch1.u2)
      annotation (Line(points={{-35,-4},{-4,-4},{-4,2},{-8,2}}, color={255,0,
            255}));
    connect(incpres,GreaterEqual1.u)       annotation (Line(points={{-48,29},{
            -68,29},{-68,-4},{-58,-4}}, color={0,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}),
                        graphics),
                         Icon(graphics={Rectangle(
            extent={{-34,16},{0,-6}},
            lineColor={0,0,255},
            fillColor={127,255,255},
            fillPattern=FillPattern.Solid), Text(extent={{-28,8},{-6,6}},
              textString =                                        "limite")}));
   end limite;

  model compartimentoconvalvula

    Modelica.Blocks.Interfaces.RealInput
                                      flujent "flujo de entrada"
      annotation (Placement(transformation(extent={{-98,32},{-82,48}}, rotation=
             0)));
    Modelica.Blocks.Math.Add Add1(k1=-1) annotation (Placement(transformation(
            extent={{-68,22},{-48,42}}, rotation=0)));
    Modelica.Blocks.Continuous.Integrator Integrator1
      annotation (Placement(transformation(extent={{-28,22},{-8,42}}, rotation=
              0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       volsal "volumen de salida"
      annotation (Placement(transformation(extent={{-4,24},{10,42}}, rotation=0)));
    Modelica.Blocks.Math.Product Product1 annotation (Placement(transformation(
            extent={{-30,-12},{-10,8}},rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       pressal "presion de salida"
      annotation (Placement(transformation(extent={{-4,2},{12,20}}, rotation=0)));
    Modelica.Blocks.Math.Add Add2(k1=-1)
      annotation (Placement(transformation(
          origin={-58,-36},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput
                                      present "presion de entrada"
      annotation (Placement(transformation(extent={{-102,-30},{-84,-12}},
            rotation=0)));
    limite limite1 annotation (Placement(transformation(extent={{-84,-142},{6,
              -40}}, rotation=0)));
    Modelica.Blocks.Math.Product Product2 annotation (Placement(transformation(
            extent={{-18,-64},{2,-44}}, rotation=0)));
    Modelica.Blocks.Sources.Constant admitancia(k=1)
      annotation (Placement(transformation(extent={{-44,-46},{-28,-30}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       flujsal "Flujo de salida"
      annotation (Placement(transformation(extent={{-4,-20},{12,-4}}, rotation=
              0)));
    Modelica.Blocks.Interfaces.RealInput
                                      ELASTAN "elastancia"
      annotation (Placement(transformation(extent={{-98,2},{-82,18}}, rotation=
              0)));
  equation
    connect(flujent,Add1.u1)       annotation (Line(points={{-90,40},{-70,40},{
            -70,38}}, color={0,0,255}));
    connect(Add1.y,Integrator1.u)             annotation (Line(points={{-47,32},
            {-30,32}}, color={0,0,255}));
    connect(Integrator1.y,       volsal) annotation (Line(points={{-7,32},{4,32},
            {4,33},{3,33}}, color={0,0,255}));
    connect(Integrator1.y,Product1.u1)             annotation (Line(points={{-7,32},
            {-8,32},{-8,16},{-32,16},{-32,4}},     color={0,0,255}));
    connect(Product1.y,       pressal) annotation (Line(points={{-9,-2},{-2.5,
            -2},{-2.5,11},{4,11}}, color={0,0,255}));
    connect(Product1.y,Add2.u1)             annotation (Line(points={{-9,-2},{
            -2,-2},{-2,-16},{-16,-16},{-16,-24},{-52,-24}}, color={0,0,255}));
    connect(present,Add2.u2)       annotation (Line(points={{-93,-21},{-64.5,
            -21},{-64.5,-24},{-64,-24}}, color={0,0,255}));
    connect(Add2.y,       limite1.incpres) annotation (Line(points={{-58,-47},{
            -67.26,-47},{-67.26,-76.21},{-60.6,-76.21}}, color={0,0,255}));
    connect(admitancia.y,Product2.u1)             annotation (Line(points={{
            -27.2,-38},{-14,-38},{-14,-48},{-20,-48}}, color={0,0,255}));
    connect(limite1.OutPort1,Product2.u2)       annotation (Line(points={{-15.6,
            -89.47},{-21.25,-89.47},{-21.25,-60},{-20,-60}}, color={0,0,255}));
    connect(Product2.y,       flujsal)
      annotation (Line(points={{3,-54},{8,-54},{8,-12},{4,-12}}, color={0,0,255}));
    connect(Product2.y,Add1.u2)             annotation (Line(points={{3,-54},{0,
            -54},{0,-20},{-66,-20},{-66,26},{-70,26}}, color={0,0,255}));
    connect(ELASTAN,Product1.u2)
      annotation (Line(points={{-90,10},{-52,10},{-52,-8},{-32,-8}}, color={0,0,
            255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}),
                        graphics),
                         Icon(graphics={
          Rectangle(
            extent={{-52,50},{-4,-40}},
            lineColor={0,0,255},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Text(extent={{-44,32},{-6,8}}, textString=
                                             "compartimento"),
          Text(extent={{-40,12},{-20,10}}, textString=
                                               "con"),
          Text(extent={{-46,4},{-14,-2}}, textString=
                                              "válvula")}));
  end compartimentoconvalvula;

model pulsos

    Modelica.Blocks.Interfaces.RealInput
                                      InPort1
      annotation (Placement(transformation(extent={{-106,-14},{-94,2}},rotation=
             0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       OutPort1
      annotation (Placement(transformation(extent={{56,12},{70,30}}, rotation=0)));
    Modelica.Blocks.Sources.Clock Clock1 annotation (Placement(transformation(
            extent={{-78,46},{-60,64}}, rotation=0)));
    Modelica.Blocks.Math.Division Division1
      annotation (Placement(transformation(extent={{-80,-12},{-60,8}}, rotation=
             0)));
    Modelica.Blocks.Sources.Constant Constant1
      annotation (Placement(transformation(extent={{-98,10},{-80,26}}, rotation=
             0)));
    Modelica.Blocks.Math.Product Product1 annotation (Placement(transformation(
            extent={{-18,46},{2,66}}, rotation=0)));
    Modelica.Blocks.Math.Product Product2 annotation (Placement(transformation(
            extent={{-52,-42},{-32,-22}},
                                        rotation=0)));
    Modelica.Blocks.Math.Add Add1(k2=-1) annotation (Placement(transformation(
            extent={{44,-14},{64,6}}, rotation=0)));
    Modelica.Blocks.Sources.Constant Constant2(k=0.5)
      annotation (Placement(transformation(extent={{-30,-48},{-12,-32}},
            rotation=0)));
    Modelica.Blocks.Math.Add Add2(k1=1, k2=-1)
      annotation (Placement(transformation(extent={{-22,-16},{-2,4}}, rotation=
              0)));
    Modelica.Blocks.Math.RealToInteger RealToInteger1
      annotation (Placement(transformation(extent={{8,-16},{28,4}}, rotation=0)));
equation
    connect(Constant1.y,Division1.u1)
      annotation (Line(points={{-79.1,18},{-82,18},{-82,4}}, color={0,0,255}));
    connect(InPort1,Division1.u2)
      annotation (Line(points={{-100,-6},{-84,-6},{-84,-8},{-82,-8}},
                                                                   color={0,0,
            255}));
    connect(Clock1.y,Product1.u1)             annotation (Line(points={{-59.1,
            55},{-54,54},{-42,54},{-42,62},{-20,62}}, color={0,0,255}));
    connect(Clock1.y,Product2.u2)             annotation (Line(points={{-59.1,
            55},{-42,55},{-42,-38},{-54,-38}}, color={0,0,255}));
    connect(Division1.y,Product2.u1)
      annotation (Line(points={{-59,-2},{-44,-2},{-44,-26},{-54,-26}},
                                                                   color={0,0,
            255}));
    connect(Division1.y,Product1.u2)
      annotation (Line(points={{-59,-2},{-56,-2},{-56,50},{-20,50}}, color={0,0,
            255}));
    connect(Product1.y,Add1.u1)
      annotation (Line(points={{3,56},{14,56},{14,2},{42,2}}, color={0,0,255}));
    connect(Add1.y,       OutPort1)
      annotation (Line(points={{65,-4},{72,-4},{72,21},{63,21}},
                                                               color={0,0,255}));
    connect(Product2.y,Add2.u1)
      annotation (Line(points={{-31,-32},{0,-32},{0,0},{-24,0}},
                                                               color={0,0,255}));
    connect(Constant2.y,Add2.u2)             annotation (Line(points={{-11.1,
            -40},{-4,-40},{-4,-12},{-24,-12}}, color={0,0,255}));
    connect(Add2.y,RealToInteger1.u)
      annotation (Line(points={{-1,-6},{6,-6}}, color={0,0,255}));
    connect(RealToInteger1.y,Add1.u2)
      annotation (Line(points={{29,-6},{36,-6},{36,-10},{42,-10}}, color={255,
            127,0}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}),
                        graphics),
                         Icon(graphics={Ellipse(
            extent={{-58,12},{-14,-10}},
            lineColor={0,0,255},
            fillColor={127,255,255},
            fillPattern=FillPattern.Solid), Text(extent={{-48,2},{-20,-2}},
              textString =                                          "pulsos")}));
end pulsos;

   model ventriculo

    Modelica.Blocks.Interfaces.RealInput
                                      EV "Entrada al ventriculo"
      annotation (Placement(transformation(extent={{-80,4},{-64,20}}, rotation=
              0)));
    Modelica.Blocks.Math.Product Product1
      annotation (Placement(transformation(extent={{-62,-24},{-44,-8}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealInput
                                      Maxelas "Maximo de la eslastancia "
      annotation (Placement(transformation(extent={{-80,-24},{-64,-6}},
            rotation=0)));
    Modelica.Blocks.Sources.Constant Einicial(k=scalar(elastancia))
      "Elastancia inicial del ventriculo"
      annotation (Placement(transformation(extent={{-78,-78},{-62,-62}},
            rotation=0)));
    Modelica.Blocks.Sources.Constant Constant1
      annotation (Placement(transformation(extent={{-76,-54},{-60,-38}},
            rotation=0)));
    Modelica.Blocks.Math.Division Division1
      annotation (Placement(transformation(extent={{-48,-60},{-28,-40}},
            rotation=0)));
    Modelica.Blocks.Math.Product Product2 annotation (Placement(transformation(
            extent={{-18,-34},{0,-18}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput
                                      FEV "Flujo entrada al ventriculo"
      annotation (Placement(transformation(extent={{-80,32},{-66,46}}, rotation=
             0)));
    compartimentoconvalvula compartimentoconvalvula1
      annotation (Placement(transformation(extent={{-6,-68},{108,28}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealInput
                                      PEV "Presion de entrada al ventriculo"
      annotation (Placement(transformation(extent={{-78,-48},{-64,-30}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       FSV "Flujo de salida del ventriculo"
      annotation (Placement(transformation(extent={{88,-54},{102,-40}},
                                                                      rotation=
              0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       VSV "Volumen de salida del ventriculo"
      annotation (Placement(transformation(extent={{0,24},{14,38}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       PSV "Presion de salida del ventriculo"
      annotation (Placement(transformation(extent={{76,4},{90,20}},rotation=0)));
   equation
    connect(Maxelas,Product1.u2)       annotation (Line(points={{-72,-15},{-90,
            -15},{-90,-20.8},{-63.8,-20.8}}, color={0,0,255}));
    connect(Constant1.y,Division1.u1)             annotation (Line(points={{
            -59.2,-46},{-56,-46},{-56,-44},{-50,-44}}, color={0,0,255}));
    connect(Einicial.y,Division1.u2)             annotation (Line(points={{
            -61.2,-70},{-54,-70},{-54,-56},{-50,-56}}, color={0,0,255}));
    connect(Product1.y,Product2.u1)             annotation (Line(points={{-43.1,
            -16},{-38,-16},{-38,-21.2},{-19.8,-21.2}}, color={0,0,255}));
    connect(Division1.y,Product2.u2)             annotation (Line(points={{-27,
            -50},{-24,-50},{-24,-30.8},{-19.8,-30.8}}, color={0,0,255}));
    connect(EV,Product1.u1)       annotation (Line(points={{-72,12},{-88,12},{
            -88,-11.2},{-63.8,-11.2}}, color={0,0,255}));
    connect(FEV, compartimentoconvalvula1.flujent) annotation (Line(points={{-73,39},
            {-41.5,39},{-41.5,-0.8},{-0.3,-0.8}},            color={0,0,255}));
    connect(Product2.y,       compartimentoconvalvula1.ELASTAN) annotation (Line(
          points={{0.9,-26},{6,-26},{6,-15.2},{-0.3,-15.2}}, color={0,0,255}));
    connect(PEV, compartimentoconvalvula1.present) annotation (Line(points={{-71,-39},
            {4,-39},{4,-30.08},{-2.01,-30.08}},          color={0,0,255}));
    connect(compartimentoconvalvula1.volsal, VSV) annotation (Line(points={{
            52.71,-4.16},{52.71,23.92},{7,23.92},{7,31}}, color={0,0,255}));
    connect(compartimentoconvalvula1.pressal, PSV) annotation (Line(points={{53.28,
            -14.72},{62.64,-14.72},{62.64,12},{83,12}},    color={0,0,255}));
    connect(compartimentoconvalvula1.flujsal, FSV) annotation (Line(points={{53.28,
            -25.76},{53.28,-45.88},{95,-45.88},{95,-47}},     color={0,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                        graphics),
                         Icon(graphics={Rectangle(
            extent={{-64,52},{0,-70}},
            lineColor={0,0,255},
            fillColor={0,127,255},
            fillPattern=FillPattern.Forward), Text(
            extent={{-54,14},{-4,-10}},
            lineColor={0,0,255},
            fillColor={0,127,255},
            fillPattern=FillPattern.Forward,
            textString=
                 "ventriculo")}));
   end ventriculo;

  model venderecho "Ventriculo derecho"

    ventriculo ventriculo1(compartimentoconvalvula1(admitancia(k=78),
          Integrator1(y_start=150)),
                                  Einicial(k=0.87))
      annotation (Placement(transformation(extent={{-40,-38},{72,56}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealInput
                                      FVP "Flujo valvula pulmonar"
      annotation (Placement(transformation(extent={{-72,36},{-58,52}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealInput
                                      HR "Duracion de un ciclo cardiaco"
      annotation (Placement(transformation(extent={{-98,14},{-84,30}}, rotation=
             0)));
    pulsos pulsos1 annotation (Placement(transformation(extent={{-92,40},{-26,
              118}},rotation=0)));
    Modelica.Blocks.Interfaces.RealInput
                                      EVderecho
      "Maximo de la elastancia en el ventriculo derecho"
      annotation (Placement(transformation(extent={{-74,-6},{-58,10}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealInput
                                      PVC "Presion vena cava"
      annotation (Placement(transformation(extent={{-74,-28},{-58,-12}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       VVD "Volumen ventriculo derecho"
      annotation (Placement(transformation(extent={{72,38},{86,54}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       PVD "Presion ventriculo derecho"
      annotation (Placement(transformation(extent={{74,12},{86,28}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       FVT "Flujo valvula tricuspide"
      annotation (Placement(transformation(extent={{78,-10},{92,4}},rotation=0)));
    Modelica.Blocks.Tables.CombiTable1D   CombiTable1D1(table=[0,0.0066; 0.0625,
          0.16; 0.125,0.32; 0.1875,0.45; 0.25,0.625; 0.3125,0.78; 0.375,0.27;
          0.4375,0.0066; 1,0.0066])
                             annotation (Placement(transformation(extent={{-60,
              10},{-40,30}}, rotation=0)));
  equation
    connect(FVP, ventriculo1.FEV) annotation (Line(points={{-65,44},{-38,44},{
            -38,27.33},{-24.88,27.33}}, color={0,0,255}));
    connect(HR, pulsos1.InPort1) annotation (Line(points={{-91,22},{-75.56,22},
            {-75.56,76.66},{-92,76.66}},    color={0,0,255}));
    connect(EVderecho, ventriculo1.Maxelas) annotation (Line(points={{-66,2},{
            -40,2},{-40,1.95},{-24.32,1.95}}, color={0,0,255}));
    connect(PVC, ventriculo1.PEV) annotation (Line(points={{-66,-20},{-38,-20},
            {-38,-9.33},{-23.76,-9.33}}, color={0,0,255}));
    connect(ventriculo1.VSV, VVD) annotation (Line(points={{19.92,23.57},{24,
            23.57},{24,46},{79,46}},      color={0,0,255}));
    connect(ventriculo1.PSV, PVD) annotation (Line(points={{62.48,14.64},{46,
            14.64},{46,20},{80,20}},
                                 color={0,0,255}));
    connect(ventriculo1.FSV, FVT) annotation (Line(points={{69.2,-13.09},{24,
            -13.09},{24,-3},{85,-3}},   color={0,0,255}));
    connect(pulsos1.OutPort1,CombiTable1D1.u[1])    annotation (Line(points={{-38.21,
            87.19},{-64.655,87.19},{-64.655,20},{-62,20}},        color={0,0,
            255}));
    connect(CombiTable1D1.y[1],    ventriculo1.EV) annotation (Line(points={{-39,20},
            {-26,20},{-26,14.64},{-24.32,14.64}},         color={0,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                        graphics),
                         Icon(graphics={
          Rectangle(
            extent={{-58,68},{10,-40}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={255,0,0}),
          Text(extent={{-48,50},{-2,32}}, textString=
                                              "ventriculo "),
          Text(extent={{-70,34},{18,22}}, textString=
                                              "derecho")}));
  end venderecho;

  model venizquierdo "ventriculo izquierdo"

    ventriculo ventriculo1(compartimentoconvalvula1(admitancia(k=17),
          Integrator1(y_start=150)),
                                  Einicial(k=0.8))
      annotation (Placement(transformation(extent={{-46,-22},{68,68}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealInput
                                      FVA "Flujo valvula aortica"
      annotation (Placement(transformation(extent={{-76,40},{-60,56}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealInput
                                      HR1 "Duracion del ciclo cardiaco"
      annotation (Placement(transformation(extent={{-76,20},{-62,34}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealInput
                                      EVizquierdo
      "Maximo de la elastancia del ventriculo izquierdo"
      annotation (Placement(transformation(extent={{-76,0},{-60,16}}, rotation=
              0)));
    Modelica.Blocks.Interfaces.RealInput
                                      PPV "Presion sistema pulmonar venoso"
      annotation (Placement(transformation(extent={{-74,-24},{-60,-6}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       VVI "Volumen ventriculo izquierdo"
      annotation (Placement(transformation(extent={{4,42},{18,58}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       PVI "Presion ventriculo izquierdo"
      annotation (Placement(transformation(extent={{4,12},{18,28}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       FVM "Flujo valvula mitral"
      annotation (Placement(transformation(extent={{4,-14},{18,2}}, rotation=0)));
    pulsos pulsos1 annotation (Placement(transformation(extent={{-88,-6},{-24,
              60}}, rotation=0)));
    Modelica.Blocks.Tables.CombiTable1D   CombiTable1D1(table=[0,0.0033; 0.0625,
          0.41; 0.125,0.63; 0.1875,0.73; 0.25,0.8; 0.3125,0.76; 0.375,0.25;
          0.4375,0.0033; 1,0.0033])
                            annotation (Placement(transformation(extent={{-52,
              20},{-36,36}}, rotation=0)));
  equation
    connect(FVA, ventriculo1.FEV) annotation (Line(points={{-68,48},{-50,48},{
            -50,40.55},{-30.61,40.55}}, color={0,0,255}));
    connect(HR1, pulsos1.InPort1) annotation (Line(points={{-69,27},{-81.5,27},
            {-81.5,25.02},{-88,25.02}},    color={0,0,255}));
    connect(pulsos1.OutPort1,CombiTable1D1.u[1])    annotation (Line(points={{-35.84,
            33.93},{-35.84,26.665},{-53.6,26.665},{-53.6,28}},        color={0,
            0,255}));
    connect(CombiTable1D1.y[1],    ventriculo1.EV) annotation (Line(points={{
            -35.2,28},{-28,28},{-28,28.4},{-30.04,28.4}}, color={0,0,255}));
    connect(EVizquierdo, ventriculo1.Maxelas) annotation (Line(points={{-68,8},
            {-58,8},{-58,16.25},{-30.04,16.25}}, color={0,0,255}));
    connect(PPV, ventriculo1.PEV) annotation (Line(points={{-67,-15},{-59.5,-15},
            {-59.5,5.45},{-29.47,5.45}}, color={0,0,255}));
    connect(ventriculo1.VSV, VVI) annotation (Line(points={{14.99,36.95},{
            34.495,36.95},{34.495,50},{11,50}}, color={0,0,255}));
    connect(ventriculo1.PSV, PVI) annotation (Line(points={{58.31,28.4},{36.495,
            28.4},{36.495,20},{11,20}},
                                      color={0,0,255}));
    connect(ventriculo1.FSV, FVM) annotation (Line(points={{65.15,1.85},{41.495,
            1.85},{41.495,-6},{11,-6}}, color={0,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}),
                        graphics),
                         Icon(graphics={
          Rectangle(
            extent={{-60,66},{4,-38}},
            lineColor={0,0,255},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid),
          Text(extent={{-72,48},{12,36}}, textString=
                                              "ventriculo"),
          Text(extent={{-62,34},{2,22}}, textString=
                                             "izquierdo")}));
  end venizquierdo;

  model circulacionsistemica

    Modelica.Blocks.Interfaces.RealInput
                                      FSV
      "Flujo circulación sistémica-vena cava"
      annotation (Placement(transformation(extent={{-80,56},{-64,76}}, rotation=
             0)));
    Modelica.Blocks.Continuous.Integrator Integrator1(y_start=3340)
      annotation (Placement(transformation(extent={{-18,34},{2,54}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       VCS "Volumen circulación sistémica"
      annotation (Placement(transformation(extent={{2,36},{18,54}}, rotation=0)));
    Modelica.Blocks.Math.Product Product1 annotation (Placement(transformation(
            extent={{-50,-2},{-30,18}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       PCS "Presión circulación sistémica"
      annotation (Placement(transformation(extent={{2,4},{20,20}}, rotation=0)));
    Modelica.Blocks.Math.Add Add2(k1=-1)
      annotation (Placement(transformation(extent={{-44,-32},{-24,-12}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealInput
                                      PAO "Presión aórtica"
      annotation (Placement(transformation(extent={{-82,-18},{-64,0}}, rotation=
             0)));
    Modelica.Blocks.Math.Product Product2 annotation (Placement(transformation(
            extent={{-8,-38},{12,-18}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       FAS
      "Flujo aorta-circulación sistémica"
      annotation (Placement(transformation(extent={{2,-30},{18,-12}}, rotation=
              0)));
    Modelica.Blocks.Math.Add3 Add3_1(k1=-1, k3=-1)
      annotation (Placement(transformation(extent={{-64,58},{-44,78}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealInput
                                      ingesta "Volumen líquido ingesta"
      annotation (Placement(transformation(extent={{-80,34},{-64,50}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealInput
                                      hemorragia "Volumen líquido hemorragia"
      annotation (Placement(transformation(extent={{-78,8},{-64,24}}, rotation=
              0)));
    Modelica.Blocks.Math.Add Add1 annotation (Placement(transformation(extent={
              {-48,34},{-28,54}}, rotation=0)));
    Modelica.Blocks.Sources.Constant elastancia(k=0.0153)
      annotation (Placement(transformation(extent={{-72,-6},{-56,8}}, rotation=
              0)));
    Modelica.Blocks.Interfaces.RealInput
                                      admitancia
      annotation (Placement(transformation(extent={{-78,-40},{-64,-24}},
            rotation=0)));
  equation
    connect(Integrator1.y,       VCS)
      annotation (Line(points={{3,44},{28.5,44},{28.5,45},{10,45}}, color={0,0,
            255}));
    connect(Integrator1.y,Product1.u1)             annotation (Line(points={{3,
            44},{2,44},{2,22},{-60,22},{-60,14},{-52,14}}, color={0,0,255}));
    connect(Product1.y,       PCS)
      annotation (Line(points={{-29,8},{-9.5,8},{-9.5,12},{11,12}}, color={0,0,
            255}));
    connect(PAO,Add2.u2)       annotation (Line(points={{-73,-9},{-48.5,-9},{
            -48.5,-28},{-46,-28}}, color={0,0,255}));
    connect(Product1.y,Add2.u1)             annotation (Line(points={{-29,8},{
            -28,8},{-28,-8},{-56,-8},{-56,-16},{-46,-16}}, color={0,0,255}));
    connect(Add2.y,Product2.u1)
      annotation (Line(points={{-23,-22},{-10,-22}}, color={0,0,255}));
    connect(Product2.y,       FAS) annotation (Line(points={{13,-28},{16.5,-28},
            {16.5,-21},{10,-21}}, color={0,0,255}));
    connect(FSV,Add3_1.u1)       annotation (Line(points={{-72,66},{-74,66},{
            -74,76},{-66,76}}, color={0,0,255}));

    connect(ingesta,Add3_1.u2)       annotation (Line(points={{-72,42},{-76,42},
            {-76,68},{-66,68}}, color={0,0,255}));
    connect(hemorragia,Add3_1.u3)       annotation (Line(points={{-71,16},{-72,
            16},{-72,42},{-66,42},{-66,60}}, color={0,0,255}));
    connect(Add3_1.y,Add1.u1)             annotation (Line(points={{-43,68},{
            -36,68},{-36,50},{-50,50}}, color={0,0,255}));
    connect(Add1.y,Integrator1.u)             annotation (Line(points={{-27,44},
            {-20,44}}, color={0,0,255}));
    connect(elastancia.y,Product1.u2)             annotation (Line(points={{
            -55.2,1},{-64.6,1},{-64.6,2},{-52,2}}, color={0,0,255}));
    connect(admitancia,Product2.u2)       annotation (Line(points={{-71,-32},{
            -40.5,-32},{-40.5,-34},{-10,-34}}, color={0,0,255}));
    connect(Product2.y,Add1.u2)             annotation (Line(points={{13,-28},{
            14,-28},{14,-54},{-64,-54},{-64,38},{-50,38}}, color={0,0,255}));
    annotation (Diagram(graphics),
                         Icon(graphics={
          Rectangle(
            extent={{-64,74},{2,-66}},
            lineColor={0,0,255},
            fillColor={255,127,127},
            fillPattern=FillPattern.Solid),
          Text(extent={{-58,44},{-2,30}}, textString=
                                              "circulacion"),
          Text(extent={{-60,30},{-4,16}}, textString=
                                              "sistemica")}));
  end circulacionsistemica;

   model modulocontrol "modulo de control"

    Modelica.Blocks.Interfaces.RealInput
                                      PAO "Presion aortica"
      annotation (Placement(transformation(extent={{-66,28},{-50,44}}, rotation=
             0)));

    media media1 annotation (Placement(transformation(extent={{-70,44},{-46,96}},
            rotation=0)));
    Modelica.Blocks.Logical.Switch          Switch1
      annotation (Placement(transformation(extent={{-72,2},{-58,18}}, rotation=
              0)));
    Modelica.Blocks.Interfaces.BooleanInput  activado
      annotation (Placement(transformation(extent={{-68,-60},{-52,-42}},
            rotation=0)));
    Modelica.Blocks.Sources.Constant PAOmedia(k=103.9884)
      "Presion aortica media de referencia"
      annotation (Placement(transformation(extent={{-94,-22},{-78,-6}},
            rotation=0)));
    Modelica.Blocks.Math.Add Add1(k1=-1) annotation (Placement(transformation(
            extent={{-32,-4},{-20,12}}, rotation=0)));
    Modelica.Blocks.Nonlinear.DeadZone DeadZone1(uMax=0.1, uMin=-0.1)
      annotation (Placement(transformation(extent={{-14,-6},{2,8}}, rotation=0)));
    Modelica.Blocks.Continuous.TransferFunction H1(a={15,1}, b={1})
      annotation (Placement(transformation(extent={{8,60},{24,74}}, rotation=0)));
    Modelica.Blocks.Continuous.TransferFunction H2(a={15,1}, b={0.048})
      annotation (Placement(transformation(extent={{10,16},{26,30}}, rotation=0)));
    Modelica.Blocks.Continuous.TransferFunction H3(a={30,1}, b={0.194})
      annotation (Placement(transformation(extent={{12,-30},{28,-16}}, rotation=
             0)));
    Modelica.Blocks.Continuous.TransferFunction H4(a={2,1}, b={0.1})
      annotation (Placement(transformation(extent={{8,-74},{24,-60}}, rotation=
              0)));
    Modelica.Blocks.Math.Add Add2 annotation (Placement(transformation(extent={
              {46,-32},{60,-18}}, rotation=0)));
    Modelica.Blocks.Math.Add Add3 annotation (Placement(transformation(extent={
              {46,20},{60,34}}, rotation=0)));
    Modelica.Blocks.Math.Add Add4 annotation (Placement(transformation(extent={
              {34,78},{48,92}}, rotation=0)));
    Modelica.Blocks.Math.Add Add5 annotation (Placement(transformation(extent={
              {40,-90},{54,-76}}, rotation=0)));
    Modelica.Blocks.Sources.Constant HR0(k=80)
      "Frecuencia cardiaca de referencia" annotation (Placement(transformation(
            extent={{6,82},{22,96}}, rotation=0)));
    Modelica.Blocks.Sources.Constant EV0izquierdo(k=0.8)
      "Elastancia ventricular izquierda maxima de referencia"
      annotation (Placement(transformation(extent={{10,-6},{26,8}}, rotation=0)));
    Modelica.Blocks.Sources.Constant EV0derecho(k=0.78)
      "Elastancia ventricular derecha maxima de refencia"
      annotation (Placement(transformation(extent={{10,38},{26,52}}, rotation=0)));
    Modelica.Blocks.Sources.Constant RS0(k=0.6135)
      "Resistencia circulatoria sistemica de referencia"
      annotation (Placement(transformation(extent={{10,-98},{26,-82}}, rotation=
             0)));
    Modelica.Blocks.Math.Add Add6 annotation (Placement(transformation(extent={
              {46,-2},{60,12}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       HR "Frecuencia cardiaca"
      annotation (Placement(transformation(extent={{58,70},{74,86}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       EVizquierda
      "Elastancia ventricular izquierda maxima"
      annotation (Placement(transformation(extent={{58,-6},{72,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       CV "Compilancia vena cava"
      annotation (Placement(transformation(extent={{58,-36},{74,-18}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       RS "Resistencia circulatoria sistemica"
      annotation (Placement(transformation(extent={{58,-72},{76,-56}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       EVderecho
      "Elastancia ventricular derecha maxima"
      annotation (Placement(transformation(extent={{58,22},{74,38}}, rotation=0)));
    Modelica.Blocks.Sources.Step Step1(
      offset=250,
      startTime=20,
      height=250)   annotation (Placement(transformation(extent={{-42,-56},{-22,
              -36}}, rotation=0)));
   equation
    connect(PAO, media1.PAO) annotation (Line(points={{-58,36},{-77.46,36},{
            -77.46,72.34},{-68.92,72.34}}, color={0,0,255}));
    connect(media1.media,Switch1.u1)       annotation (Line(points={{-47.32,
            72.6},{-41.66,72.6},{-41.66,16.4},{-73.4,16.4}}, color={0,0,255}));
    connect(activado,Switch1.u2)       annotation (Line(points={{-60,-51},{-56,
            -51},{-58,10},{-73.4,10}}, color={255,0,255}));
    connect(PAOmedia.y,Switch1.u3)             annotation (Line(points={{-77.2,
            -14},{-68,-14},{-68,3.6},{-73.4,3.6}}, color={0,0,255}));
    connect(PAOmedia.y,Add1.u2)             annotation (Line(points={{-77.2,-14},
            {-36,-14},{-36,-0.8},{-33.2,-0.8}}, color={0,0,255}));
    connect(Switch1.y,Add1.u1)             annotation (Line(points={{-57.3,10},
            {-43.25,10},{-43.25,8.8},{-33.2,8.8}}, color={0,0,255}));
    connect(Add1.y,DeadZone1.u)             annotation (Line(points={{-19.4,4},
            {-16,4},{-16,1},{-15.6,1}}, color={0,0,255}));
    connect(DeadZone1.y,H1.u)             annotation (Line(points={{2.8,1},{4,1},
            {4,67},{6.4,67}}, color={0,0,255}));
    connect(DeadZone1.y,H2.u)             annotation (Line(points={{2.8,1},{4.6,
            1},{4.6,23},{8.4,23}}, color={0,0,255}));
    connect(DeadZone1.y,H3.u)             annotation (Line(points={{2.8,1},{2.8,
            -26},{4,-26},{4,-23},{10.4,-23}}, color={0,0,255}));
    connect(DeadZone1.y,H4.u)             annotation (Line(points={{2.8,1},{4,
            -70},{6.4,-67}}, color={0,0,255}));
    connect(H1.y,Add4.u2)             annotation (Line(points={{24.8,67},{30.4,
            67},{30.4,80.8},{32.6,80.8}}, color={0,0,255}));
    connect(H2.y,Add3.u2)             annotation (Line(points={{26.8,23},{33.4,
            23},{33.4,22.8},{44.6,22.8}}, color={0,0,255}));
    connect(H3.y,Add2.u1)             annotation (Line(points={{28.8,-23},{35.4,
            -23},{35.4,-20.8},{44.6,-20.8}}, color={0,0,255}));
    connect(HR0.y,Add4.u1)             annotation (Line(points={{22.8,89},{22.8,
            89.5},{32.6,89.5},{32.6,89.2}}, color={0,0,255}));
    connect(EV0derecho.y,Add3.u1)             annotation (Line(points={{26.8,45},
            {26.8,45.5},{44.6,45.5},{44.6,31.2}}, color={0,0,255}));
    connect(H2.y,Add6.u1)             annotation (Line(points={{26.8,23},{36,23},
            {36,9.2},{44.6,9.2}}, color={0,0,255}));
    connect(EV0izquierdo.y,Add6.u2)             annotation (Line(points={{26.8,
            1},{37.4,1},{37.4,0.8},{44.6,0.8}}, color={0,0,255}));
    connect(RS0.y,Add5.u2)             annotation (Line(points={{26.8,-90},{34,
            -90},{34,-87.2},{38.6,-87.2}}, color={0,0,255}));
    connect(H4.y,Add5.u1)             annotation (Line(points={{24.8,-67},{31.4,
            -67},{31.4,-78.8},{38.6,-78.8}}, color={0,0,255}));
    connect(Add4.y,       HR) annotation (Line(points={{48.7,85},{60.35,85},{
            60.35,78},{66,78}}, color={0,0,255}));
    connect(Add3.y,       EVderecho) annotation (Line(points={{60.7,27},{68.35,
            27},{68.35,30},{66,30}}, color={0,0,255}));
    connect(Add6.y,       EVizquierda) annotation (Line(points={{60.7,5},{68.35,
            5},{68.35,2},{65,2}}, color={0,0,255}));
    connect(Add2.y,       CV) annotation (Line(points={{60.7,-25},{68.35,-25},{
            68.35,-27},{66,-27}}, color={0,0,255}));
    connect(Add5.y,       RS) annotation (Line(points={{54.7,-83},{64.35,-83},{
            64.35,-64},{67,-64}}, color={0,0,255}));
    connect(Step1.y,Add2.u2)             annotation (Line(points={{-21,-46},{12,
            -46},{12,-29.2},{44.6,-29.2}}, color={0,0,255}));
    annotation (Diagram(graphics),
                         Icon(coordinateSystem(preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}),
                              graphics={
          Rectangle(
            extent={{-48,96},{56,-96}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Text(extent={{-72,52},{76,30}}, textString=
                                              "Modulo"),
          Text(extent={{-14,24},{16,2}}, textString=
                                             "de"),
          Text(extent={{-34,-12},{46,-38}}, textString=
                                                "Control")}));
   end modulocontrol;

   model acumulador

    Modelica.Blocks.Interfaces.RealInput
                                      PAO "Presion aortica"
      annotation (Placement(transformation(extent={{-98,34},{-84,50}}, rotation=
             0)));
    Modelica.Blocks.Sources.Constant cero(k=0)
      annotation (Placement(transformation(extent={{-98,-48},{-84,-34}},
            rotation=0)));
    Modelica.Blocks.Logical.Switch          Switch1
      annotation (Placement(transformation(extent={{-46,-10},{-26,10}},
            rotation=0)));
    Modelica.Blocks.Interfaces.BooleanInput  subida "salida de < ="
      annotation (Placement(transformation(extent={{-94,-10},{-80,8}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       acumulador
      annotation (Placement(transformation(extent={{92,16},{108,32}}, rotation=
              0)));
    Modelica.Blocks.Math.Sum Sum1(nin=2, k={1-Modelica.Constants.eps,1-Modelica.Constants.eps})
                                         annotation (Placement(transformation(
            extent={{32,-12},{52,8}}, rotation=0)));
    Modelica.Blocks.Routing.Multiplex2              Multiplex2_1
      annotation (Placement(transformation(extent={{-8,-12},{12,8}}, rotation=0)));
   equation
    connect(PAO,Switch1.u1)
      annotation (Line(points={{-91,42},{-66,42},{-66,8},{-48,8}}, color={0,0,
            255}));
    connect(cero.y,Switch1.u3)             annotation (Line(points={{-83.3,-41},
            {-52.65,-41},{-52.65,-8},{-48,-8}}, color={0,0,255}));
    connect(subida,Switch1.u2)
      annotation (Line(points={{-87,-1},{-88,-1},{-88,0},{-48,0}}, color={255,0,
            255}));
    connect(Sum1.y,       acumulador)
      annotation (Line(points={{53,-2},{76,-2},{76,24},{100,24}}, color={0,0,
            255}));
    connect(Switch1.y,Multiplex2_1.u1[1])
      annotation (Line(points={{-25,0},{-18,0},{-18,4},{-10,4}}, color={0,0,255}));
    connect(Multiplex2_1.y,Sum1.u)
      annotation (Line(points={{13,-2},{30,-2}}, color={0,0,255}));
    connect(Sum1.y,Multiplex2_1.u2[1])          annotation (Line(points={{53,-2},
            {56,-2},{56,-46},{-18,-46},{-18,-8},{-10,-8}}, color={0,0,255}));
    annotation (Diagram(graphics),
                         Icon(graphics={Rectangle(
            extent={{-40,20},{0,-20}},
            lineColor={0,0,255},
            fillColor={255,127,255},
            fillPattern=FillPattern.Solid), Text(extent={{-36,20},{-2,-16}},
              textString=
              "acumulador")}));
   end acumulador;

   model contador

    Modelica.Blocks.Sources.Constant Constant1(k=1)
      annotation (Placement(transformation(extent={{-84,28},{-70,44}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.BooleanInput  subida "salida de < ="
      annotation (Placement(transformation(extent={{-84,-10},{-70,6}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       contador
      annotation (Placement(transformation(extent={{42,0},{56,18}}, rotation=0)));

    acumulador acumulador1 annotation (Placement(transformation(extent={{-44,
              -22},{20,26}}, rotation=0)));
   equation
    connect(Constant1.y,       acumulador1.PAO) annotation (Line(points={{-69.3,
            36},{-56,36},{-56,12.08},{-41.12,12.08}}, color={0,0,255}));
    connect(subida, acumulador1.subida) annotation (Line(points={{-77,-2},{-58,
            -2},{-58,1.76},{-39.84,1.76}}, color={255,0,255}));
    connect(acumulador1.acumulador, contador)
      annotation (Line(points={{20,7.76},{34,7.76},{34,9},{49,9}}, color={0,0,
            255}));
    annotation (Diagram(graphics),
                         Icon(graphics={Rectangle(
            extent={{-10,24},{20,-4}},
            lineColor={0,0,255},
            fillColor={255,127,255},
            fillPattern=FillPattern.Backward), Text(extent={{-8,28},{18,-8}},
              textString=
                   "contador")}));
   end contador;

   model media "calcula la presion media aortica"

    Modelica.Blocks.Interfaces.RealInput
                                      PAO "Presion aortica"
      annotation (Placement(transformation(extent={{-100,0},{-82,18}}, rotation=
             0)));
    Modelica.Blocks.Discrete.UnitDelay          UnitDelay1(samplePeriod=0.03)
      annotation (Placement(transformation(extent={{-76,-10},{-60,6}}, rotation=
             0)));
    Modelica.Blocks.Logical.Greater          Compare1
      annotation (Placement(transformation(extent={{-62,14},{-42,34}}, rotation=
             0)));
    Modelica.Blocks.Math.Division Division1
      annotation (Placement(transformation(extent={{-24,52},{-10,68}}, rotation=
             0)));
    Modelica.Blocks.Logical.Switch          Switch1
      annotation (Placement(transformation(extent={{14,-2},{34,18}}, rotation=0)));
    Modelica.Blocks.Discrete.UnitDelay          UnitDelay2(samplePeriod=0.03)
      annotation (Placement(transformation(extent={{42,0},{58,16}}, rotation=0)));
    Modelica.Blocks.Logical.Switch          Switch2
      annotation (Placement(transformation(extent={{-24,-50},{-4,-30}},
            rotation=0)));
    Modelica.Blocks.Logical.Greater          Compare2
      annotation (Placement(transformation(extent={{-64,-48},{-44,-28}},
            rotation=0)));
    Modelica.Blocks.Discrete.UnitDelay          UnitDelay3(samplePeriod=0.03)
      annotation (Placement(transformation(extent={{10,-46},{26,-30}}, rotation=
             0)));
    Modelica.Blocks.Logical.Switch          Switch3
      annotation (Placement(transformation(extent={{50,-72},{70,-52}}, rotation=
             0)));
    Modelica.Blocks.Sources.Constant PAOmedia(k=103.9884)
      "Presion aortica media de referencia"
      annotation (Placement(transformation(extent={{-26,-88},{-8,-74}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       media annotation (Placement(
          transformation(extent={{80,2},{98,18}}, rotation=0)));
    acumulador acumulador1 annotation (Placement(transformation(extent={{-66,66},
              {10,108}}, rotation=0)));
    contador contador1(acumulador1(cero(k=1e-15)))
                       annotation (Placement(transformation(extent={{-28,-32},{
              -2,24}}, rotation=0)));
   equation
    connect(PAO,UnitDelay1.u)       annotation (Line(points={{-91,9},{-83.5,9},
            {-83.5,-2},{-77.6,-2}}, color={0,0,255}));
    connect(UnitDelay1.y,Compare1.u2)             annotation (Line(points={{
            -59.2,-2},{-66,-2},{-66,16},{-64,16}}, color={0,0,255}));
    connect(PAO,Compare1.u1)       annotation (Line(points={{-91,9},{-91,38},{
            -64,38},{-64,24}}, color={0,0,255}));
    connect(Division1.y,Switch1.u1)
      annotation (Line(points={{-9.3,60},{8,60},{8,16},{12,16}}, color={0,0,255}));
    connect(Compare1.y,Switch1.u2)
      annotation (Line(points={{-41,24},{-30,24},{-30,8},{12,8}}, color={255,0,
            255}));
    connect(Switch1.y,UnitDelay2.u)
      annotation (Line(points={{35,8},{40.4,8}}, color={0,0,255}));
    connect(UnitDelay2.y,Switch1.u3)             annotation (Line(points={{58.8,
            8},{68,8},{68,-12},{0,-12},{0,0},{12,0}}, color={0,0,255}));
    connect(UnitDelay1.y,Compare2.u1)             annotation (Line(points={{
            -59.2,-2},{-68,-2},{-68,-38},{-66,-38}}, color={0,0,255}));
    connect(PAO,Compare2.u2)
      annotation (Line(points={{-91,9},{-91,-46},{-66,-46}}, color={0,0,255}));
    connect(Compare2.y,Switch2.u2)             annotation (Line(points={{-43,
            -38},{-36,-38},{-36,-40},{-26,-40}}, color={255,0,255}));
    connect(Switch2.y,UnitDelay3.u)
      annotation (Line(points={{-3,-40},{2,-40},{2,-38},{8.4,-38}}, color={0,0,
            255}));
    connect(UnitDelay3.y,Switch3.u1)
      annotation (Line(points={{26.8,-38},{48,-38},{48,-54}}, color={0,0,255}));
    connect(UnitDelay3.y,Switch2.u3)             annotation (Line(points={{26.8,
            -38},{28,-38},{28,-54},{-38,-54},{-38,-48},{-26,-48}}, color={0,0,
            255}));
    connect(Compare2.y,Switch3.u2)             annotation (Line(points={{-43,
            -38},{-40,-38},{-40,-62},{48,-62}}, color={255,0,255}));
    connect(PAOmedia.y,Switch3.u3)             annotation (Line(points={{-7.1,
            -81},{15.45,-81},{15.45,-70},{48,-70}}, color={0,0,255}));
    connect(Switch3.y,       media)
      annotation (Line(points={{71,-62},{76,-62},{76,10},{89,10}}, color={0,0,
            255}));
    connect(Compare1.y,       acumulador1.subida) annotation (Line(points={{-41,
            24},{-42,24},{-42,62},{-78,62},{-78,76},{-61.06,76},{-61.06,86.79}},
          color={255,0,255}));
    connect(PAO, acumulador1.PAO)
      annotation (Line(points={{-91,9},{-91,95.82},{-62.58,95.82}}, color={0,0,
            255}));
    connect(acumulador1.acumulador,Division1.u1)       annotation (Line(points=
            {{10,92.04},{10,66.71},{-25.4,66.71},{-25.4,64.8}}, color={0,0,255}));
    connect(Division1.u2,      contador1.contador) annotation (Line(points={{
            -25.4,55.2},{-8.63,55.2},{-8.63,-1.48}}, color={0,0,255}));
    connect(Compare1.y,       contador1.subida) annotation (Line(points={{-41,
            24},{-34,24},{-34,-4.56},{-25.01,-4.56}}, color={255,0,255}));
    connect(UnitDelay2.y,Switch2.u1)             annotation (Line(points={{58.8,
            8},{58,8},{58,-18},{-30,-18},{-30,-32},{-26,-32}}, color={0,0,255}));
    annotation (Icon(graphics={Rectangle(
            extent={{-82,22},{80,-4}},
            lineColor={0,0,255},
            fillColor={159,159,223},
            fillPattern=FillPattern.Solid), Text(extent={{-94,18},{82,-2}},
              textString =                      "media")}),Diagram(graphics));
   end media;

  model arteriaaorta

    compartimentoconvalvula compartimentoconvalvula1(admitancia(k=80),
        Integrator1(y_start=100))
                               annotation (Placement(transformation(extent={{
              -48,-56},{108,62}}, rotation=0)));
    Modelica.Blocks.Sources.Constant elastancia(k=0.8)
      "elastancia de la arteria aorta" annotation (Placement(transformation(
            extent={{-44,2},{-28,16}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput
                                      FAS "Flujo aorta-circulacion sistemica"
      annotation (Placement(transformation(extent={{-58,30},{-42,44}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealInput
                                      PVI "Presion ventriculo izquierdo"
      annotation (Placement(transformation(extent={{-56,-12},{-40,4}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       VAO "Voumen aorta"
      annotation (Placement(transformation(extent={{26,24},{38,40}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       PAO "Presion aorta"
      annotation (Placement(transformation(extent={{26,0},{38,14}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       FVA "Flujo valvula aórtica"
      annotation (Placement(transformation(extent={{24,-26},{34,-12}}, rotation=
             0)));
  equation
    connect(elastancia.y,       compartimentoconvalvula1.ELASTAN) annotation (Line(
          points={{-27.2,9},{-40.7,9},{-40.7,8.9},{-40.2,8.9}}, color={0,0,255}));
    connect(FAS, compartimentoconvalvula1.flujent) annotation (Line(points={{-50,37},
            {-50,26.6},{-40.2,26.6}},            color={0,0,255}));
    connect(PVI, compartimentoconvalvula1.present) annotation (Line(points={{-48,-4},
            {-52,-4},{-52,-9.39},{-42.54,-9.39}},         color={0,0,255}));
    connect(compartimentoconvalvula1.volsal, VAO) annotation (Line(points={{
            32.34,22.47},{27.385,22.47},{27.385,32},{32,32}}, color={0,0,255}));
    connect(compartimentoconvalvula1.pressal, PAO) annotation (Line(points={{
            33.12,9.49},{29.68,9.49},{29.68,7},{32,7}}, color={0,0,255}));
    connect(compartimentoconvalvula1.flujsal, FVA) annotation (Line(points={{
            33.12,-4.08},{27.68,-4.08},{27.68,-19},{29,-19}}, color={0,0,255}));
    annotation (Diagram(graphics),
                         Icon(graphics={
          Rectangle(
            extent={{-40,68},{24,-54}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={0,127,255}),
          Text(
            extent={{-32,42},{14,30}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={0,127,255},
            textString=
                 "arteria"),
          Text(
            extent={{-24,18},{4,4}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={0,127,255},
            textString=
                 "aorta")}));
  end arteriaaorta;

  model sistemapulmonarterial

    compartimentoconvalvula compartimentoconvalvula1(admitancia(k=90),
        Integrator1(y_start=120))
                               annotation (Placement(transformation(extent={{
              -68,-66},{88,86}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput
                                      FSP "Flujo sistema pulmonar"
      annotation (Placement(transformation(extent={{-50,28},{-36,40}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealInput
                                      PVD "Presion ventriculo derecho"
      annotation (Placement(transformation(extent={{-50,-2},{-38,12}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       VPA
      "Volumen del sistema pulmonar arterial"
      annotation (Placement(transformation(extent={{22,28},{34,40}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       PAP "Presion arterial pulmonar"
      annotation (Placement(transformation(extent={{22,8},{34,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       FVP "Flujo válvula pulmonar"
      annotation (Placement(transformation(extent={{22,-14},{34,0}}, rotation=0)));
    Modelica.Blocks.Sources.Constant elastancia(k=0.1333)
      "elastancia del sistema pulmonar arterial"
      annotation (Placement(transformation(extent={{-72,12},{-56,24}}, rotation=
             0)));
  equation
    connect(elastancia.y,       compartimentoconvalvula1.ELASTAN) annotation (Line(
          points={{-55.2,18},{-54,18},{-54,17.6},{-60.2,17.6}}, color={0,0,255}));
    connect(FSP, compartimentoconvalvula1.flujent) annotation (Line(points={{-43,34},
            {-52,34},{-52,40.4},{-60.2,40.4}},            color={0,0,255}));
    connect(PVD, compartimentoconvalvula1.present) annotation (Line(points={{-44,5},
            {-61,5},{-61,-5.96},{-62.54,-5.96}},        color={0,0,255}));
    connect(compartimentoconvalvula1.volsal, VPA) annotation (Line(points={{
            12.34,35.08},{26.17,35.08},{26.17,34},{28,34}}, color={0,0,255}));
    connect(compartimentoconvalvula1.pressal, PAP) annotation (Line(points={{
            13.12,18.36},{28.56,18.36},{28.56,14},{28,14}}, color={0,0,255}));
    connect(compartimentoconvalvula1.flujsal, FVP) annotation (Line(points={{
            13.12,0.88},{13.12,-15.56},{28,-15.56},{28,-7}}, color={0,0,255}));
    annotation (Diagram(graphics),
                         Icon(graphics={
          Rectangle(
            extent={{-36,60},{22,-50}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={0,127,255}),
          Text(
            extent={{-24,34},{8,8}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={0,127,255},
            textString=
                 "sistema"),
          Text(
            extent={{-24,18},{12,2}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={0,127,255},
            textString=
                 "pulmonar"),
          Text(
            extent={{-26,6},{10,-12}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={0,127,255},
            textString=
                 "arterial")}));
  end sistemapulmonarterial;

  model sistemapulmonarvenoso

    compartimentogeneral compartimentogeneral1(admitancia(k=7),   Integrator1(y_start=
            240))    annotation (Placement(transformation(extent={{-36,-36},{76,
              66}}, rotation=0)));
    Modelica.Blocks.Sources.Constant elastancia(k=0.033)
      annotation (Placement(transformation(extent={{-74,6},{-58,22}}, rotation=
              0)));
    Modelica.Blocks.Interfaces.RealInput
                                      FMV "Flujo válvula mitral"
      annotation (Placement(transformation(extent={{-48,34},{-36,46}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealInput
                                      PPA "Presión sistema pulmonar arterial"
      annotation (Placement(transformation(extent={{-46,-2},{-32,14}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       VPV "Volumen sistema pulmonar venoso"
      annotation (Placement(transformation(extent={{26,40},{38,54}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       PPV "Presión sistema pulmonar venoso"
      annotation (Placement(transformation(extent={{28,20},{40,34}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       FSP "Flujo sistema pulmonar"
      annotation (Placement(transformation(extent={{26,2},{36,14}}, rotation=0)));
  equation
    connect(FMV, compartimentogeneral1.flujent) annotation (Line(points={{-42,
            40},{-44,40},{-44,35.4},{-22.56,35.4}}, color={0,0,255}));
    connect(elastancia.y,       compartimentogeneral1.elastancia) annotation (Line(
          points={{-57.2,14},{-40,14},{-40,17.55},{-21.44,17.55}}, color={0,0,
            255}));
    connect(PPA, compartimentogeneral1.present) annotation (Line(points={{-39,6},
            {-44,6},{-44,1.23},{-22,1.23}}, color={0,0,255}));
    connect(compartimentogeneral1.volusal, VPV) annotation (Line(points={{20,
            32.85},{37,32.85},{37,47},{32,47}}, color={0,0,255}));
    connect(compartimentogeneral1.presisal, PPV) annotation (Line(points={{
            20.56,17.04},{34.28,17.04},{34.28,27},{34,27}}, color={0,0,255}));
    connect(compartimentogeneral1.flujsal, FSP) annotation (Line(points={{20,
            2.25},{20,-15.875},{31,-15.875},{31,8}}, color={0,0,255}));
    annotation (Diagram(graphics),
                         Icon(graphics={
          Rectangle(
            extent={{-32,68},{26,-32}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={0,191,0}),
          Text(
            extent={{-24,48},{18,38}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={0,191,0},
            textString=
                 "sistema"),
          Text(
            extent={{-24,38},{20,26}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={0,191,0},
            textString=
                 "pulmonar"),
          Text(
            extent={{-22,28},{16,16}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={0,191,0},
            textString=
                 "venoso")}));
  end sistemapulmonarvenoso;

  model venacava

    compartimentogeneral compartimentogeneral1(admitancia(k=1.65),
        Integrator1(y_start=500))
                               annotation (Placement(transformation(extent={{
              -50,-46},{60,66}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput
                                      FVT "Flujo válvula tricúspide"
      annotation (Placement(transformation(extent={{-56,26},{-44,40}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealInput
                                      Elastancia "Copilancia de la vena cava"
      annotation (Placement(transformation(extent={{-56,4},{-44,18}}, rotation=
              0)));
    Modelica.Blocks.Interfaces.RealInput
                                      PCS "Presión ciculación sistémica"
      annotation (Placement(transformation(extent={{-56,-18},{-44,-4}},
            rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       PVC "Presión vena cava"
      annotation (Placement(transformation(extent={{14,6},{24,18}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       VVC "Volumen vena cava"
      annotation (Placement(transformation(extent={{14,26},{24,38}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       FSV
      "Flujo circulación sistémica-vena cava"
      annotation (Placement(transformation(extent={{14,-14},{24,-2}}, rotation=
              0)));
  equation
    connect(FVT, compartimentogeneral1.flujent) annotation (Line(points={{-50,
            33},{-53,33},{-53,32.4},{-36.8,32.4}}, color={0,0,255}));
    connect(Elastancia, compartimentogeneral1.elastancia) annotation (Line(
          points={{-50,11},{-52,11},{-52,12.8},{-35.7,12.8}}, color={0,0,255}));
    connect(PCS, compartimentogeneral1.present) annotation (Line(points={{-50,
            -11},{-53,-11},{-53,-5.12},{-36.25,-5.12}}, color={0,0,255}));
    connect(compartimentogeneral1.volusal, VVC) annotation (Line(points={{5,
            29.6},{13.5,29.6},{13.5,32},{19,32}}, color={0,0,255}));
    connect(compartimentogeneral1.presisal, PVC) annotation (Line(points={{5.55,
            12.24},{16.775,12.24},{16.775,12},{19,12}}, color={0,0,255}));
    connect(compartimentogeneral1.flujsal, FSV) annotation (Line(points={{5,-4},
            {20,-4},{20,-8},{19,-8}}, color={0,0,255}));
    annotation (Diagram(graphics),
                         Icon(graphics={
          Rectangle(
            extent={{-42,58},{14,-52}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={0,191,0}),
          Text(
            extent={{-32,32},{2,16}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={0,191,0},
            textString=
                 "vena"),
          Text(
            extent={{-30,22},{2,6}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={0,191,0},
            textString=
                 "cava")}));
  end venacava;

  model testcontrol

    replaceable modulocontroltest modulocontrol1
      annotation (Placement(transformation(extent={{-18,2},{2,22}})));
    Modelica.Blocks.Sources.Ramp ramp(
      duration=120,
      startTime=60,
      height=80,
      offset=80) annotation (Placement(transformation(extent={{-74,6},{-54,26}})));
  equation

    modulocontrol1.activado = true;
    connect(ramp.y, modulocontrol1.PAO) annotation (Line(
        points={{-53,16},{-34,16},{-34,15.6},{-13.8,15.6}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics));
  end testcontrol;

   model modulocontroltest "modulo de control"

    Modelica.Blocks.Interfaces.RealInput
                                      PAO "Presion aortica"
      annotation (Placement(transformation(extent={{-66,28},{-50,44}}, rotation=
             0)));

    Modelica.Blocks.Logical.Switch          Switch1
      annotation (Placement(transformation(extent={{-72,2},{-58,18}}, rotation=
              0)));
    Modelica.Blocks.Interfaces.BooleanInput  activado
      annotation (Placement(transformation(extent={{-68,-60},{-52,-42}},
            rotation=0)));
    Modelica.Blocks.Sources.Constant PAOmedia(k=103.9884)
      "Presion aortica media de referencia"
      annotation (Placement(transformation(extent={{-94,-22},{-78,-6}},
            rotation=0)));
    Modelica.Blocks.Math.Add Add1(k1=-1) annotation (Placement(transformation(
            extent={{-32,-4},{-20,12}}, rotation=0)));
    Modelica.Blocks.Nonlinear.DeadZone DeadZone1(uMax=0.1, uMin=-0.1)
      annotation (Placement(transformation(extent={{-14,-6},{2,8}}, rotation=0)));
    Modelica.Blocks.Continuous.TransferFunction H1(a={15,1}, b={1})
      annotation (Placement(transformation(extent={{8,60},{24,74}}, rotation=0)));
    Modelica.Blocks.Continuous.TransferFunction H2(a={15,1}, b={0.048})
      annotation (Placement(transformation(extent={{10,16},{26,30}}, rotation=0)));
    Modelica.Blocks.Continuous.TransferFunction H3(a={30,1}, b={0.194})
      annotation (Placement(transformation(extent={{12,-30},{28,-16}}, rotation=
             0)));
    Modelica.Blocks.Continuous.TransferFunction H4(a={2,1}, b={0.1})
      annotation (Placement(transformation(extent={{8,-74},{24,-60}}, rotation=
              0)));
    Modelica.Blocks.Math.Add Add2 annotation (Placement(transformation(extent={
              {46,-32},{60,-18}}, rotation=0)));
    Modelica.Blocks.Math.Add Add3 annotation (Placement(transformation(extent={
              {46,20},{60,34}}, rotation=0)));
    Modelica.Blocks.Math.Add Add4 annotation (Placement(transformation(extent={
              {34,78},{48,92}}, rotation=0)));
    Modelica.Blocks.Math.Add Add5 annotation (Placement(transformation(extent={
              {40,-90},{54,-76}}, rotation=0)));
    Modelica.Blocks.Sources.Constant HR0(k=80)
      "Frecuencia cardiaca de referencia" annotation (Placement(transformation(
            extent={{6,82},{22,96}}, rotation=0)));
    Modelica.Blocks.Sources.Constant EV0izquierdo(k=0.8)
      "Elastancia ventricular izquierda maxima de referencia"
      annotation (Placement(transformation(extent={{10,-6},{26,8}}, rotation=0)));
    Modelica.Blocks.Sources.Constant EV0derecho(k=0.78)
      "Elastancia ventricular derecha maxima de refencia"
      annotation (Placement(transformation(extent={{10,38},{26,52}}, rotation=0)));
    Modelica.Blocks.Sources.Constant RS0(k=0.6135)
      "Resistencia circulatoria sistemica de referencia"
      annotation (Placement(transformation(extent={{10,-98},{26,-82}}, rotation=
             0)));
    Modelica.Blocks.Math.Add Add6 annotation (Placement(transformation(extent={
              {46,-2},{60,12}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       HR "Frecuencia cardiaca"
      annotation (Placement(transformation(extent={{58,70},{74,86}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       EVizquierda
      "Elastancia ventricular izquierda maxima"
      annotation (Placement(transformation(extent={{58,-6},{72,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       CV "Compilancia vena cava"
      annotation (Placement(transformation(extent={{58,-36},{74,-18}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       RS "Resistencia circulatoria sistemica"
      annotation (Placement(transformation(extent={{58,-72},{76,-56}}, rotation=
             0)));
    Modelica.Blocks.Interfaces.RealOutput
                                       EVderecho
      "Elastancia ventricular derecha maxima"
      annotation (Placement(transformation(extent={{58,22},{74,38}}, rotation=0)));
    Modelica.Blocks.Sources.Step Step1(
      height=200,
      offset=250,
      startTime=20) annotation (Placement(transformation(extent={{-42,-56},{-22,
              -36}}, rotation=0)));
   equation
    connect(activado,Switch1.u2)       annotation (Line(points={{-60,-51},{-56,
            -51},{-58,10},{-73.4,10}}, color={255,0,255}));
    connect(PAOmedia.y,Switch1.u3)             annotation (Line(points={{-77.2,
            -14},{-68,-14},{-68,3.6},{-73.4,3.6}}, color={0,0,255}));
    connect(PAOmedia.y,Add1.u2)             annotation (Line(points={{-77.2,-14},
            {-36,-14},{-36,-0.8},{-33.2,-0.8}}, color={0,0,255}));
    connect(Switch1.y,Add1.u1)             annotation (Line(points={{-57.3,10},
            {-43.25,10},{-43.25,8.8},{-33.2,8.8}}, color={0,0,255}));
    connect(Add1.y,DeadZone1.u)             annotation (Line(points={{-19.4,4},
            {-16,4},{-16,1},{-15.6,1}}, color={0,0,255}));
    connect(DeadZone1.y,H1.u)             annotation (Line(points={{2.8,1},{4,1},
            {4,67},{6.4,67}}, color={0,0,255}));
    connect(DeadZone1.y,H2.u)             annotation (Line(points={{2.8,1},{4.6,
            1},{4.6,23},{8.4,23}}, color={0,0,255}));
    connect(DeadZone1.y,H3.u)             annotation (Line(points={{2.8,1},{2.8,
            -26},{4,-26},{4,-23},{10.4,-23}}, color={0,0,255}));
    connect(DeadZone1.y,H4.u)             annotation (Line(points={{2.8,1},{4,
            -70},{6.4,-67}}, color={0,0,255}));
    connect(H1.y,Add4.u2)             annotation (Line(points={{24.8,67},{30.4,
            67},{30.4,80.8},{32.6,80.8}}, color={0,0,255}));
    connect(H2.y,Add3.u2)             annotation (Line(points={{26.8,23},{33.4,
            23},{33.4,22.8},{44.6,22.8}}, color={0,0,255}));
    connect(H3.y,Add2.u1)             annotation (Line(points={{28.8,-23},{35.4,
            -23},{35.4,-20.8},{44.6,-20.8}}, color={0,0,255}));
    connect(HR0.y,Add4.u1)             annotation (Line(points={{22.8,89},{22.8,
            89.5},{32.6,89.5},{32.6,89.2}}, color={0,0,255}));
    connect(EV0derecho.y,Add3.u1)             annotation (Line(points={{26.8,45},
            {26.8,45.5},{44.6,45.5},{44.6,31.2}}, color={0,0,255}));
    connect(H2.y,Add6.u1)             annotation (Line(points={{26.8,23},{36,23},
            {36,9.2},{44.6,9.2}}, color={0,0,255}));
    connect(EV0izquierdo.y,Add6.u2)             annotation (Line(points={{26.8,
            1},{37.4,1},{37.4,0.8},{44.6,0.8}}, color={0,0,255}));
    connect(RS0.y,Add5.u2)             annotation (Line(points={{26.8,-90},{34,
            -90},{34,-87.2},{38.6,-87.2}}, color={0,0,255}));
    connect(H4.y,Add5.u1)             annotation (Line(points={{24.8,-67},{31.4,
            -67},{31.4,-78.8},{38.6,-78.8}}, color={0,0,255}));
    connect(Add4.y,       HR) annotation (Line(points={{48.7,85},{60.35,85},{
            60.35,78},{66,78}}, color={0,0,255}));
    connect(Add3.y,       EVderecho) annotation (Line(points={{60.7,27},{68.35,
            27},{68.35,30},{66,30}}, color={0,0,255}));
    connect(Add6.y,       EVizquierda) annotation (Line(points={{60.7,5},{68.35,
            5},{68.35,2},{65,2}}, color={0,0,255}));
    connect(Add2.y,       CV) annotation (Line(points={{60.7,-25},{68.35,-25},{
            68.35,-27},{66,-27}}, color={0,0,255}));
    connect(Add5.y,       RS) annotation (Line(points={{54.7,-83},{64.35,-83},{
            64.35,-64},{67,-64}}, color={0,0,255}));
    connect(Step1.y,Add2.u2)             annotation (Line(points={{-21,-46},{12,
            -46},{12,-29.2},{44.6,-29.2}}, color={0,0,255}));
    connect(PAO, Switch1.u1) annotation (Line(
        points={{-58,36},{-68,36},{-68,28},{-76,28},{-76,16.4},{-73.4,16.4}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}),
                        graphics),
                         Icon(graphics={
          Rectangle(
            extent={{-48,96},{56,-96}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Text(extent={{-72,52},{76,30}}, textString=
                                              "Modulo"),
          Text(extent={{-14,24},{16,2}}, textString=
                                             "de"),
          Text(extent={{-34,-12},{46,-38}}, textString=
                                                "Control")}));
   end modulocontroltest;
  annotation(uses(Modelica(version="3.2.1")),
    version="1",
    conversion(noneFromVersion=""));
end control;
