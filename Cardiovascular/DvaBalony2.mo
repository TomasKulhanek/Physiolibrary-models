within ;
package DvaBalony2
  model ElastickaKomponenta
    Real p;
    Real V;
    Real q;
    parameter Real E = 1;
  equation
    p = V * E;
    q = der(V);
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end ElastickaKomponenta;

  model Odpor
    parameter Real R = 1;
    Real q1 "inflow";
    Real q2 "outflow";
    Real p1 "incoming pressure";
    Real p2 "outgoing pressure";
  equation
    q2 = -q1;
    q2 = (p2 - p1) / R;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Odpor;

  model SpojeneBalony
    ElastickaKomponenta B1(V(start = 180), E = 0.5), B2(V(start = 50));
    Odpor O;
  equation
    O.p1 = B1.p;
    O.p2 = B2.p;
    O.q1 = -B1.q;
    O.q2 = -B2.q;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end SpojeneBalony;

  model Spojene3Balony
    ElastickaKomponenta B1(V(start = 100), E = 0.5), B2(V(start = 400)), B3(V(start = 500));
    Odpor O1, O2, O3;
  equation
    O1.p1 = B1.p;
    //  O.p2 = B2.p;
    O1.q1 = -B1.q;
    //  O.q2 = B2.q;
    O2.p1 = B2.p;
    O2.q1 = -B2.q;
    O3.p1 = B3.p;
    O3.q1 = B3.q;
    //O1,O2,O3
    O1.p2 = O2.p2;
    O2.p2 = O3.p2;
    O1.q2 + O2.q2 + O3.q2 = 0;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Spojene3Balony;

  package BalonySKonektory
    connector HydraulicConnector
      Real p;
      flow Real q;
      annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Ellipse(origin = {2.85, 1.36}, fillColor = {0, 170, 255},
                fillPattern =                                                                                                    FillPattern.Sphere, extent = {{-53.59, 49.63}, {53.59, -49.63}}, endAngle = 360)}));
    end HydraulicConnector;

    model Spojene3Balony
      ElastickaKomponenta B1(V(start = 100), E = 0.5), B2(V(start = 400)), B3(V(start = 500));
      Odpor O1, O2, O3;
    equation
      connect(O1.q_in, B1.q);
      connect(O2.q_in, B2.q);
      connect(O3.q_in, B3.q);
      connect(O1.q_out, O2.q_out);
      connect(O2.q_out, O3.q_out);
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
    end Spojene3Balony;

    model ElastickaKomponenta
      Real V;
      parameter Real E = 1;
      DvaBalony2.BalonySKonektory.HydraulicConnector q annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      q.p = V * E;
      q.q = der(V);
      annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Ellipse(origin = {-0.99, -3.71}, extent = {{-71.78, 49.5}, {71.78, -49.5}}, endAngle = 360), Line(origin = {-4.18765, 30.4069}, points = {{-38.1391, -3.67427}, {-14.6242, 4.98909}, {-14.3767, 4.74157}, {15.8213, 5.23662}, {38.0985, -4.9119}, {38.0985, -4.9119}}), Line(origin = {-3.26809, -35.4527}, points = {{-33.6131, 0.304202}, {-19.2567, -8.60669}, {16.3869, -12.072}, {40.1493, -3.65619}})}));
    end ElastickaKomponenta;

    model Odpor
      //  HydraulicConnector q_in, q_out;
      //  HydraulicConnector q_in;
      parameter Real R = 1 "resistance []";
      DvaBalony2.BalonySKonektory.HydraulicConnector q_in annotation(Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      DvaBalony2.BalonySKonektory.HydraulicConnector q_out annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      q_in.q + q_out.q = 0;
      q_in.q = (q_in.p - q_out.p) / R;
      annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {-19.3046, 0.123663}, fillColor = {255, 170, 0},
                fillPattern =                                                                                                    FillPattern.HorizontalCylinder, extent = {{-74.5, 31.81}, {114.599, -33.5427}})}));
    end Odpor;

    model SpojeneBalony
      ElastickaKomponenta B1(V(start = 180), E = 0.5), B2(V(start = 50));
      Odpor O;
    equation
      connect(B1.q, O.q_in);
      connect(O.q_out, B2.q);
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
    end SpojeneBalony;

    model SpojeneBalony2
      DvaBalony2.BalonySKonektory.ElastickaKomponenta B1(E = 0.5, V(start = 100)) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      DvaBalony2.BalonySKonektory.Odpor odpor1 annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      DvaBalony2.BalonySKonektory.ElastickaKomponenta B2(V(start = 300)) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(odpor1.q_out, B2.q) annotation(Line(points={{-10,0},{40.099,0},{
              40.099,0},{40,0}}));
      connect(odpor1.q_in, B1.q) annotation(Line(points={{-30,0},{-59.4059,0},{
              -59.4059,-0.247525},{-60,-0.247525},{-60,0}}));
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
    end SpojeneBalony2;

    model Windkessel
      DvaBalony2.BalonySKonektory.ElastickaKomponenta elastickakomponenta1 annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      DvaBalony2.BalonySKonektory.pump pump1 annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      DvaBalony2.BalonySKonektory.unlimitedVolume unlimitedvolume1 annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      DvaBalony2.BalonySKonektory.Odpor odpor1 annotation(Placement(visible = true, transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Sources.Pulse pulse1(amplitude = 10, width = 20, period = 60 / 75) annotation(Placement(visible = true, transformation(origin = {-60, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(pulse1.y, pump1.desiredflow) annotation(Line(points = {{-49, 80}, {-44.5545, 80}, {-44.5545, 49.0099}, {-44.5545, 49.0099}}, color = {0, 0, 127}));
      connect(odpor1.q_out, unlimitedvolume1.q_in) annotation(Line(points = {{40, 10}, {40, 9.65347}, {-39.1089, 9.65347}, {-39.1089, 9.65347}}));
      connect(elastickakomponenta1.q, odpor1.q_in) annotation(Line(points = {{0, 40}, {40.099, 40}, {40.099, 29.4554}, {40.099, 29.4554}}));
      connect(pump1.q_out, elastickakomponenta1.q) annotation(Line(points = {{-30, 40}, {0, 40}, {0, 39.8515}, {0, 39.8515}}));
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
    end Windkessel;

    model pump
      DvaBalony2.BalonySKonektory.HydraulicConnector q_out annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput desiredflow annotation(Placement(visible = true, transformation(origin = {-20, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-55, 95}, extent = {{-15, -15}, {15, 15}}, rotation = -90)));
    equation
      q_out.q = -desiredflow;
      annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Polygon(origin = {10.2278, 10.6197}, fillColor = {0, 85, 255},
                fillPattern =                                                                                                    FillPattern.Solid, points = {{-68.892, 52.5}, {69.4743, -11.1138}, {-68.892, -52.4505}, {-68.892, 52.5}, {-68.892, 52.5}})}));
    end pump;

    model unlimitedVolume
      DvaBalony2.BalonySKonektory.HydraulicConnector q_in annotation(Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      parameter Real pressure = 0;
    equation
      q_in.p = pressure;
      annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Polygon(origin = {-8.17, -18.69}, fillColor = {0, 85, 255},
                fillPattern =                                                                                                    FillPattern.Solid, points = {{-60.8911, 69.6786}, {-59.901, -57.3016}, {-56.6832, -65.47}, {-51.2376, -69.9254}, {51.2376, -69.9254}, {57.9208, -66.2125}, {60.8911, -58.7868}, {60.6436, 69.9261}, {53.9604, 69.6786}, {54.703, -58.2917}, {48.2673, -61.5096}, {-45.5446, -61.5096}, {-52.9703, -56.064}, {-52.7228, 69.6786}, {-60.8911, 69.6786}, {-53.7129, 69.431}, {-60.8911, 69.6786}})}));
    end unlimitedVolume;

    model SpojeneBalony3
      ElastickaKomponenta B1(V(start = 180), E = 0.5), B2(V(start = 50));
      Odpor O;
    equation
    /*  B1.q.q = - O.q_in.q;
  B1.q.p = O.q_in.p;
  O.q_out.q = - B2.q.q;
  O.q_out.p = B2.q.p;*/
    //  connect(B1.q, O.q_in);
    //  connect(O.q_out, B2.q);
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
    end SpojeneBalony3;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end BalonySKonektory;

  model DvaBalonyFlat
    //Modelica.SIUnit.Pressure p1,p2;
    Real p1, p2;
    //Modelica.SIUnit.Volume V1,V2;
    Real V1(start = 200), V2(start = 50);
    //Modelica.SIUnit.VolumeFlowRate q1,q2;
    Real q1, q2;
    parameter Real E1 = 0.5;
    parameter Real E2 = 1 "[]";
    parameter Real R = 1 "[(mmHg.s)/ml]";
  equation
    //p=V*E;
    p1 = V1 * E1;
    q1 = der(V1);
    p2 = V2 * E2;
    q2 = der(V2);
    q1 = -q2;
    q1 = (p2 - p1) / R;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end DvaBalonyFlat;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    uses(Modelica(version="3.2.1")));
end DvaBalony2;
