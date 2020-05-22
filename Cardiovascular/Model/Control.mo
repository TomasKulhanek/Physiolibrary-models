within Cardiovascular.Model;
package Control "models of control mechanism and additional components"
  extends Modelica.Icons.VariantsPackage;
  package EPO_Physiolibrary = Physiolibrary (Types(
        redeclare type Concentration = Real (
            quantity="EPO Concentration",
            unit="1/m3",
            displayUnit="iu/l"),
        redeclare type AmountOfSubstance = Real (
            quantity="EPO AmountOfSubstance",
            unit="1",
            displayUnit="iu"),
        redeclare type MolarFlowRate = Real (
            quantity="EPO Flow Rate",
            unit="1/s",
            displayUnit="iu/min"),
        redeclare type MolarEnergy = Real (
            quantity="EPO Internal Energy",
            unit="J",
            displayUnit="cal/iu")));

  model Baroreflex
    extends Cardiovascular.Interfaces.Controlled.ShortTermControl;
  /*  Physiolibrary.Types.BusConnector busConnector annotation (Placement(
        transformation(extent={{-28,14},{12,54}}), iconTransformation(
          extent={{60,70},{100,110}})));*/
    Baroreceptor baroreceptor(activationDelay(displayUnit="s"))
      annotation (Placement(transformation(extent={{18,-54},{80,18}})));
  equation
    connect(baroreceptor.RS, busConnector.peripheralconductance)
      annotation (Line(
        points={{25.44,-26.64},{-8,-26.64},{-8,34}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(baroreceptor.evright, busConnector.rvcompliance) annotation (
        Line(
        points={{25.44,-14.4},{-8,-14.4},{-8,34}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(baroreceptor.evleft, busConnector.lvcompliance) annotation (
       Line(
        points={{24.2,-2.88},{-8,-2.88},{-8,34}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(baroreceptor.HR, busConnector.heartrate) annotation (Line(
        points={{23.89,9},{-8,9},{-8,34}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(baroreceptor.PAo, busConnector.aortameanpressure) annotation (
        Line(
        points={{25.44,-47.52},{-8,-47.52},{-8,34}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(baroreceptor.evenacava, busConnector.venacavacompliance)
      annotation (Line(
        points={{24.82,-38.88},{-8,-38.88},{-8,34}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics), Diagram(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics));
  end Baroreflex;

  model Baroreceptor
    Modelica.Blocks.Continuous.TransferFunction H1(a={15,1}, b={1});
    Modelica.Blocks.Continuous.TransferFunction H2(a={15,1}, b={0.048});
    Modelica.Blocks.Continuous.TransferFunction H3(a={15,1}, b={0.154});
    // from orign.mo(a={30,1}, b={0.194});
    Modelica.Blocks.Continuous.TransferFunction H4(a={2,1}, b={0.1});
    Modelica.Blocks.Nonlinear.DeadZone deadZone(uMax=0.1, uMin=-0.1);
    parameter Physiolibrary.Types.Pressure PAOmedia=13465.561128915;
    parameter Physiolibrary.Types.Frequency HR0Param=1.3333333333333
      annotation (Dialog(enable=not useConductanceInput));
    parameter Boolean useHRInput=false
      "=true, if external HR value is used" annotation (
      Evaluate=true,
      HideResult=true,
      choices(__Dymola_checkBox=true),
      Dialog(group="External inputs/outputs"));
    Physiolibrary.Types.RealIO.FrequencyInput cond(start=HR0Param) = HR0 if
         useHRInput annotation (Placement(transformation(extent={{-62,36},{
              -22,76}}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={26,76})));
    Physiolibrary.Types.RealIO.PressureInput PAo "pressure in aorta"
      annotation (Placement(transformation(extent={{2,-58},{42,-18}}),
          iconTransformation(
          extent={{-16,-16},{16,16}},
          rotation=0,
          origin={-76,-82})));
    Physiolibrary.Types.RealIO.FrequencyOutput HR
      "heart rate - compatible with Const block" annotation (Placement(
          transformation(extent={{-76,60},{-56,80}}), iconTransformation(
          extent={{-15,-15},{15,15}},
          rotation=180,
          origin={-81,75})));
    Physiolibrary.Types.RealIO.HydraulicComplianceOutput evright
      annotation (Placement(transformation(extent={{80,22},{100,42}}),
          iconTransformation(
          extent={{-14,-14},{14,14}},
          rotation=180,
          origin={-76,10})));
    Physiolibrary.Types.RealIO.HydraulicComplianceOutput evleft annotation (
       Placement(transformation(extent={{78,-18},{98,2}}),
          iconTransformation(
          extent={{-16,-16},{16,16}},
          rotation=180,
          origin={-80,42})));
    Physiolibrary.Types.HydraulicElastance evrightref;
    Physiolibrary.Types.HydraulicElastance evleftref;
    Physiolibrary.Types.RealIO.HydraulicComplianceOutput evenacava
      annotation (Placement(transformation(extent={{78,-54},{98,-34}}),
          iconTransformation(
          extent={{-16,-16},{16,16}},
          rotation=180,
          origin={-78,-58})));
    Physiolibrary.Types.RealIO.HydraulicConductanceOutput RS annotation (
        Placement(transformation(extent={{80,-90},{100,-70}}),
          iconTransformation(
          extent={{-14,-14},{14,14}},
          rotation=180,
          origin={-76,-24})));
    parameter Physiolibrary.Types.HydraulicElastance EV0right=
        103991462.1837;
    parameter Physiolibrary.Types.HydraulicElastance EV0left=106657909.932;
    parameter Physiolibrary.Types.HydraulicCompliance EV0venacava=
        1.8751539396141e-006;
    parameter Physiolibrary.Types.HydraulicResistance RS0(displayUnit=
          "(mmHg.s)/ml") = 81793284.67910001;
    parameter Physiolibrary.Types.Time activationDelay=15;
    //  parameter Physiolibrary.Types.HydraulicConductance Conductance=0
  protected
    Physiolibrary.Types.Frequency HR0;
  //  parameter Physiolibrary.Types.HydraulicCompliance ECV0;
  equation
    if not useHRInput then
      HR0 = HR0Param;
    end if;
    if time > activationDelay then
      deadZone.u = (PAOmedia - PAo)/133.322387415/2;
    else
      deadZone.u = 0;
    end if;
    H1.u = deadZone.y;
    HR = (HR0*60 + H1.y)/60;
    //recount to SI Hz
    H2.u = deadZone.y;
    evright = 1/(EV0right + H2.y*1000000.0*133.322387415);
    evrightref = 1/evright;
    //recount to SI
    evleft = 1/(EV0left + H2.y*1000000.0*133.322387415);
    evleftref = 1/evleft;
    //recount to SI
    H3.u = deadZone.y;
    evenacava = EV0venacava + H3.y*1e-006/133.322387415;
    H4.u = deadZone.y;
    RS = 1/(RS0 + H4.y*1000000.0*133.322387415);
    //recount to conductance
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Ellipse(
                  extent={{28,102},{-68,-110}},
                  lineColor={0,0,127},
                  fillColor={255,170,170},
                  fillPattern=FillPattern.Solid),Text(
                  extent={{-66,74},{18,58}},
                  lineColor={0,0,127},
                  fillColor={0,0,255},
                  fillPattern=FillPattern.Solid,
                  textString="HR"),Text(
                  extent={{-58,12},{22,-2}},
                  lineColor={0,0,127},
                  fillColor={0,0,255},
                  fillPattern=FillPattern.Solid,
                  textString="EVright"),Text(
                  extent={{-62,44},{26,30}},
                  lineColor={0,0,127},
                  fillColor={0,0,255},
                  fillPattern=FillPattern.Solid,
                  textString="EVleft"),Text(
                  extent={{-80,-60},{34,-72}},
                  lineColor={0,0,127},
                  fillColor={255,170,170},
                  fillPattern=FillPattern.Solid,
                  textString="ECV"),Text(
                  extent={{-62,-20},{16,-34}},
                  lineColor={0,0,127},
                  fillColor={255,170,170},
                  fillPattern=FillPattern.Solid,
                  textString="RPS"),Text(
                  extent={{-60,-84},{-16,-94}},
                  lineColor={0,0,127},
                  textString="PAo"),Text(
                  extent={{-98,-104},{116,-120}},
                  lineColor={0,0,0},
                  lineThickness=1,
                  fillColor={255,128,0},
                  fillPattern=FillPattern.Solid,
                  textString="%name")}), Diagram(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics));
  end Baroreceptor;

  package BloodVolume
    extends Modelica.Icons.UtilitiesPackage;

    model KidneyPO2Estimate

      Physiolibrary.Types.RealIO.PressureOutput pressure annotation (
          Placement(transformation(extent={{82,-10},{102,10}}),
            iconTransformation(extent={{82,-10},{102,10}})));
      parameter Real MaxPo2=60;
      Physiolibrary.Types.RealIO.FractionInput hematocrit annotation (
          Placement(transformation(extent={{-100,-20},{-60,20}}),
            iconTransformation(extent={{-100,-20},{-60,20}})));
      Physiolibrary.Blocks.Factors.Spline spline(Yscale=101325/760, data=[0,
            0, 0; 0.4, 35, 1; 0.6, 60, 0])
        annotation (Placement(transformation(extent={{-14,-10},{6,10}})));
      Physiolibrary.Types.Constants.OneConst one
        annotation (Placement(transformation(extent={{-26,8},{-18,16}})));
    equation
      connect(hematocrit, spline.u) annotation (Line(
          points={{-80,0},{-12,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(spline.y, pressure) annotation (Line(
          points={{-4,-4},{-4,-6},{72,-6},{72,0},{92,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(one.y, spline.yBase) annotation (Line(
          points={{-17,12},{-4,12},{-4,2}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics), Icon(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Rectangle(
              extent={{-80,80},{82,-60}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
                      fillColor={255,255,167}),Text(
              extent={{-184,-58},{214,-94}},
              lineColor={0,0,255},
              textString="%name")}));
    end KidneyPO2Estimate;

    model Erythropoetin

      EPO_Physiolibrary.Chemical.Components.Substance erythropoetin(
          useNormalizedVolume=false, solute_start(displayUnit="mol") = 79.5)
        annotation (Placement(transformation(extent={{-30,6},{2,40}})));
      EPO_Physiolibrary.Chemical.Sources.UnlimitedSolutePump secretion(
          useSoluteFlowInput=true) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={144,62})));
      EPO_Physiolibrary.Chemical.Sensors.ConcentrationMeasure
        concentrationMeasure annotation (Placement(transformation(
            extent={{-21,-21},{21,21}},
            rotation=90,
            origin={-15,81})));
      Physiolibrary.Types.RealIO.ConcentrationOutput concentration
        annotation (Placement(transformation(extent={{42,72},{62,92}}),
            iconTransformation(
            extent={{-21,-21},{21,21}},
            rotation=0,
            origin={121,3})));
      Physiolibrary.Types.RealIO.PressureInput kidney_po2 annotation (
          Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={138,-2}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-60,-80})));
      Physiolibrary.Blocks.Factors.Spline PO2Effect(data={{0.0,4.0,0},{35.0,
            0.0,-0.14},{60.0,-1.0,0}}, Xscale=101325/760) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={102,-2})));
      Physiolibrary.Blocks.Math.Power pow annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=90,
            origin={98,16})));
      Physiolibrary.Blocks.Factors.Normalization CounEffect annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={58,46})));
      Physiolibrary.Blocks.Factors.Normalization FunctionEffect annotation (
         Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={78,46})));
      Physiolibrary.Blocks.Factors.Normalization PO2Effect1 annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={98,46})));
      Physiolibrary.Types.Constants.FractionConst
        Kidney_Nefron_Count_TotalxNormal(k=1)
        annotation (Placement(transformation(extent={{26,16},{42,26}})));
      Physiolibrary.Types.Constants.FractionConst KidneyFunctionEffect(k=1)
        annotation (Placement(transformation(extent={{60,10},{76,20}})));
      Physiolibrary.Types.RealIO.VolumeInput ecf_volume annotation (
          Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-58,70}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-80})));
      Modelica.Blocks.Math.Gain VODIST(k=0.4) annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=0,
            origin={-58,46})));
      Physiolibrary.Types.Constants.FractionConst hormoneFlowFraction(k=1)
        annotation (Placement(transformation(extent={{72,-28},{88,-20}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate(k(
            displayUnit="mol/min") = 0.011166666666667)
        annotation (Placement(transformation(extent={{30,40},{44,50}})));
      EPO_Physiolibrary.Chemical.Sources.UnlimitedSolutePumpOut clearance(
          useSoluteFlowInput=true)   annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={2,-30})));
      Modelica.Blocks.Math.Gain K(k(unit="1/s") = 0.00555/60) annotation (
          Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={-4,-8})));
    equation
      connect(secretion.q_out, erythropoetin.q_out) annotation (Line(
          points={{134,62},{8,62},{8,23},{-14,23}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(pow.y, PO2Effect1.u) annotation (Line(
          points={{98,22.6},{98,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CounEffect.y, FunctionEffect.yBase) annotation (Line(
          points={{62,46},{76,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(FunctionEffect.y, PO2Effect1.yBase) annotation (Line(
          points={{82,46},{96,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Kidney_Nefron_Count_TotalxNormal.y, CounEffect.u) annotation (
         Line(
          points={{44,21},{58,21},{58,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(KidneyFunctionEffect.y, FunctionEffect.u) annotation (Line(
          points={{78,15},{78,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PO2Effect.y, pow.exponent) annotation (Line(
          points={{102,2},{102,10},{101.6,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(kidney_po2, PO2Effect.u) annotation (Line(
          points={{138,-2},{110,-2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PO2Effect.yBase, hormoneFlowFraction.y) annotation (Line(
          points={{102,-4},{102,-24},{90,-24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(molarFlowRate.y, CounEffect.yBase) annotation (Line(
          points={{45.75,45},{50.875,45},{50.875,46},{56,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(erythropoetin.solutionVolume, VODIST.y) annotation (Line(
          points={{-20.4,29.8},{-20.4,46},{-51.4,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PO2Effect1.y, secretion.soluteFlow) annotation (Line(
          points={{102,46},{140,46},{140,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ecf_volume, VODIST.u) annotation (Line(
          points={{-58,70},{-68,70},{-68,46},{-65.2,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(concentrationMeasure.concentration, concentration)
        annotation (Line(
          points={{1.8,81},{4,81},{4,82},{52,82}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(erythropoetin.q_out, concentrationMeasure.q_in) annotation (
          Line(
          points={{-14,23},{-14,81},{-15,81}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(clearance.q_in, erythropoetin.q_out) annotation (Line(
          points={{-8,-30},{-34,-30},{-34,23},{-14,23}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(erythropoetin.solute, K.u) annotation (Line(
          points={{-4.4,6},{-4,6},{-4,-0.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(K.y, clearance.soluteFlow) annotation (Line(
          points={{-4,-14.6},{6,-14.6},{6,-26}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{160,100}}), graphics={Text(
                      extent={{-180,98},{200,60}},
                      lineColor={0,0,255},
                      textString="%name"),Bitmap(extent={{-88,-62},{102,80}},
              fileName=
              "modelica://Cardiovascular/Resources/Icons/320px-Erythropoietin.png")}),
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{160,100}}),                                                                                                    graphics));
    end Erythropoetin;

    model KidneyFluidBalance

      Physiolibrary.Types.RealIO.VolumeFlowRateOutput urineoutflowrate
        annotation (Placement(transformation(extent={{40,-80},{60,-60}}),
            iconTransformation(extent={{40,-80},{60,-60}})));
      Physiolibrary.Types.RealIO.VolumeInput plasmaticVolume annotation (
          Placement(transformation(extent={{46,-12},{86,28}}),
            iconTransformation(
            extent={{-13,-13},{13,13}},
            rotation=180,
            origin={47,-7})));
      parameter Physiolibrary.Types.VolumeFlowRate Kud=4.6666666666667e-08;
      //dehydratation
      parameter Physiolibrary.Types.VolumeFlowRate Kuo=3.4666666666667e-07;
      //overhydratation
      parameter Physiolibrary.Types.VolumeFlowRate Jun=1.6666666666667e-08;
      discrete Physiolibrary.Types.Volume Vpn;
    equation
      when {initial()} then
          Vpn = plasmaticVolume;
    end when;
      if plasmaticVolume < Vpn then
        urineoutflowrate = Kud*((plasmaticVolume - Vpn)/Vpn) + Jun;
      else
        urineoutflowrate = Kuo*((plasmaticVolume - Vpn)/Vpn) + Jun;
      end if;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Bitmap(extent={{-82,-82},
              {80,80}}, fileName=
                  "modelica://Cardiovascular/Resources/Icons/kidney.png")}));
    end KidneyFluidBalance;

    model RedBloodCells2

      Erythropoetin erythropoetin annotation (Placement(transformation(
            extent={{-11,-10},{11,10}},
            rotation=0,
            origin={-77,-4})));
      Physiolibrary.Population.Components.Population RBC
        annotation (Placement(transformation(extent={{-18,-26},{2,-6}})));
      Physiolibrary.Population.Sources.Growth erythropoiesis(useChangeInput=
           true) annotation (Placement(transformation(extent={{-46,-30},{-26,
                -10}})));
      Physiolibrary.Population.Sources.Growth transfusion
        annotation (Placement(transformation(extent={{-38,14},{-18,34}})));
      Physiolibrary.Population.Components.Mortality degradation(LifeTime(
            displayUnit="d") = 10368000)
        annotation (Placement(transformation(extent={{6,-30},{26,-10}})));
      Physiolibrary.Population.Sources.Loss hemorrhage
        annotation (Placement(transformation(extent={{6,16},{26,36}})));
      Physiolibrary.Types.Constants.PopulationChangeConst
        RBCBaseSecretionRate(k=1.16e6) "13.7 ml/day (12e12 cells == 2.4 L)"
        annotation (Placement(transformation(extent={{-54,4},{-38,16}})));
      Physiolibrary.Blocks.Factors.SplineLag      EPOEffect(
        HalfTime=3*86400*Modelica.Math.log(2),
        data={{0.0,0.0,0},{1.3,1.0,1.0},{4.0,4.0,0}},
        stateName="[EPO]Delay.Effect",
      UsePositiveLog10=true,
      Xscale=1e3) "20 miu/ml = 20e3 iu/m3"
        annotation (Placement(transformation(extent={{-46,-14},{-26,6}})));
      Physiolibrary.Types.BusConnector busConnector
        annotation (Placement(transformation(extent={{-118,10},{-78,50}})));
      Modelica.Blocks.Math.Gain RBCVol(k(unit="m3") = 2.4e-3/12e12)
        "12e12 cells == 2.4 L" annotation (Placement(transformation(
          extent={{5,-5},{-5,5}},
          rotation=0,
          origin={-35,-41})));
      Modelica.Blocks.Math.Gain InitialPopulation(k=12e12/2.4e-3)
        "12e12 cells == 2.4 L" annotation (Placement(transformation(
            extent={{5,-5},{-5,5}},
            rotation=90,
            origin={-7,7})));
    initial algorithm

    equation
      connect(erythropoiesis.port_b, RBC.port) annotation (Line(
          points={{-26,-20},{-16,-20},{-16,-16},{-8,-16}},
          color={0,127,127},
          thickness=1,
          smooth=Smooth.None));
      connect(transfusion.port_b, RBC.port) annotation (Line(
          points={{-18,24},{-18,-16},{-8,-16}},
          color={0,127,127},
          thickness=1,
          smooth=Smooth.None));
      connect(degradation.port_a, RBC.port) annotation (Line(
          points={{6.2,-20},{4,-20},{4,-16},{-8,-16}},
          color={0,127,127},
          thickness=1,
          smooth=Smooth.None));
      connect(hemorrhage.port_a, RBC.port) annotation (Line(
          points={{6,26},{4,26},{4,-16},{-8,-16}},
          color={0,127,127},
          thickness=1,
          smooth=Smooth.None));
      connect(erythropoiesis.populationChange, EPOEffect.y) annotation (
          Line(
          points={{-36,-16},{-36,-8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RBCBaseSecretionRate.y, EPOEffect.yBase) annotation (Line(
          points={{-36,10},{-36,-2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(EPOEffect.u, erythropoetin.concentration) annotation (Line(
          points={{-44,-4},{-64,-4},{-64,-3.7},{-69.3,-3.7}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(erythropoetin.kidney_po2, busConnector.Kidney_PO2)
        annotation (Line(
          points={{-84.6154,-12},{-96,-12},{-96,-20},{-98,-20},{-98,30}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{-9,-3},{-9,-3}}));
      connect(erythropoetin.ecf_volume, busConnector.ecfvolume) annotation (
         Line(
          points={{-79.5385,-12},{-79.5385,-24},{-98,-24},{-98,30}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{2,-6},{2,-6}}));
      connect(RBC.population, RBCVol.u) annotation (Line(
          points={{-2,-26},{-2,-41},{-29,-41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RBCVol.y, busConnector.RBCVolume) annotation (Line(
          points={{-40.5,-41},{-98,-41},{-98,30}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(InitialPopulation.u, busConnector.initialrbcvolume)
        annotation (Line(
          points={{-7,13},{-7,30},{-98,30}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-120,-100},{100,100}}), graphics={Bitmap(extent={{-78,-102},
              {80,56}}, fileName=
              "modelica://Cardiovascular/Resources/Icons/redbloodcells3.png"),
              Text(   extent={{-162,-36},{66,-66}},
                      lineColor={0,0,255},
                      textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-120,-100},{100,100}}),
            graphics));
    end RedBloodCells2;

    model Plasma2

      Physiolibrary.Osmotic.Sources.SolventInflux transfusion(
          useSolutionFlowInput=false) annotation (Placement(transformation(
              extent={{-44,-38},{-24,-18}})));
      Physiolibrary.Osmotic.Sources.SolventOutflux hemorrhage(
          useSolutionFlowInput=false) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-34,-54})));
      Physiolibrary.Osmotic.Sources.SolventInflux IVDrip(
          useSolutionFlowInput=false) annotation (Placement(transformation(
              extent={{-44,-48},{-24,-28}})));
      Physiolibrary.Osmotic.Sources.SolventInflux FoodAndDrink(
          useSolutionFlowInput=false, SolutionFlow(displayUnit="l/day")=
          2.4305555555556e-08) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-34,-10})));
      Physiolibrary.Osmotic.Sources.SolventInflux Metabolism(
          useSolutionFlowInput=false, SolutionFlow(displayUnit="ml/day")=
          3.4722222222222e-09) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={26,-28})));
      Physiolibrary.Osmotic.Sources.SolventOutflux SkinAndLungsLoss(
          useSolutionFlowInput=false, SolutionFlow(displayUnit="ml/day")=
          1.0416666666667e-08) annotation (Placement(transformation(
            extent={{-11,-11},{11,11}},
            rotation=0,
            origin={53,-27})));
      Physiolibrary.Osmotic.Sources.SolventOutflux Urine(SolutionFlow(
            displayUnit="ml/day") = 1.7361111111111e-08,
          useSolutionFlowInput=true) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={0,-28})));
      Physiolibrary.Osmotic.Sources.SolventOutflux Feces(
          useSolutionFlowInput=false, SolutionFlow(displayUnit="ml/day")=
          1.1574074074074e-09) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={0,-8})));
      Physiolibrary.Osmotic.Components.Membrane capillaryMembrane(
        HydraulicPressureIn(displayUnit="mmHg") = 2359.8062572455,
        cond(displayUnit="m3/(Pa.s)") = 3.7265559293265e-11,
        HydraulicPressureOut=-549.2882361498,
        T(displayUnit="K"))
        annotation (Placement(transformation(extent={{4,-70},{24,-50}})));
      Physiolibrary.Osmotic.Components.OsmoticCell interstitialFluid(
        NumberOfMembraneTypes=2,
        volume_start=0.01175,
        ImpermeableSolutes={0.0061,3.1})
        annotation (Placement(transformation(extent={{26,-68},{46,-48}})));
      Modelica.Blocks.Math.Add add1
        annotation (Placement(transformation(extent={{46,-76},{56,-66}})));
      KidneyFluidBalance kidneyFluidBalance(
        Kud(displayUnit="ml/min"),
        Kuo(displayUnit="m3/s"),
        Jun(displayUnit="m3/s"))
        annotation (Placement(transformation(extent={{-10,-28},{48,24}})));
      Physiolibrary.Osmotic.Components.SolventFlux lymphatic(SolutionFlow(
            displayUnit="l/day") = 3.45e-08) annotation (Placement(
            transformation(
            extent={{-7,-7},{7,7}},
            rotation=180,
            origin={11,-39})));
      Physiolibrary.Types.BusConnector busConnector
        annotation (Placement(transformation(extent={{44,-24},{84,16}})));
      Physiolibrary.Osmotic.Components.OsmoticCell plasma(
        Simulation=Physiolibrary.Types.SimulationType.NoInit,
        NumberOfMembraneTypes=2,
        ImpermeableSolutes(displayUnit="mmol") = {0.00356,0.82})
        annotation (Placement(transformation(extent={{-26,-70},{-6,-50}})));
    equation
      connect(capillaryMembrane.q_out, interstitialFluid.q_in[1])
        annotation (Line(
          points={{24,-60},{28,-60},{28,-58.5},{36,-58.5}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(interstitialFluid.volume, add1.u1) annotation (Line(
          points={{42,-68},{45,-68}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(interstitialFluid.q_in[1], lymphatic.q_in) annotation (Line(
          points={{36,-58.5},{36,-39},{18,-39}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(kidneyFluidBalance.urineoutflowrate, Urine.solutionFlow)
        annotation (Line(
          points={{33.5,-20.2},{33.5,-21},{0,-21}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(plasma.q_in[1], capillaryMembrane.q_in) annotation (Line(
          points={{-16,-60.5},{-8,-60.5},{-8,-60},{4,-60}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(plasma.q_in[1], transfusion.q_out) annotation (Line(
          points={{-16,-60.5},{-16,-28},{-28,-28}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(lymphatic.q_out, transfusion.q_out) annotation (Line(
          points={{4,-39},{-16,-39},{-16,-28},{-28,-28}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(IVDrip.q_out, transfusion.q_out) annotation (Line(
          points={{-28,-38},{-16,-38},{-16,-28},{-28,-28}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(hemorrhage.q_in, transfusion.q_out) annotation (Line(
          points={{-28,-54},{-16,-54},{-16,-28},{-28,-28}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(FoodAndDrink.q_out, transfusion.q_out) annotation (Line(
          points={{-28,-10},{-16,-10},{-16,-28},{-28,-28}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Feces.q_in, transfusion.q_out) annotation (Line(
          points={{-6,-8},{-16,-8},{-16,-28},{-28,-28}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Urine.q_in, transfusion.q_out) annotation (Line(
          points={{-6,-28},{-28,-28}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(kidneyFluidBalance.plasmaticVolume, busConnector.plasmaVolume)
        annotation (Line(
          points={{32.63,-3.82},{62.315,-3.82},{62.315,-4},{64,-4}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(plasma.volume, busConnector.plasmaVolume) annotation (Line(
          points={{-10,-70},{-10,-78},{64,-78},{64,-4}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(add1.u2, plasma.volume) annotation (Line(
          points={{45,-74},{-10,-74},{-10,-70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.y, busConnector.ecfvolume) annotation (Line(
          points={{56.5,-71},{56.5,-70},{64,-70},{64,-4}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(Metabolism.q_out, lymphatic.q_in) annotation (Line(
          points={{32,-28},{36,-28},{36,-38},{34,-38},{34,-39},{18,-39}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));
      connect(SkinAndLungsLoss.q_in, lymphatic.q_in) annotation (Line(
          points={{46.4,-27},{36,-27},{36,-38},{34,-38},{34,-39},{18,-39}},
          color={127,127,0},
          thickness=1,
          smooth=Smooth.None));

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Bitmap(extent={{-72,-72},
              {80,78}}, fileName=
              "modelica://Cardiovascular/Resources/Icons/plazma.png"),Text(
                      extent={{-100,-62},{96,-98}},
                      lineColor={0,0,255},
                      textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end Plasma2;

    model VolumeRefill2
      "injects/removes volume if the pressure on connector is > 0"

      DesiredFlowrate desiredFlowrate(flowtime(displayUnit="s") = 1)
        annotation (Placement(transformation(extent={{-4,6},{16,26}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b port_b annotation (
         Placement(transformation(extent={{56,-26},{76,-6}}),
            iconTransformation(extent={{82,-100},{102,-80}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump volumeRefill(
          useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-14,-26},{6,-6}})));
      Modelica.Blocks.Logical.Switch switch1
        annotation (Placement(transformation(extent={{14,-4},{0,10}})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst zeroRefill(k(
            displayUnit="l/min") = 0) annotation (Placement(transformation(
            extent={{-8,-6},{8,6}},
            rotation=180,
            origin={38,-4})));
      Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure
        annotation (Placement(transformation(extent={{70,10},{50,30}})));
      Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0)
        annotation (Placement(transformation(extent={{46,8},{30,24}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(Conductance(
            displayUnit="ml/(mmHg.s)") = 7.5006157584566e-08)
        annotation (Placement(transformation(extent={{28,-26},{48,-6}})));
      Physiolibrary.Types.BusConnector busConnector
        annotation (Placement(transformation(extent={{-32,18},{8,58}})));
    equation
    /*  if desiredFlowrate.volumeflowrate < 0 then
    volumeRefill.solutionFlow = -max(0, min(-desiredFlowrate.volumeflowrate, -maxflowrate));
  else
    volumeRefill.solutionFlow = desiredFlowrate.volumeflowrate;
  end if;*/
      connect(switch1.y, volumeRefill.solutionFlow) annotation (Line(
          points={{-0.7,3},{-4,3},{-4,-9}},
        color={0,0,127},
          smooth=Smooth.None));
      connect(desiredFlowrate.volumeflowrate, switch1.u1) annotation (Line(
          points={{15.9,18.5},{15.4,18.5},{15.4,8.6}},
        color={0,0,127},
          smooth=Smooth.None));
      connect(zeroRefill.y, switch1.u3) annotation (Line(
          points={{28,-4},{28,-2.6},{15.4,-2.6}},
        color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure.pressure, greaterThreshold.u) annotation (
          Line(
          points={{54,16},{47.6,16}},
        color={0,0,127},
          smooth=Smooth.None));
      connect(greaterThreshold.y, switch1.u2) annotation (Line(
          points={{29.2,16},{26,16},{26,3},{15.4,3}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(port_b, conductor.q_out) annotation (Line(
          points={{66,-16},{48,-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(volumeRefill.q_out, conductor.q_in) annotation (Line(
          points={{6,-16},{28,-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(desiredFlowrate.volume, busConnector.bloodVolume) annotation (
         Line(
          points={{7.4,23.2},{7.4,38},{-12,38}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{3,6},{3,6}}));
      connect(desiredFlowrate.desiredVolume, busConnector.desiredBloodVolume)
        annotation (Line(
          points={{-0.8,23.2},{-0.8,38},{-12,38}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{1,3},{1,3}}));
      connect(pressureMeasure.q_in, conductor.q_out) annotation (Line(
          points={{64,14},{64,0},{48,0},{48,-16}},
          color={0,0,0},
            thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Rectangle(
                      extent={{-28,36},{34,-30}},
                      lineColor={0,0,0},
            lineThickness=1,
                      fillPattern=FillPattern.Sphere,
                      fillColor={190,0,0},
                      radius=4),Rectangle(
                      extent={{-24,-28},{-20,-62}},
                      lineColor={0,0,0},
            lineThickness=1,
                      fillPattern=FillPattern.Sphere,
                      fillColor={190,0,0}),Rectangle(
                      extent={{30,-26},{34,-62}},
                      lineColor={0,0,0},
            lineThickness=1,
                      fillPattern=FillPattern.Sphere,
                      fillColor={190,0,0}),Polygon(
                      points={{6,-30},{6,-38},{8,-40},{12,-46},{10,-48},{12,
                -52},{14,-54},{16,-56},{14,-58},{12,-62},{14,-64},{18,-66},
                {20,-68},{22,-74},{24,-76},{28,-80},{34,-82},{40,-86},{48,-90},
                {54,-92},{60,-94},{64,-94},{80,-96},{88,-96},{88,-96},{86,-94},
                {80,-92},{74,-92},{64,-90},{62,-90},{56,-86},{46,-84},{40,-80},
                {36,-78},{30,-76},{26,-70},{24,-68},{22,-64},{18,-60},{22,-54},
                {16,-50},{16,-46},{18,-44},{12,-38},{10,-34},{10,-30},{6,-30}},
                      lineColor={127,0,0},
                      lineThickness=1,
                      fillPattern=FillPattern.Sphere,
                      smooth=Smooth.None,
                      fillColor={190,0,0}),Rectangle(
                      extent={{-28,62},{34,56}},
                      lineColor={0,0,0},
                      fillPattern=FillPattern.Solid,
                      fillColor={170,255,255}),Rectangle(
                      extent={{-28,56},{34,32}},
                      lineColor={0,0,0},
                      fillColor={170,255,255},
                      fillPattern=FillPattern.Sphere,
                      radius=2,
                      lineThickness=1),Text(
              extent={{-100,100},{100,62}},
              lineColor={0,0,255},
                      textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={Text(
              extent={{10,38},{64,28}},
              lineColor={0,0,255},
              textString="Allow change only
if the pressure is
above 0 mmHg.")}));
    end VolumeRefill2;

    model BloodProperties

      Modelica.Blocks.Math.Add DesiredBloodVolume
        annotation (Placement(transformation(extent={{8,-32},{28,-12}})));
      KidneyPO2Estimate kidneyPO2Estimate(spline(data=[0.3, 0, 0; 0.4, 36.3,
              1; 0.5, 60, 0]))
        annotation (Placement(transformation(extent={{10,-96},{30,-76}})));
      Physiolibrary.Types.BusConnector busConnector
        annotation (Placement(transformation(extent={{-20,-8},{20,32}})));
      Modelica.Blocks.Math.Division hematocrit
        annotation (Placement(transformation(extent={{8,-64},{28,-44}})));
      Modelica.Blocks.Math.Add3 BloodVolume
        annotation (Placement(transformation(extent={{12,34},{26,48}})));
      Physiolibrary.Types.Constants.FractionConst initialHematocrit(k=0.4)
        annotation (Placement(transformation(extent={{-2,68},{6,76}})));
      Modelica.Blocks.Math.Product InitialRBCVolume
        annotation (Placement(transformation(extent={{14,64},{24,74}})));
      Modelica.Blocks.Math.Add InitialPlasmaVolume(k2=-1)
        annotation (Placement(transformation(extent={{16,82},{26,92}})));
    equation
      connect(DesiredBloodVolume.u2, busConnector.RBCVolume) annotation (
          Line(
          points={{6,-28},{0,-28},{0,12}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(DesiredBloodVolume.u1, busConnector.plasmaVolume) annotation (
         Line(
          points={{6,-16},{0,-16},{0,12}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(DesiredBloodVolume.y, busConnector.desiredBloodVolume)
        annotation (Line(
          points={{29,-22},{34,-22},{34,12},{0,12}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(hematocrit.u2, DesiredBloodVolume.y) annotation (Line(
          points={{6,-60},{0,-60},{0,-38},{32,-38},{32,-22},{29,-22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hematocrit.u1, DesiredBloodVolume.u2) annotation (Line(
          points={{6,-48},{6,-28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hematocrit.y, busConnector.hematocrit) annotation (Line(
          points={{29,-54},{34,-54},{34,12},{0,12}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(hematocrit.y, kidneyPO2Estimate.hematocrit) annotation (Line(
          points={{29,-54},{32,-54},{32,-76},{0,-76},{0,-86},{12,-86}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(kidneyPO2Estimate.pressure, busConnector.Kidney_PO2)
        annotation (Line(
          points={{29.2,-86},{34,-86},{34,12},{0,12}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(BloodVolume.u3, busConnector.pulmonaryBloodVolume)
        annotation (Line(
          points={{10.6,35.4},{0,35.4},{0,12}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(BloodVolume.u2, busConnector.systemicBloodVolume) annotation (
         Line(
          points={{10.6,41},{0,41},{0,12}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(BloodVolume.u1, busConnector.heartBloodVolume) annotation (
          Line(
          points={{10.6,46.6},{0,46.6},{0,12}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(BloodVolume.y, busConnector.bloodVolume) annotation (Line(
          points={{26.7,41},{34,41},{34,12},{0,12}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{8,0},{8,0}}));
      connect(initialHematocrit.y, InitialRBCVolume.u1) annotation (Line(
          points={{7,72},{13,72}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(BloodVolume.y, InitialRBCVolume.u2) annotation (Line(
          points={{26.7,41},{26.7,62},{13,62},{13,66}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(InitialRBCVolume.y, busConnector.initialrbcvolume)
        annotation (Line(
          points={{24.5,69},{34,69},{34,12},{0,12}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(InitialRBCVolume.y, InitialPlasmaVolume.u2) annotation (Line(
          points={{24.5,69},{24.5,78},{15,78},{15,84}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(BloodVolume.y, InitialPlasmaVolume.u1) annotation (Line(
          points={{26.7,41},{26.7,60},{-8,60},{-8,90},{15,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(InitialPlasmaVolume.y, busConnector.initialPlasmaVolume)
        annotation (Line(
          points={{26.5,87},{34,87},{34,12},{0,12}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics), Icon(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Rectangle(
              extent={{-40,40},{40,-20}},
              lineColor={0,0,255},
            fillPattern=FillPattern.Solid,
                      fillColor={255,127,127}),Text(
              extent={{-100,-20},{100,-60}},
              lineColor={0,0,255},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid,
              textString="%name")}));
    end BloodProperties;

    model DesiredFlowrate "control total blood volume"
      parameter Physiolibrary.Types.Time flowtime=0.1;
      parameter Boolean enabled=true;
      Physiolibrary.Types.RealIO.VolumeInput volume annotation (Placement(
            transformation(extent={{16,60},{56,100}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={14,72})));
      Physiolibrary.Types.RealIO.VolumeInput desiredVolume annotation (
          Placement(transformation(extent={{-72,56},{-32,96}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-68,72})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput volumeflowrate
        annotation (Placement(transformation(extent={{88,18},{108,38}}),
            iconTransformation(extent={{82,8},{116,42}})));
    equation
      volumeflowrate = if enabled then (desiredVolume - volume)/flowtime
         else 0;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Rectangle(
                      extent={{-98,56},{98,-8}},
                      lineColor={0,0,255},
                      fillPattern=FillPattern.Solid,
                      fillColor={170,213,255}),Ellipse(
                      extent={{-10,52},{46,0}},
                      lineColor={0,0,255},
                      fillColor={255,255,170},
                      fillPattern=FillPattern.Solid),Rectangle(
                      extent={{-92,46},{-38,8}},
                      lineColor={0,0,255},
                      fillColor={255,255,170},
                      fillPattern=FillPattern.Solid),Rectangle(
                      extent={{-32,30},{-14,24}},
                      lineColor={0,0,255},
                      fillColor={0,0,0},
                      fillPattern=FillPattern.Solid),Rectangle(
                      extent={{56,36},{74,30}},
                      lineColor={0,0,255},
                      fillColor={0,0,0},
                      fillPattern=FillPattern.Solid),Rectangle(
                      extent={{56,24},{74,18}},
                      lineColor={0,0,255},
                      fillColor={0,0,0},
                      fillPattern=FillPattern.Solid)}));
    end DesiredFlowrate;

    model PlasmaBleeding
      extends Plasma2(
        hemorrhage(useSolutionFlowInput=true),
        transfusion(useSolutionFlowInput=true),
        plasma(Simulation=Physiolibrary.Types.SimulationType.NoInit));
    equation
      connect(hemorrhage.solutionFlow, busConnector.plasmableed)
        annotation (Line(
          points={{-34,-61},{-34,-78},{64,-78},{64,-4}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(transfusion.solutionFlow, busConnector.plasmatransfusion)
        annotation (Line(
          points={{-34,-21},{-38,-21},{-38,-18},{-44,-18},{-44,18},{64,18},
              {64,-4}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end PlasmaBleeding;

    model RBCBleeding
      extends RedBloodCells2(
        transfusion(useChangeInput=true),
        hemorrhage(useChangeInput=true),
        RBC(Simulation=Physiolibrary.Types.SimulationType.NoInit));
    equation
      connect(transfusion.populationChange, busConnector.RBCtransfusion)
        annotation (Line(
          points={{-28,28},{-28,30},{-98,30}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(hemorrhage.populationChange, busConnector.RBCbleed)
        annotation (Line(
          points={{16,30},{16,46},{-98,46},{-98,30}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-120,-100},{100,100}}), graphics));
    end RBCBleeding;
  end BloodVolume;

  model BloodVolumeControl
    extends Cardiovascular.Interfaces.Controlled.LongTermControl;
  /*  Physiolibrary.Types.BusConnector busConnector annotation (Placement(
        transformation(extent={{-40,2},{0,42}}), iconTransformation(
          extent={{-38,4},{2,44}})));*/
    replaceable BloodVolume.Plasma2 plasma(plasma(Simulation=Physiolibrary.Types.SimulationType.NoInit))
      constrainedby BloodVolume.Plasma2
      annotation (Placement(transformation(extent={{-28,26},{4,58}})));
                               //(plasma(volume_start=bloodProperties.BloodVolume.y))
    replaceable BloodVolume.RedBloodCells2 redBloodCells(RBC(
          population_start=2, Simulation=Physiolibrary.Types.SimulationType.NoInit))
      constrainedby BloodVolume.RedBloodCells2
      annotation (Placement(transformation(extent={{-20,-18},{14,14}})));
    BloodVolume.BloodProperties bloodProperties annotation (Placement(
          transformation(rotation=0, extent={{-18,-40},{10,-12}})));
  initial algorithm
    plasma.plasma.state := bloodProperties.InitialPlasmaVolume.y;
    redBloodCells.RBC.state := redBloodCells.InitialPopulation.y;

  equation
    connect(plasma.busConnector, busConnector) annotation (Line(
        points={{-1.76,41.36},{20,41.36},{20,12}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(redBloodCells.busConnector, busConnector) annotation (Line(
        points={{-16.6,2.8},{-16.6,12},{20,12}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(bloodProperties.busConnector, busConnector) annotation (Line(
        points={{-4,-24.32},{-4,-22},{20,-22},{20,12}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
              {{-100,-100},{100,100}}), graphics={Text(
            extent={{-24,-36},{80,-58}},
            lineColor={0,0,255},
            horizontalAlignment=TextAlignment.Left,
            fontSize=10,
            textString="initial algorithm
  plasma.plasma.state:=bloodProperties.InitialPlasmaVolume.y;
  redBloodCells.RBC.state:=redBloodCells.InitialPopulation.y;")}),
                                                               Icon(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics));
  end BloodVolumeControl;

  model MeanAortaPressureMeasurement
    extends Physiolibrary.Hydraulic.Sensors.PressureMeasure;
    import Physiolibrary.Types.RealIO.*;
    import Physiolibrary.Types.*;
    discrete PressureOutput Pmean(start=11300)
      "Mean pressure during heart cycle" annotation (Placement(
          transformation(extent={{-10,-36},{10,-16}}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={70,30})));
    Real SumPressure(start=6300) "sum of pressure of cardiac cycle";
    discrete Boolean b(start=false) "beat signal";
    Time T0(start=0) "start of cardiac cycle ";
    discrete Time HP(start=0.75) "length of cardiac cycle";
  //protected
  equation
    b = der(q_in.pressure) > 0;
    der(SumPressure) = q_in.pressure;
   when {edge(b)} then
      T0 =   time "initial time of current cardiac cycle";
      HP =   if pre(T0) > 0 then time - pre(T0) else 0.75;
      Pmean = SumPressure/HP "mean pressure";
      reinit(SumPressure,  0) "reinitialisation of sum pressure";
               //if (Pmean2>Pd) then Pmean1 else Pmean2;
   end when;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Text(
                  extent={{-55,12},{55,-12}},
                  lineColor={0,0,0},
                  fillColor={85,170,255},
                  fillPattern=FillPattern.Solid,
                  origin={26,33},
                  rotation=180,
                  textString="Pmean")}));
  end MeanAortaPressureMeasurement;

  model BloodFlowMeasurement
    "measures flow, diastolic, systolic and mean pressure"
    extends Physiolibrary.Hydraulic.Sensors.FlowMeasure;
    import Physiolibrary.Types.RealIO.*;
    import Physiolibrary.Types.*;
    PressureOutput Ps "Systolic pressure during heart cycle" annotation (
        Placement(transformation(extent={{-72,-42},{-52,-22}}),
          iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-82,-102})));
    PressureOutput Pd "Diastolic pressure during heart cycle" annotation (
        Placement(transformation(extent={{-50,-40},{-30,-20}}),
          iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-62,-102})));
    PressureOutput Pmean "Mean pressure during heart cycle" annotation (
        Placement(transformation(extent={{-10,-36},{10,-16}}),
          iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-42,-102})));
    Physiolibrary.Types.RealIO.VolumeOutput SV "systolic volume"
      annotation (Placement(transformation(extent={{22,-42},{42,-22}}),
          iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={32,-100})));
    Physiolibrary.Types.RealIO.VolumeFlowRateOutput CO "Cardiac output"
      annotation (Placement(transformation(extent={{50,-40},{70,-20}}),
          iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={52,-100})));
    Physiolibrary.Types.Volume Volume(start=0)
      "sum of volume through cyrdiac cycle";
    Real SumPressure(start=0) "sum of pressure of cardiac cycle";
    Pressure Pmin(start=133000);
    Pressure Pmax(start=0);
    discrete Time T0(start=0) "start of cardiac cycle ";
    discrete Time HP "length of cardiac cycle";
    Boolean b;
    Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
          transformation(extent={{-14,58},{26,98}}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={-60,100})));
  initial algorithm
    Ps := q_in.pressure;
    Pd := q_in.pressure;
    Pmean := q_in.pressure;
    HP := 1/HR;
  equation
    Pmax = max(Pmax, q_in.pressure);
    Pmin = min(Pmin, q_in.pressure);
    b = time - pre(T0) >= pre(HP) "b=true when new cardiac cycle begins";
    when {b} then
      T0 = time "initial time of current cardiac cycle";
      HP = 1/HR;
      Ps = Pmax "systolic pressure = maximum pressure during cardiac cycle";
      Pd = Pmin "diastolic pressure=minimal pressure during cardiac cycle";
      Pmean = if pre(HP) > 0 then SumPressure/pre(HP) else pre(Pd)*2/3 +
        pre(Ps)*1/3 "mean pressure";
      SV = Volume
        "systolic volume is equal of total volume passed through this block";
      CO = SV/HP
        "cardiac output calculation from systolic volume and heart period";
      reinit(Volume, 0) "reinitialisation of volume";
      reinit(SumPressure, 0) "reinitialisation of sum pressure";
      reinit(Pmax, q_in.pressure) "reinitialisation of maximal pressure";
      reinit(Pmin, q_in.pressure) "reinitialisation minimal pressure";
    end when;
    der(Volume) = q_in.q;
    der(SumPressure) = q_in.pressure;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Text(
                  extent={{-52,11},{52,-11}},
                  lineColor={0,0,0},
                  fillColor={85,170,255},
                  fillPattern=FillPattern.Solid,
                  origin={-83,-76},
                  rotation=90,
                  textStyle={TextStyle.Bold},
                  textString="Ps"),Text(
                  extent={{-53,10},{53,-10}},
                  lineColor={0,0,0},
                  fillColor={85,170,255},
                  fillPattern=FillPattern.Solid,
                  origin={-62,-75},
                  rotation=90,
                  textString="Pd"),Text(
                  extent={{-55,12},{55,-12}},
                  lineColor={0,0,0},
                  fillColor={85,170,255},
                  fillPattern=FillPattern.Solid,
                  origin={-40,-55},
                  rotation=90,
                  textString="Pmean"),Text(
                  extent={{-84,78},{-34,62}},
                  lineColor={0,0,0},
                  pattern=LinePattern.Dash,
                  lineThickness=1,
                  textString="HR"),Text(
                  extent={{-55,12},{55,-12}},
                  lineColor={0,0,0},
                  fillColor={85,170,255},
                  fillPattern=FillPattern.Solid,
                  origin={54,-73},
                  rotation=90,
                  textString="CO"),Text(
                  extent={{-55,12},{55,-12}},
                  lineColor={0,0,0},
                  fillColor={85,170,255},
                  fillPattern=FillPattern.Solid,
                  origin={32,-73},
                  rotation=90,
                  textString="SV")}), Diagram(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics));
  end BloodFlowMeasurement;

  model AortaPressureMeasurement
    extends Physiolibrary.Hydraulic.Sensors.PressureMeasure;
    import Physiolibrary.Types.RealIO.*;
    import Physiolibrary.Types.*;
    discrete PressureOutput Ps "Systolic pressure during heart cycle"
      annotation (Placement(transformation(extent={{-72,-42},{-52,-22}}),
          iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={70,70})));
    discrete PressureOutput Pd "Diastolic pressure during heart cycle"
      annotation (Placement(transformation(extent={{-50,-40},{-30,-20}}),
          iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={70,50})));
    discrete PressureOutput Pmean "Mean pressure during heart cycle"
      annotation (Placement(transformation(extent={{-10,-36},{10,-16}}),
          iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={70,30})));
    Real SumPressure(start=0) "sum of pressure of cardiac cycle";
    Pressure Pmax, Pmin;
    discrete Boolean b(start=false) "beat signal";
    Time T0(start=0) "start of cardiac cycle ";
    discrete Time HP(start=1) "length of cardiac cycle";
  //protected
    Pressure PmeanA "approximation of mean pressure";
    Pressure Pmean2 "approximation of mean pressure";
  /*initial algorithm

  Ps := q_in.pressure;
  Pd := q_in.pressure;
  Pmean:=q_in.pressure;*/
  equation
    Pmax = if not (initial() or edge(b)) then max(Pmax, q_in.pressure)
       else q_in.pressure;
    Pmin = if not (initial() or edge(b)) then min(Pmin, q_in.pressure)
       else q_in.pressure;
    PmeanA = (2/3)*Pmin + (1/3)*Pmax;
    b = der(q_in.pressure) > 0;
    der(SumPressure) = q_in.pressure;
   when {initial(),edge(b)} then
      T0 =   time "initial time of current cardiac cycle";
      HP =   if pre(T0) > 0 then time - pre(T0) else 1;
      Ps =   pre(Pmax)
        "systolic pressure = maximum pressure during cardiac cycle";
      Pd =   pre(Pmin)
        "diastolic pressure=minimal pressure during cardiac cycle";
      Pmean2 = pre(SumPressure)/pre(HP) "mean pressure";
      Pmean = if (Pmean2 < Pd) then max(Pd, PmeanA) else Pmean2;
  //    Pmean =  max(Pd,(SumPressure / pre(HP))) "mean pressure";
               //if ((SumPressure / pre(HP))<Pd) then PmeanA else
      reinit(SumPressure,  0) "reinitialisation of sum pressure";
               //if (Pmean2>Pd) then Pmean1 else Pmean2;
  //     Pmax = pre(q_in.pressure) "reinitialisation of maximal pressure";
  //    Pmin = pre(q_in.pressure) "reinitialisation minimal pressure";

               //     reinit(Pmax,  q_in.pressure) "reinitialisation of maximal pressure";
  //     reinit(Pmin,  q_in.pressure) "reinitialisation minimal pressure";
   end when;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Text(
                  extent={{-55,12},{55,-12}},
                  lineColor={0,0,0},
                  fillColor={85,170,255},
                  fillPattern=FillPattern.Solid,
                  origin={26,33},
                  rotation=180,
                  textString="Pmean"),Text(
                  extent={{-53,10},{53,-10}},
                  lineColor={0,0,0},
                  fillColor={85,170,255},
                  fillPattern=FillPattern.Solid,
                  origin={48,49},
                  rotation=180,
                  textString="Pd"),Text(
                  extent={{-52,11},{52,-11}},
                  lineColor={0,0,0},
                  fillColor={85,170,255},
                  fillPattern=FillPattern.Solid,
                  origin={47,70},
                  rotation=180,
                  textString="Ps")}));
  end AortaPressureMeasurement;
end Control;
