within Metabolism;

package GlucoseInsulin
  package Components
    model Compartment
      parameter Modelica.SIunits.Mass initialSubstanceAmmount(displayUnit = "mg");
      GlucoseInsulin.Interfaces.VolumeInput volume(displayUnit = "ml") annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-59, -19}, extent = {{-41, -41}, {41, 41}}, rotation = 0)));
      Modelica.SIunits.Mass substanceAmmount(displayUnit = "mg", start = initialSubstanceAmmount);
      Modelica.SIunits.MassConcentration substanceConcentration(displayUnit = "mg/ml");
      GlucoseInsulin.Interfaces.MassFlow qin annotation(
        Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {1, 101}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
    equation
      der(substanceAmmount) = qin.q;
      substanceConcentration = substanceAmmount / volume;
      qin.c = substanceConcentration;
      annotation(
        Icon(graphics = {Text(origin = {1, -121}, extent = {{-281, 19}, {277, -19}}, textString = "%name"), Polygon(origin = {-1, 0}, fillColor = {238, 238, 236}, fillPattern = FillPattern.Solid, points = {{-97, 88}, {-97, 72}, {-95, -88}, {93, -88}, {97, 74}, {95, 88}, {-97, 88}, {-97, 88}}, smooth = Smooth.Bezier), Polygon(origin = {-9, -24}, fillColor = {173, 127, 168}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-85, 64}, {-91, 46}, {-73, -56}, {83, -56}, {101, 42}, {101, 56}, {69, 56}, {-85, 64}}, smooth = Smooth.Bezier)}, coordinateSystem(initialScale = 0.1)));
    end Compartment;

    model CompartmentIU
      extends Compartment(final initialSubstanceAmmount = 0.0347 * 1e-9 * initialSubstanceAmmountmU);
      //Insulin: 1 IU is equivalent to 0.0347 mg of human insulin, 1 mU = 0.0347 * 1e-9 kg
      parameter Real initialSubstanceAmmountmU(displayUnit = "mU");
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false), graphics = {Text(extent = {{-260, -142}, {284, -178}}, lineColor = {0, 0, 0}, textString = "initial %initialSubstanceAmmountmU mU")}),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end CompartmentIU;

    model CompartmentMass
      extends Compartment annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
      annotation(
        Icon(graphics = {Text(extent = {{-262, -134}, {314, -174}}, lineColor = {0, 0, 0}, textString = "initial %initialSubstanceAmmount")}));
    end CompartmentMass;

    partial model ProductionFlowRate
      GlucoseInsulin.Interfaces.MassFlow outflow annotation(
        Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {101, -1}, extent = {{-27, -27}, {27, 27}}, rotation = 0)));
      annotation(
        Icon(graphics = {Polygon(origin = {-20, 10}, fillColor = {173, 127, 168}, fillPattern = FillPattern.Solid, points = {{-80, 30}, {-80, -50}, {102, -10}, {-80, 30}}), Text(origin = {0, -46}, extent = {{-280, 18}, {278, -18}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
    end ProductionFlowRate;

    model ProductionFlowRateParam
      extends ProductionFlowRate;
      parameter Modelica.SIunits.MassFlowRate desiredFlowRate(displayUnit = "mg/h");
    equation
      outflow.q = -desiredFlowRate;
      annotation(
        Icon(graphics = {Text(extent = {{-320, -64}, {282, -102}}, lineColor = {0, 0, 0}, textString = "%desiredFlowRate")}));
    end ProductionFlowRateParam;

    model VolumeConst
      Interfaces.VolumeOutput volume annotation(
        Placement(visible = true, transformation(origin = {102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {101, 1}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
      parameter Modelica.SIunits.Volume desiredVolume(displayUnit = "ml");
    equation
      volume = desiredVolume;
      annotation(
        Icon(graphics = {Polygon(origin = {9, -3}, fillColor = {114, 159, 207}, fillPattern = FillPattern.Solid, points = {{-83, 63}, {-85, 63}, {-81, -53}, {-73, -61}, {-51, -61}, {69, -61}, {79, -61}, {83, -51}, {83, -41}, {85, 61}, {85, 61}, {-83, 63}}, smooth = Smooth.Bezier), Text(origin = {0, -80}, extent = {{-140, 20}, {140, -20}}, textString = "%name"), Text(extent = {{-242, -100}, {260, -142}}, lineColor = {0, 0, 0}, textString = "%desiredVolume")}, coordinateSystem(initialScale = 0.1)));
    end VolumeConst;

    model ProductionFlowRateInput
      extends ProductionFlowRate;
      Interfaces.MassFlowRateInput desiredFlowRate annotation(
        Placement(transformation(extent = {{-100, 60}, {-60, 100}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-80, 80})));
    equation
      outflow.q = -desiredFlowRate;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end ProductionFlowRateInput;

    model ProductionFlowRateGain
      extends ProductionFlowRate;
      Interfaces.MassConcentrationInput x annotation(
        Placement(transformation(extent = {{-38, 58}, {2, 98}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-20, 60})));
      final parameter Types.MassVolumePerMassHour beta = Types.from_mIU(beta_mu) * beta_perhour "beta cells coeficient production rate (ml.mU)/(mg.h)";
      parameter Types.VolumePerMassHour beta_perhour(displayUnit = "ml/(mg.h)") "coeff to compute beta in SI set to 1 in ml/(mg.h)";
      parameter Real beta_mu(displayUnit = "mIU") "beta cells coeff (ml.mU)/(mg.h)";
      parameter Modelica.SIunits.MassConcentration phi(displayUnit = "mg/ml") "threshold for glucose concentration";
    equation
      outflow.q = if x > phi then -(x - phi) * beta else 0;
      annotation(
        Icon(graphics = {Text(extent = {{-258, -60}, {242, -102}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 170}, fillPattern = FillPattern.None, textString = "beta=%beta_mu"), Text(extent = {{-260, -102}, {242, -140}}, lineColor = {0, 0, 0}, fillColor = {255, 213, 170}, fillPattern = FillPattern.None, textString = "phi=%phi")}));
    end ProductionFlowRateGain;

    partial model DegradationRate
      GlucoseInsulin.Interfaces.MassFlow inflow annotation(
        Placement(visible = true, transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0), iconTransformation(origin = {-99, -1}, extent = {{-29, -29}, {29, 29}}, rotation = 0)));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Polygon(origin = {-10, 10}, fillColor = {173, 127, 168}, fillPattern = FillPattern.Solid, points = {{-70, 36}, {-70, -50}, {110, -10}, {-70, 36}}), Text(fillColor = {255, 213, 170}, extent = {{-338, -42}, {360, -78}}, textString = "%name")}),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end DegradationRate;

    model DegradationRateParam
      extends DegradationRate;
      parameter Modelica.SIunits.VolumeFlowRate desiredFlowRate(displayUnit = "ml/h");
      //  parameter Modelica.SIunits.MassConcentration threshold(displayUnit="mg/ml");
      parameter String paramName;
    equation
//inflow.q = if (inflow.c>threshold) then desiredFlowRate * (inflow.c-threshold) else 0;
      inflow.q = desiredFlowRate * inflow.c;
      annotation(
        Icon(graphics = {Text(origin = {-40, 0}, fillColor = {255, 213, 170}, extent = {{-300, -82}, {378, -116}}, textString = "%paramName=%desiredFlowRate")}, coordinateSystem(initialScale = 0.1)));
    end DegradationRateParam;

    model ConcentrationSensor
      extends Modelica.Icons.RotationalSensor;
      GlucoseInsulin.Interfaces.MassFlow p annotation(
        Placement(visible = true, transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 0}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
      Interfaces.MassConcentrationOutput conc annotation(
        Placement(transformation(extent = {{-4, 82}, {16, 102}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, 110})));
    equation
      conc = p.c;
      p.q = 0;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false), graphics = {Text(extent = {{-302, -22}, {300, -62}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.None, textString = "%name
        ")}),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end ConcentrationSensor;

    model DegradationRateParamThreshold
      extends DegradationRate;
      parameter Modelica.SIunits.VolumeFlowRate desiredFlowRate(displayUnit = "ml/h");
      parameter Modelica.SIunits.MassConcentration threshold(displayUnit = "mg/ml");
      parameter String paramName;
      parameter String thresholdName;
    equation
      inflow.q = if inflow.c > threshold then desiredFlowRate * (inflow.c - threshold) else 0;
      annotation(
        Icon(graphics = {Text(fillColor = {255, 213, 170}, extent = {{-244, -80}, {240, -120}}, textString = "%paramName=%desiredFlowRate"), Text(fillColor = {0, 0, 255}, extent = {{-364, -122}, {326, -160}}, textString = "%thresholdName=%threshold")}, coordinateSystem(initialScale = 0.1)));
    end DegradationRateParamThreshold;

    model DegradationRateParamConc
      extends DegradationRate;
      GlucoseInsulin.Interfaces.MassConcentrationInput conc annotation(
        Placement(visible = true, transformation(extent = {{-100, -82}, {-60, -42}}, rotation = 0), iconTransformation(origin = {2, 46}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
      parameter Types.VolumeVolumePerMassHour Nu = Nu_ml2perhour / Types.from_mIU(1 / Nu_permu);
      //139000e-12/3600/0.0347e-9
      parameter Types.VolumeVolumePerHour Nu_ml2perhour(displayUnit = "(ml.ml)/h");
      parameter Real Nu_permu(displayUnit = "1/mIU");
    equation
      inflow.q = inflow.c * conc * Nu;
      annotation(
        Icon(graphics = {Text(origin = {32, 0}, fillColor = {0, 0, 255}, extent = {{-322, -80}, {296, -120}}, textString = "Nu=%Nu_permu (ml.ml)/(mIU.h)", fontName = "Source Code Pro")}, coordinateSystem(initialScale = 0.1)));
    end DegradationRateParamConc;
  end Components;

  package Models
    model GIRegulationComponent
      GlucoseInsulin.Components.CompartmentMass glucose(initialSubstanceAmmount = 0.012165) annotation(
        Placement(transformation(extent = {{-36, -8}, {-16, 12}})));
      GlucoseInsulin.Components.CompartmentIU insulin(initialSubstanceAmmountmU = 851) annotation(
        Placement(transformation(extent = {{-18, -60}, {2, -40}})));
      GlucoseInsulin.Components.ProductionFlowRateParam glucoseProduction(desiredFlowRate(displayUnit = "mg/h") = 2.3333333333333e-6) annotation(
        Placement(transformation(extent = {{-52, 52}, {-32, 72}})));
      GlucoseInsulin.Components.VolumeConst ECFVolume(desiredVolume = 0.015) annotation(
        Placement(transformation(extent = {{-70, -32}, {-50, -12}})));
      GlucoseInsulin.Components.ProductionFlowRateInput glucoseIngestion annotation(
        Placement(transformation(extent = {{-52, 68}, {-32, 88}})));
      GlucoseInsulin.Interfaces.MassFlowRateInput glucoseInput annotation(
        Placement(transformation(extent = {{-98, 54}, {-58, 94}})));
      GlucoseInsulin.Components.ProductionFlowRateGain insulinProduction(phi = 0.51, beta_mu = 1430, beta_perhour(displayUnit = "ml/(mg.h)") = 0.00027777777777778) annotation(
        Placement(transformation(extent = {{-36, -34}, {-16, -14}})));
      GlucoseInsulin.Components.DegradationRateParam insulinDegradation(paramName = "Alpha", desiredFlowRate = 2.1111111111111e-6) annotation(
        Placement(transformation(extent = {{36, -34}, {56, -14}})));
      GlucoseInsulin.Components.ConcentrationSensor glucoseSensor annotation(
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-26, 32})));
      GlucoseInsulin.Components.ConcentrationSensor insulinSensor annotation(
        Placement(transformation(extent = {{4, -34}, {24, -14}})));
      GlucoseInsulin.Components.DegradationRateParam tissueUtilization(paramName = "Lambda", desiredFlowRate = 6.8611111111111e-7) annotation(
        Placement(transformation(extent = {{32, 52}, {52, 72}})));
      GlucoseInsulin.Components.DegradationRateParamThreshold renalLoss(threshold = 2.5, paramName = "Mu", thresholdName = "Theta", desiredFlowRate = 2e-6) annotation(
        Placement(transformation(extent = {{30, 74}, {50, 94}})));
      Components.DegradationRateParamConc tissueUtilizationInsulinDependent(Nu_permu = 139000, Nu_ml2perhour(displayUnit = "(ml.ml)/h") = 2.7777777777778e-16) annotation(
        Placement(transformation(extent = {{36, 34}, {56, 54}})));
      GlucoseInsulin.Interfaces.MassConcentrationOutput glucoseConc annotation(
        Placement(visible = true, transformation(extent = {{-4, 6}, {16, 26}}, rotation = 0), iconTransformation(extent = {{80, 44}, {100, 64}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput insulinConc(displayUnit = "mU/ml") annotation(
        Placement(visible = true, transformation(extent = {{46, -4}, {66, 16}}, rotation = 0), iconTransformation(extent = {{80, -40}, {100, -20}}, rotation = 0)));
      Modelica.Blocks.Math.Gain to_mU(k = 1e+3 / 0.0347) annotation(
        Placement(visible = true, transformation(origin = {32, 6}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    equation
      connect(ECFVolume.volume, glucose.volume) annotation(
        Line(points = {{-49.9, -21.9}, {-46, -21.9}, {-46, 0.1}, {-31.9, 0.1}}, color = {0, 0, 127}));
      connect(insulin.volume, glucose.volume) annotation(
        Line(points = {{-13.9, -51.9}, {-46, -51.9}, {-46, 0.1}, {-31.9, 0.1}}, color = {0, 0, 127}));
      connect(glucoseIngestion.desiredFlowRate, glucoseInput) annotation(
        Line(points = {{-50, 86}, {-59, 86}, {-59, 74}, {-78, 74}}, color = {0, 0, 127}));
      connect(insulinProduction.outflow, insulin.qin) annotation(
        Line(points = {{-15.9, -24.1}, {-7.9, -24.1}, {-7.9, -39.9}}, color = {173, 127, 168}, thickness = 1));
      connect(glucoseSensor.conc, insulinProduction.x) annotation(
        Line(points = {{-15, 32}, {-6, 32}, {-6, -18}, {-28, -18}}, color = {0, 0, 127}));
      connect(glucose.qin, glucoseSensor.p) annotation(
        Line(points = {{-25.9, 12.1}, {-25.9, 21.8}, {-26, 21.8}, {-26, 31.8}}, color = {173, 127, 168}, thickness = 1));
      connect(glucoseProduction.outflow, glucose.qin) annotation(
        Line(points = {{-31.9, 61.9}, {-25.9, 61.9}, {-25.9, 12.1}}, color = {173, 127, 168}, thickness = 1));
      connect(glucoseIngestion.outflow, glucose.qin) annotation(
        Line(points = {{-31.9, 77.9}, {-25.9, 77.9}, {-25.9, 12.1}}, color = {173, 127, 168}, thickness = 1));
      connect(renalLoss.inflow, glucose.qin) annotation(
        Line(points = {{30.1, 83.9}, {-25.9, 83.9}, {-25.9, 12.1}}, color = {173, 127, 168}, thickness = 1));
      connect(tissueUtilization.inflow, glucose.qin) annotation(
        Line(points = {{32.1, 61.9}, {-25.9, 61.9}, {-25.9, 12.1}}, color = {173, 127, 168}, thickness = 1));
      connect(tissueUtilizationInsulinDependent.inflow, glucose.qin) annotation(
        Line(points = {{36.1, 43.9}, {36.1, 42}, {-25.9, 42}, {-25.9, 12.1}}, color = {173, 127, 168}, thickness = 1));
      connect(insulinDegradation.inflow, insulinProduction.outflow) annotation(
        Line(points = {{36.1, -24.1}, {24, -24.1}, {24, -24}, {10.1, -24}, {10.1, -24.1}, {-15.9, -24.1}}, color = {173, 127, 168}, thickness = 1));
      connect(insulinSensor.p, insulinProduction.outflow) annotation(
        Line(points = {{14.2, -24}, {0, -24}, {0, -24.1}, {-15.9, -24.1}}, color = {173, 127, 168}, thickness = 1));
      connect(insulinDegradation.inflow, insulinSensor.p) annotation(
        Line(points = {{36.1, -24.1}, {26.2, -24.1}, {26.2, -24}, {14.2, -24}}, color = {173, 127, 168}, thickness = 1));
      connect(glucoseSensor.conc, glucoseConc) annotation(
        Line(points = {{-15, 32}, {-4, 32}, {-4, 16}, {6, 16}}, color = {0, 0, 127}));
      connect(glucoseConc, glucoseConc) annotation(
        Line(points = {{6, 16}, {6, 16}}, color = {0, 0, 127}));
      connect(to_mU.u, insulinSensor.conc) annotation(
        Line(points = {{17.6, 6}, {14, 6}, {14, -13}}, color = {0, 0, 127}));
      connect(to_mU.y, insulinConc) annotation(
        Line(points = {{45.2, 6}, {56, 6}}, color = {0, 0, 127}));
      connect(tissueUtilizationInsulinDependent.conc, insulinSensor.conc) annotation(
        Line(points = {{46.2, 48.6}, {14, 48.6}, {14, -14}, {14, -13}, {14, -13}}, color = {0, 0, 127}));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(lineColor = {28, 108, 200}, fillColor = {255, 213, 170}, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}}), Text(fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-280, -78}, {276, -120}}, textString = "%name")}),
        Diagram(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1)));
    end GIRegulationComponent;

    model GIRegulationEquation
      input Real glucosein "optional inflow of glucose mg/s";
      parameter Real Vecf = 15000 "extrac.fluid volume ml";
      parameter Real lambda = 2470 / 3600 "ins.ind. ml/s";
      parameter Real v = 139000 / 3600 "ins.d. ml.ml/(mu.s)";
      parameter Real theta = 2.5 "renal loss threshold mg/ml";
      parameter Real phi = 0.51 "glucose threshold mg/ml";
      parameter Real mu = 7200 / 3600 "renal loss ml/s";
      parameter Real beta = 1430 / 3600 "i.prod ml.mu/(mg.s)";
      parameter Real qgluc = 8400 / 3600 "g. prod mg/s";
      parameter Real alpha = 7600 / 3600 "i. destr. ml/s";
      Real x(start = 0.81), y(start = 0.056) "concentration of glucose/insulin";
      Real mg, mi "ammount of glucose mg and insulin mU";
      Real qrenal, qins, qtid, qtii, qid "flowrates";
    equation
      qrenal = if x < theta then 0 else mu * (x - theta);
//(1)
      qins = if x < phi then 0 else beta * (x - phi);
//(4)
      qtid = v * x * y;
//(3)
      qtii = lambda * x;
//(2)
      qid = alpha * y;
//(5)
      der(mg) = glucosein + qgluc - qtii - qtid - qrenal;
//(6)
      der(mi) = qins - qid;
//(7)
      x = mg / Vecf;
//(8)
      y = mi / Vecf;
//(9)
    end GIRegulationEquation;

    model GIRegulationBlock
      Modelica.Blocks.Interfaces.RealInput in1 annotation(
        Placement(visible = true, transformation(origin = {-100, 44}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 44}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput out1 annotation(
        Placement(visible = true, transformation(origin = {102, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput out2 annotation(
        Placement(visible = true, transformation(origin = {104, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add sum4 annotation(
        Placement(visible = true, transformation(origin = {-56, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant glucoseInputFlowRate(k = 8400 / 3600) annotation(
        Placement(visible = true, transformation(origin = {-86, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add sum00(k1 = -1, k2 = -1) annotation(
        Placement(visible = true, transformation(origin = {-24, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add sum01(k2 = -1) annotation(
        Placement(visible = true, transformation(origin = {-24, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain glucoseCapacitance(k = 1 / 15000) annotation(
        Placement(visible = true, transformation(origin = {26, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add sum annotation(
        Placement(visible = true, transformation(origin = {2, 26}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Blocks.Continuous.Integrator integrator(y_start = 0.81) annotation(
        Placement(visible = true, transformation(origin = {54, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Product product annotation(
        Placement(visible = true, transformation(origin = {-72, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain nu(k = 139000 / 3600) annotation(
        Placement(visible = true, transformation(origin = {-42, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add sum2(k2 = -1) annotation(
        Placement(visible = true, transformation(origin = {54, -18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain beta(k = 1430 / 3600) annotation(
        Placement(visible = true, transformation(origin = {26, -18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Nonlinear.Limiter thresholdingOperator1(limitsAtInit = true, uMax = 100000, uMin = 0) annotation(
        Placement(visible = true, transformation(origin = {-6, -18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add sum3(k2 = -1) annotation(
        Placement(visible = true, transformation(origin = {-12, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain insulinCapacitance(k = 1 / 15000) annotation(
        Placement(visible = true, transformation(origin = {28, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.Integrator integrator1(y_start = 0.056) annotation(
        Placement(visible = true, transformation(origin = {58, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain Alpha(k = 7600 / 3600) annotation(
        Placement(visible = true, transformation(origin = {30, -78}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain lambda(k = 2470 / 3600) annotation(
        Placement(visible = true, transformation(origin = {28, 58}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant reabsorptionMaximum(k = 2.5) annotation(
        Placement(visible = true, transformation(origin = {84, 82}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add sum1(k1 = -1) annotation(
        Placement(visible = true, transformation(origin = {54, 76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain mu(k = 7200 / 3600) annotation(
        Placement(visible = true, transformation(origin = {2, 82}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Nonlinear.Limiter thresholdingOperator(limitsAtInit = true, uMax = 100000, uMin = 0) annotation(
        Placement(visible = true, transformation(origin = {-54, 76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant ThresholdGlucoseConcPhi(k = 0.51) annotation(
        Placement(visible = true, transformation(origin = {88, -24}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    equation
      connect(sum01.y, sum.u2) annotation(
        Line(points = {{-13, 22}, {-9, 22}, {-9, 21.2}, {-7.6, 21.2}}, color = {0, 0, 127}));
      connect(sum00.y, sum.u1) annotation(
        Line(points = {{-13, 48}, {-13, 30.8}, {-7.6, 30.8}}, color = {0, 0, 127}));
      connect(sum.y, glucoseCapacitance.u) annotation(
        Line(points = {{10.8, 26}, {14, 26}}, color = {0, 0, 127}));
      connect(integrator1.y, out2) annotation(
        Line(points = {{69, -48}, {104, -48}}, color = {0, 0, 127}));
      connect(ThresholdGlucoseConcPhi.y, sum2.u2) annotation(
        Line(points = {{77, -24}, {66, -24}}, color = {0, 0, 127}));
      connect(reabsorptionMaximum.y, sum1.u1) annotation(
        Line(points = {{73, 82}, {66, 82}}, color = {0, 0, 127}));
      connect(lambda.y, sum00.u1) annotation(
        Line(points = {{17, 58}, {-12, 58}, {-12, 64}, {-38, 64}, {-38, 54}, {-36, 54}}, color = {0, 0, 127}));
      connect(integrator.y, lambda.u) annotation(
        Line(points = {{65, 26}, {72, 26}, {72, 58}, {40, 58}}, color = {0, 0, 127}));
      connect(sum1.y, mu.u) annotation(
        Line(points = {{43, 76}, {28.5, 76}, {28.5, 82}, {14, 82}}, color = {0, 0, 127}));
      connect(mu.y, thresholdingOperator.u) annotation(
        Line(points = {{-9, 82}, {-25.5, 82}, {-25.5, 76}, {-42, 76}}, color = {0, 0, 127}));
      connect(sum1.u2, integrator.y) annotation(
        Line(points = {{66, 70}, {72, 70}, {72, 26}, {65, 26}}, color = {0, 0, 127}));
      connect(glucoseInputFlowRate.y, sum4.u2) annotation(
        Line(points = {{-75, 18}, {-70.5, 18}, {-70.5, 20}, {-68, 20}}, color = {0, 0, 127}));
      connect(in1, sum4.u1) annotation(
        Line(points = {{-100, 44}, {-70, 44}, {-70, 32}, {-68, 32}}, color = {0, 0, 127}));
      connect(sum4.y, sum01.u1) annotation(
        Line(points = {{-45, 26}, {-40, 26}, {-40, 28}, {-36, 28}}, color = {0, 0, 127}));
      connect(thresholdingOperator.y, sum00.u2) annotation(
        Line(points = {{-65, 76}, {-68, 76}, {-68, 42}, {-36, 42}}, color = {0, 0, 127}));
      connect(glucoseCapacitance.y, integrator.u) annotation(
        Line(points = {{37, 26}, {42, 26}}, color = {0, 0, 127}));
      connect(integrator.y, out1) annotation(
        Line(points = {{65, 26}, {72, 26}, {72, 60}, {102, 60}}, color = {0, 0, 127}));
      connect(integrator.y, product.u1) annotation(
        Line(points = {{65, 26}, {72, 26}, {72, 0}, {-88, 0}, {-88, -8}, {-84, -8}}, color = {0, 0, 127}));
      connect(integrator.y, sum2.u1) annotation(
        Line(points = {{65, 26}, {72, 26}, {72, -12}, {66, -12}}, color = {0, 0, 127}));
      connect(nu.y, sum01.u2) annotation(
        Line(points = {{-31, -14}, {-31, 6}, {-36, 6}, {-36, 16}}, color = {0, 0, 127}));
      connect(integrator1.y, product.u2) annotation(
        Line(points = {{69, -48}, {78, -48}, {78, -94}, {-92, -94}, {-92, -20}, {-84, -20}, {-84, -20}}, color = {0, 0, 127}));
      connect(Alpha.y, sum3.u2) annotation(
        Line(points = {{19, -78}, {-30, -78}, {-30, -54}, {-24, -54}, {-24, -54}}, color = {0, 0, 127}));
      connect(integrator1.y, Alpha.u) annotation(
        Line(points = {{69, -48}, {78, -48}, {78, -78}, {42, -78}, {42, -78}}, color = {0, 0, 127}));
      connect(insulinCapacitance.y, integrator1.u) annotation(
        Line(points = {{39, -48}, {44, -48}, {44, -48}, {46, -48}}, color = {0, 0, 127}));
      connect(thresholdingOperator1.y, sum3.u1) annotation(
        Line(points = {{-17, -18}, {-28, -18}, {-28, -42}, {-24, -42}, {-24, -42}}, color = {0, 0, 127}));
      connect(sum2.y, beta.u) annotation(
        Line(points = {{43, -18}, {38, -18}, {38, -18}, {38, -18}}, color = {0, 0, 127}));
      connect(sum3.y, insulinCapacitance.u) annotation(
        Line(points = {{-1, -48}, {14, -48}, {14, -48}, {16, -48}}, color = {0, 0, 127}));
      connect(beta.y, thresholdingOperator1.u) annotation(
        Line(points = {{15, -18}, {6, -18}, {6, -18}, {6, -18}}, color = {0, 0, 127}));
      connect(product.y, nu.u) annotation(
        Line(points = {{-61, -14}, {-56, -14}, {-56, -14}, {-54, -14}}, color = {0, 0, 127}));
      annotation(
        Icon(graphics = {Rectangle(origin = {-4, 6}, fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, extent = {{-96, 74}, {96, -74}}), Text(origin = {11, -84}, extent = {{-131, 16}, {131, -16}}, textString = "%name")}));
    end GIRegulationBlock;
  end Models;

  package Interfaces
    connector MassConcentrationInput = input Modelica.SIunits.MassConcentration "input MassConcentration as connector" annotation(
      defaultComponentName = "concentration",
      Icon(graphics = {Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
    connector MassFlowRateInput = input Modelica.SIunits.MassFlowRate "input MassFlowRate as connector" annotation(
      defaultComponentName = "massflowrate",
      Icon(graphics = {Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
    <p>
    Connector with one input signal of type MassFlowRate.
    </p>
    </html>"));
    connector VolumeInput = input Modelica.SIunits.Volume "input Volume as connector" annotation(
      defaultComponentName = "volume",
      Icon(graphics = {Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)),
      Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
    <p>
    Connector with one input signal of type Volume.
    </p>
    </html>"));
    connector MassConcentrationOutput = output Modelica.SIunits.MassConcentration annotation(
      defaultComponentName = "conc",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
    <p>
    Connector with one output signal of type Real.
    </p>
    </html>"));

    connector MassFlow
      flow Modelica.SIunits.MassFlowRate q;
      Modelica.SIunits.MassConcentration c;
      annotation(
        Icon(graphics = {Polygon(lineColor = {173, 127, 168}, fillColor = {173, 127, 168}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{0, 100}, {-100, 0}, {0, -100}, {100, 0}, {0, 100}})}));
    end MassFlow;

    connector VolumeOutput = output Modelica.SIunits.Volume annotation(
      defaultComponentName = "v",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Polygon(points = {{-100, 50}, {0, 0}, {-100, -50}, {-100, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{30, 110}, {30, 60}}, lineColor = {0, 0, 127}, textString = "%name")}),
      Documentation(info = "<html>
    <p>
    Connector with one output signal of type Real.
    </p>
    </html>"));
  end Interfaces;

  package Types
    type VolumeVolumePerHour = Real(final quantity = "VolumeVolumePerHour", final unit = "(m3.m3)/s");
    type VolumeVolumePerMassHour = Real(final quantity = "VolumeVolumePerMassHour", final unit = "(m3.m3)/(kg.s)");
    type VolumePerMassHour = Real(final quantity = "VolumePerMassHour", final unit = "m3/(kg.s)");
    type mInsulinUnit = Real(final quantity = "mInsulinUnit", final unit = "mIU") "mini International Unit for insulin (mIU)";

    function from_mIU
      extends Modelica.SIunits.Icons.Conversion;
      input Types.mInsulinUnit miu "mIU value";
      output Modelica.SIunits.Mass m "kg value";
    algorithm
      m := miu * 0.0347 * 1e-9;
    end from_mIU;

    function to_mIU
      extends Modelica.SIunits.Icons.Conversion;
      output Types.mInsulinUnit miu "mIU value";
      input Modelica.SIunits.Mass m "kg value";
    algorithm
      miu := m / (0.0347 * 1e-9);
    end to_mIU;

    type MassVolumePerMassHour = Real(final quantity = "MassVolumePerMassHour", final unit = "(m3.kg)/(kg.s)");
  end Types;

  package Test
    model CompareHealthDiabetes
      Modelica.Blocks.Sources.Pulse glucoseInfusion(nperiod = 1, period = 60 * 60, width = 20, startTime = 2 * 24 * 60 * 60, amplitude = 1 / 3600) annotation(
        Placement(visible = true, transformation(origin = {-86, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Models.GIRegulationComponent healthy annotation(
        Placement(transformation(extent = {{-52, 54}, {-32, 74}})));
      Models.GIRegulationComponent type1diabetes(insulinProduction(beta_mu = 143)) annotation(
        Placement(transformation(extent = {{-52, -16}, {-32, 4}})));
      Models.GIRegulationComponent type2diabetes(tissueUtilizationInsulinDependent(Nu_permu = 13900)) annotation(
        Placement(transformation(extent = {{-50, -78}, {-30, -58}})));
      Models.GIRegulationBlock giblock annotation(
        Placement(visible = true, transformation(origin = {16, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(glucoseInfusion.y, healthy.glucoseInput) annotation(
        Line(points = {{-75, -2}, {-64, -2}, {-64, 71.4}, {-49.8, 71.4}}, color = {0, 0, 127}));
      connect(glucoseInfusion.y, type1diabetes.glucoseInput) annotation(
        Line(points = {{-75, -2}, {-64, -2}, {-64, 1.4}, {-49.8, 1.4}}, color = {0, 0, 127}));
      connect(glucoseInfusion.y, type2diabetes.glucoseInput) annotation(
        Line(points = {{-75, -2}, {-64, -2}, {-64, -60.6}, {-47.8, -60.6}}, color = {0, 0, 127}));
      connect(giblock.in1, glucoseInfusion.y) annotation(
        Line(points = {{6, 90.4}, {-74, 90.4}, {-74, -2}, {-75, -2}}, color = {0, 0, 127}));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)),
        experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-6, Interval = 172.8));
    end CompareHealthDiabetes;

    model GIExperimentCompare
      Modelica.Blocks.Sources.Pulse glucoseInfusion(amplitude = 1e5 / 3600, nperiod = 1, period = 60 * 60, startTime = 3000 * 60, width = 20) annotation(
        Placement(visible = true, transformation(origin = {-76, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Models.GIRegulationBlock healthy annotation(
        Placement(visible = true, transformation(origin = {-30, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Models.GIRegulationBlock type2diabetes(nu(k = 0.2 * 139000 / 3600)) annotation(
        Placement(visible = true, transformation(origin = {-30, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Models.GIRegulationBlock type1diabetes(beta(k = 0.15 * 1430 / 3600)) annotation(
        Placement(visible = true, transformation(origin = {-30, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(glucoseInfusion.y, type1diabetes.in1) annotation(
        Line(points = {{-65, 8}, {-60, 8}, {-60, -32}, {-40, -32}, {-40, -31.6}}, color = {0, 0, 127}));
      connect(glucoseInfusion.y, type2diabetes.in1) annotation(
        Line(points = {{-65, 8}, {-60, 8}, {-60, 48}, {-40, 48}, {-40, 48.4}}, color = {0, 0, 127}));
      connect(glucoseInfusion.y, healthy.in1) annotation(
        Line(points = {{-65, 8}, {-42, 8}, {-42, 8.4}, {-40, 8.4}}, color = {0, 0, 127}));
      annotation(
        experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-6, Interval = 172.8));
    end GIExperimentCompare;

    model GiRegulationSchema
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false), graphics = {Rectangle(extent = {{-22, 24}, {24, -4}}, lineColor = {0, 0, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-36, 78}, {24, 28}}, lineColor = {0, 0, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-60, 66}, {-36, 58}}, lineColor = {0, 0, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-38, 64}, {-32, 60}}, lineColor = {213, 170, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-60, 64}, {-54, 60}}, lineColor = {213, 170, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-12, 4}, {12, -4}}, lineColor = {0, 0, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, origin = {36, 64}, rotation = 180), Rectangle(extent = {{-3, 2}, {3, -2}}, lineColor = {213, 170, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, origin = {45, 64}, rotation = 180), Rectangle(extent = {{-3, 2}, {3, -2}}, lineColor = {213, 170, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, origin = {27, 64}, rotation = 180), Rectangle(extent = {{-12, 4}, {12, -4}}, lineColor = {0, 0, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, origin = {36, 50}, rotation = 180), Rectangle(extent = {{-3, 2}, {3, -2}}, lineColor = {213, 170, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, origin = {45, 50}, rotation = 180), Rectangle(extent = {{-3, 2}, {3, -2}}, lineColor = {213, 170, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, origin = {27, 50}, rotation = 180), Rectangle(extent = {{-12, 4}, {12, -4}}, lineColor = {0, 0, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, origin = {36, 38}, rotation = 180), Rectangle(extent = {{-3, 2}, {3, -2}}, lineColor = {213, 170, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, origin = {45, 38}, rotation = 180), Rectangle(extent = {{-3, 2}, {3, -2}}, lineColor = {213, 170, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, origin = {27, 38}, rotation = 180), Line(points = {{-64, 62}, {-54, 62}}, color = {0, 0, 0}, arrow = {Arrow.None, Arrow.Filled}, thickness = 0.5), Text(extent = {{-84, 70}, {-62, 56}}, lineColor = {0, 0, 0}, lineThickness = 1, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, textString = "Glucose Input
    Flow Rate"), Text(extent = {{-16, 66}, {10, 50}}, lineColor = {0, 0, 0}, lineThickness = 1, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, textString = "Plasma Glucose
    Concentration"), Text(extent = {{52, 72}, {80, 58}}, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, textString = "Renal Loss Rate"), Text(extent = {{50, 56}, {88, 46}}, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, textString = "Tissue Utilization Rate
    (insulin independent)"), Text(extent = {{50, 42}, {88, 32}}, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, textString = "Tissue Utilization Rate
    (insulin dependent)"), Line(points = {{40, 64}, {50, 64}}, color = {0, 0, 0}, arrow = {Arrow.None, Arrow.Filled}, thickness = 0.5), Line(points = {{40, 50}, {50, 50}}, color = {0, 0, 0}, arrow = {Arrow.None, Arrow.Filled}, thickness = 0.5), Line(points = {{40, 38}, {50, 38}}, color = {0, 0, 0}, arrow = {Arrow.None, Arrow.Filled}, thickness = 0.5), Rectangle(extent = {{-88, 18}, {-50, 0}}, lineColor = {28, 108, 200}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-84, 14}, {-54, 6}}, lineColor = {0, 0, 0}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, textString = "Pancreas
    Beta Cells"), Rectangle(extent = {{-50, 12}, {-22, 4}}, lineColor = {0, 0, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-24, 10}, {-18, 6}}, lineColor = {213, 170, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-52, 10}, {-46, 6}}, lineColor = {213, 170, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid), Line(points = {{-44, 8}, {-34, 8}}, color = {0, 0, 0}, arrow = {Arrow.None, Arrow.Filled}, thickness = 0.5), Text(extent = {{-12, 20}, {10, 6}}, lineColor = {0, 0, 0}, lineThickness = 1, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, textString = "Plasma Insulin
    Concentration"), Ellipse(extent = {{22, 62}, {24, 60}}, lineColor = {0, 0, 0}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5), Line(points = {{22, 66}, {24, 62}}, color = {0, 0, 0}, thickness = 0.5), Line(points = {{22, 40}, {24, 36}}, color = {0, 0, 0}, thickness = 0.5), Ellipse(extent = {{22, 36}, {24, 34}}, lineColor = {0, 0, 0}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5), Ellipse(extent = {{-22, 12}, {-20, 10}}, lineColor = {0, 0, 0}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5), Line(points = {{-20, 12}, {-18, 8}}, color = {0, 0, 0}, thickness = 0.5), Text(extent = {{-48, 24}, {-24, 8}}, lineColor = {0, 0, 0}, lineThickness = 1, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, textString = "Pancreatic Insulin
    Production Rate"), Rectangle(extent = {{-12, 4}, {12, -4}}, lineColor = {0, 0, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, origin = {36, 10}, rotation = 180), Rectangle(extent = {{-3, 2}, {3, -2}}, lineColor = {213, 170, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, origin = {45, 10}, rotation = 180), Rectangle(extent = {{-3, 2}, {3, -2}}, lineColor = {213, 170, 255}, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, origin = {27, 10}, rotation = 180), Text(extent = {{52, 16}, {90, 6}}, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {213, 170, 255}, fillPattern = FillPattern.Solid, textString = "Insulin Destruction Rate"), Line(points = {{40, 10}, {50, 10}}, color = {0, 0, 0}, arrow = {Arrow.None, Arrow.Filled}, thickness = 0.5), Line(points = {{-20, 50}, {-58, 42}, {-60, 18}}, color = {0, 0, 0}, smooth = Smooth.Bezier, arrow = {Arrow.None, Arrow.Filled}, pattern = LinePattern.Dash), Line(points = {{2, 48}, {-18, 34}, {-22, 14}}, color = {0, 0, 0}, smooth = Smooth.Bezier, arrow = {Arrow.None, Arrow.Filled}, pattern = LinePattern.Dash), Line(points = {{20, 12}, {28, 22}, {26, 34}}, color = {0, 0, 0}, smooth = Smooth.Bezier, arrow = {Arrow.None, Arrow.Filled}, pattern = LinePattern.Dash)}),
        Documentation(info = "<html><head></head><body><br></body></html>"));
    end GiRegulationSchema;

    model ExampleCausalAcausal
      Components.Compartment compartment annotation(
        Placement(transformation(extent = {{-52, 52}, {-32, 72}})));
      Components.ProductionFlowRateParam productionFlowRateParam(desiredFlowRate = 1e-10) annotation(
        Placement(transformation(extent = {{-84, 62}, {-64, 82}})));
      Components.VolumeConst volumeConst(desiredVolume = 0.005) annotation(
        Placement(transformation(extent = {{-82, 44}, {-62, 64}})));
    equation
      connect(volumeConst.volume, compartment.volume) annotation(
        Line(points = {{-61.9, 54.1}, {-55.95, 54.1}, {-55.95, 60.1}, {-47.9, 60.1}}, color = {0, 0, 127}));
      connect(productionFlowRateParam.outflow, compartment.qin) annotation(
        Line(points = {{-63.9, 71.9}, {-52.95, 71.9}, {-52.95, 72.1}, {-41.9, 72.1}}, color = {173, 127, 168}, thickness = 1));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end ExampleCausalAcausal;
  end Test;
  annotation(
    Documentation(info = "<html><head></head><body>The Glucose-Insulin regulation model as presented by Stolwik and Hardy\cite{stolwijk1974regulation} and further described by Khoo \cite{khoo2000} consists of glucose compartment and insulin compartment. Each compartment has inflow and one or several outflows. Insulin production is triggered by glucose concentration and insulin influence rapidly the tissue utilization rate (insulin dependent)<div><br></div><div>Components - contains supporting user defined components</div><div>Models - contains implementation using different&nbsp;</div><div>Interfaces - input,output and acausal connectors</div><div>Types - custom types&nbsp;</div><div>Test - experiment with models - setting healthy, diabetes type 1 and 2</div></body></html>"));
end GlucoseInsulin;