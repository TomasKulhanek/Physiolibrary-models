within Cardiovascular.Model;
package Scenario "models of various scenarios"
    extends Modelica.Icons.VariantsPackage;

  partial model StenosisControl
    extends Interfaces.Controlled.ScenarioControl;
  /*  Physiolibrary.Types.BusConnector busConnector annotation (Placement(
        transformation(extent={{-28,14},{12,54}}), iconTransformation(
          extent={{-28,14},{12,54}})));*/
    Stenosis.StenosisElastance venacavastenosis
      annotation (Placement(transformation(extent={{-80,-52},{-28,-2}})));
    Stenosis.StenosisResistance aorticstenosis
      "Aorctic stenosis - valve diameter goes to 1/2 =resistance 1/2^4 greater"
      annotation (Placement(transformation(extent={{-30,-54},{22,-4}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst AVgon(k=0)
      annotation (Placement(transformation(
          extent={{-10,-9},{10,9}},
          rotation=180,
          origin={14,-9})));
    Stenosis.StenosisResistance mitralvalvestenosis(InitialResistance(
          displayUnit="(mmHg.s)/ml"), FinalResistance(displayUnit=
            "(mmHg.s)/ml"))
      "Aorctic stenosis - valve diameter goes to 1/2 =resistance 1/2^4 greater"
      annotation (Placement(transformation(extent={{22,-54},{74,-4}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst mvgoff(k=0)
      annotation (Placement(transformation(
          extent={{-10,-9},{10,9}},
          rotation=180,
          origin={66,-9})));
  equation
    connect(venacavastenosis.hydrauliccompliance, busConnector.venacavacompliance0)
      annotation (Line(
        points={{-51.92,-21},{-51.92,17.5},{80,17.5},{80,90}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(aorticstenosis.conductance, busConnector.avoutflowresistance)
      annotation (Line(
        points={{-1.92,-23},{-1.92,18},{80,18},{80,90}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(mitralvalvestenosis.conductance, busConnector.mv_gon)
      annotation (Line(
        points={{50.08,-23},{50.08,18},{80,18},{80,90}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(mvgoff.y, busConnector.mv_goff) annotation (Line(
        points={{53.5,-9},{54,-9},{54,18},{80,18},{80,90}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(AVgon.y, busConnector.avbackflowconductance) annotation (Line(
        points={{1.5,-9},{1.5,18},{80,18},{80,90}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Rectangle(
                  extent={{-80,50},{64,22}},
                  lineThickness=1,
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid,
                  pattern=LinePattern.None),Text(
            extent={{-72,76},{82,54}},
            pattern=LinePattern.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            textString="stenosis",
                  lineColor={0,0,0}),Line(
            points={{-86,-2},{-32,-2},{-2,32},{74,32},{78,32}},
            pattern=LinePattern.None,
            smooth=Smooth.None,
                  arrow={Arrow.None,Arrow.Filled}),Text(
            extent={{-72,40},{62,32}},
            pattern=LinePattern.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            textString="Resistance",
                  lineColor={0,0,0})}), Diagram(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics));
  end StenosisControl;

  package Stenosis
      extends Modelica.Icons.UtilitiesPackage;
    model StenosisElastance
      parameter Physiolibrary.Types.HydraulicElastance InitialElastance;
      parameter Physiolibrary.Types.HydraulicElastance FinalElastance;
      parameter Physiolibrary.Types.Time startTime(displayUnit="s") = 20;
      parameter Physiolibrary.Types.Time duration(displayUnit="s") = 5;
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput
        hydrauliccompliance annotation (Placement(transformation(extent={{
                48,-10},{68,10}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={8,24})));
    equation
      hydrauliccompliance = 1/(InitialElastance + (if time < startTime
         then 0 else if time < startTime + duration then (time - startTime)
        *(FinalElastance - InitialElastance)/duration else FinalElastance
         - InitialElastance));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Rectangle(
                      extent={{-64,14},{80,-32}},
                      lineThickness=1,
                      fillColor={190,0,0},
                      fillPattern=FillPattern.Solid,
                      pattern=LinePattern.None,
                      lineColor={0,0,0}),Ellipse(
                      extent={{-36,36},{52,-2}},
                      lineThickness=1,
                      fillColor={255,128,0},
                      fillPattern=FillPattern.Solid,
                      lineColor={0,0,0}),Ellipse(
                      extent={{-36,-10},{52,-48}},
                      lineThickness=1,
                      fillColor={255,128,0},
                      fillPattern=FillPattern.Solid,
                      lineColor={0,0,0}),Rectangle(
                      extent={{-64,42},{80,14}},
                      lineThickness=1,
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid,
                      pattern=LinePattern.None),Rectangle(
                      extent={{-64,-32},{80,-60}},
                      lineThickness=1,
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid,
                      pattern=LinePattern.None),Text(
                      extent={{-56,-46},{76,-58}},
                      lineColor={0,0,0},
                      lineThickness=1,
                      fillColor={255,128,0},
                      fillPattern=FillPattern.Solid,
                      textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end StenosisElastance;

    model StenosisResistance
      parameter Physiolibrary.Types.HydraulicResistance InitialResistance;
      parameter Physiolibrary.Types.HydraulicResistance FinalResistance;
      parameter Physiolibrary.Types.Time startTime(displayUnit="s") = 20;
      parameter Physiolibrary.Types.Time duration(displayUnit="s") = 5;
      Physiolibrary.Types.RealIO.HydraulicConductanceOutput conductance
        annotation (Placement(transformation(extent={{48,-10},{68,10}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={8,24})));
    equation
      conductance = 1/(InitialResistance + (if time < startTime then 0
         else if time < startTime + duration then (time - startTime)*(
        FinalResistance - InitialResistance)/duration else FinalResistance
         - InitialResistance));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Rectangle(
                      extent={{-64,14},{80,-32}},
                      lineThickness=1,
                      fillColor={190,0,0},
                      fillPattern=FillPattern.Solid,
                      pattern=LinePattern.None,
                      lineColor={0,0,0}),Ellipse(
                      extent={{-36,36},{52,-2}},
                      lineThickness=1,
                      fillColor={255,128,0},
                      fillPattern=FillPattern.Solid,
                      lineColor={0,0,0}),Ellipse(
                      extent={{-36,-10},{52,-48}},
                      lineThickness=1,
                      fillColor={255,128,0},
                      fillPattern=FillPattern.Solid,
                      lineColor={0,0,0}),Rectangle(
                      extent={{-64,42},{80,14}},
                      lineThickness=1,
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid,
                      pattern=LinePattern.None),Rectangle(
                      extent={{-64,-32},{80,-60}},
                      lineThickness=1,
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid,
                      pattern=LinePattern.None),Text(
                      extent={{-56,-46},{76,-58}},
                      lineColor={0,0,0},
                      lineThickness=1,
                      fillColor={255,128,0},
                      fillPattern=FillPattern.Solid,
                      textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end StenosisResistance;
  end Stenosis;

  model BleedingTransfusionScenario
    extends Cardiovascular.Interfaces.Controlled.ScenarioControl;
    import Physiolibrary.Types.*;
    //after 1 minute, 5minutes bleeding
    parameter Time Tbs=60, Tbd=5*60;
    parameter Volume BloodLoss=0.001;
    //after 20 minutes, transfussion for 10 minutes
    parameter Time Tts=20*60, Ttd=10*60;
    parameter Volume BloodTrans=0.001;

    BleedingTransfusionBurkhoffInterface
      bleedingTransfusionBurkhoffInterface
      annotation (Placement(transformation(extent={{-8,-36},{22,46}})));
    BleedingTransfusionRate bleedingTransfusionRate(
      Tbs=Tbs,
      Tbd=Tbd,
      BloodLoss=BloodLoss,
      Tts=Tts,
      Ttd=Ttd,
      BloodTrans=BloodTrans)
      annotation (Placement(transformation(extent={{-96,-2},{-52,40}})));
  equation

    connect(bleedingTransfusionBurkhoffInterface.hematocrit, busConnector.hematocrit)
      annotation (Line(
        points={{-0.5,17.3},{-40,17.3},{-40,90},{80,90}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(bleedingTransfusionBurkhoffInterface.RBCbleed, busConnector.RBCbleed)
      annotation (Line(
        points={{18.25,33.7},{80,33.7},{80,90}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(bleedingTransfusionBurkhoffInterface.RBCtransfusion,
      busConnector.RBCtransfusion) annotation (Line(
        points={{18.25,17.3},{80,17.3},{80,90}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(bleedingTransfusionBurkhoffInterface.plasmableed, busConnector.plasmableed)
      annotation (Line(
        points={{18.25,0.9},{80,0.9},{80,90}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(bleedingTransfusionBurkhoffInterface.plasmatransfusion,
      busConnector.plasmatransfusion) annotation (Line(
        points={{18.25,-15.5},{80,-15.5},{80,90}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(bleedingTransfusionRate.bleedrate,
      bleedingTransfusionBurkhoffInterface.bleedrate) annotation (Line(
        points={{-54.2,37.9},{-31.5,37.9},{-31.5,37.8},{-0.5,37.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bleedingTransfusionRate.transrate,
      bleedingTransfusionBurkhoffInterface.transrate) annotation (Line(
        points={{-54.2,25.72},{-54.2,-30.26},{-0.5,-30.26}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Line(
                  points={{-76,58},{-46,58},{-28,50},{-28,26},{-8,12},{4,14},
              {28,14},{50,8},{54,20},{62,60},{80,60}},
            color={0,0,255},
                  smooth=Smooth.Bezier)}), Diagram(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics));
  end BleedingTransfusionScenario;

  model BleedingTransfusionBurkhoffInterface
    //Real RBCbleed,plasmableed,RBCtransfusion,plasmatransfusion,hematocrit;

    Physiolibrary.Types.RealIO.VolumeFlowRateInput bleedrate annotation (
        Placement(transformation(extent={{-40,60},{0,100}}),
          iconTransformation(extent={{-40,60},{0,100}})));
    Physiolibrary.Types.RealIO.VolumeFlowRateInput transrate annotation (
        Placement(transformation(extent={{-40,-106},{0,-66}}),
          iconTransformation(extent={{-40,-106},{0,-66}})));

    Modelica.Blocks.Interfaces.RealInput hematocrit
      annotation (Placement(transformation(extent={{-40,10},{0,50}})));
    Modelica.Blocks.Interfaces.RealOutput RBCbleed annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-10,0}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={30,70})));
    Modelica.Blocks.Interfaces.RealOutput RBCtransfusion annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-10,-18}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={30,30})));
    Modelica.Blocks.Interfaces.RealOutput plasmableed annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-10,-38}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={30,-10})));
    Modelica.Blocks.Interfaces.RealOutput plasmatransfusion annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-10,-54}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={30,-50})));
  equation
    RBCbleed = bleedrate*hematocrit*12e12/2.4e-3;
    plasmableed = bleedrate*(1 - hematocrit);
    RBCtransfusion = transrate*0.4*12e12/2.4e-3;
    plasmatransfusion = transrate*(1 - 0.4);
  /* connect(busConnector.hematocrit,hematocrit);
 connect(busConnector.RBCbleed,RBCbleed);
 connect(busConnector.plasmableed,plasmableed);
 connect(busConnector.RBCtransfusion,RBCtransfusion);
 connect(busConnector.plasmatransfusion,plasmatransfusion);
*/
    annotation (Diagram(coordinateSystem(extent={{-40,-100},{40,100}},
            preserveAspectRatio=false), graphics), Icon(coordinateSystem(
            extent={{-40,-100},{40,100}}, preserveAspectRatio=false),
          graphics={Rectangle(
            extent={{-20,100},{20,-100}},
            lineColor={0,0,255},
            fillPattern=FillPattern.Solid,
            fillColor={0,0,255})}));
  end BleedingTransfusionBurkhoffInterface;

  model BleedingTransfusionRate
    import Physiolibrary.Types.*;
    //after 1 minute, 5minutes bleeding
    parameter Time Tbs=60, Tbd=5*60;
    parameter Volume BloodLoss=0.001;
    //after 20 minutes, transfussion for 10 minutes
    parameter Time Tts=20*60, Ttd=10*60;
    parameter Volume BloodTrans=0.001;

    Physiolibrary.Types.RealIO.VolumeFlowRateOutput bleedrate annotation (
        Placement(transformation(extent={{80,80},{100,100}}),
          iconTransformation(extent={{80,80},{100,100}})));
    Physiolibrary.Types.RealIO.VolumeFlowRateOutput transrate annotation (
        Placement(transformation(extent={{80,22},{100,42}}),
          iconTransformation(extent={{80,22},{100,42}})));
  equation
    if time > Tbs and time < Tbs + Tbd then
      bleedrate = BloodLoss/Tbd;
    else
      bleedrate = 0;
    end if;
    if time > Tts and time < Tts + Ttd then
      transrate = BloodTrans/Ttd;
    else
      transrate = 0;
    end if;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Line(
            points={{-80,80},{-80,-80}},
      color={0,0,255},
                  smooth=Smooth.None),Line(
            points={{80,-80},{-80,-80}},
            color={0,0,255},
                  smooth=Smooth.None),Line(
                  points={{-76,58},{-46,58},{-28,50},{-28,26},{-8,12},{4,14},
              {28,14},{50,8},{54,20},{62,60},{80,60}},
            color={0,0,255},
                  smooth=Smooth.Bezier),Text(
            extent={{-100,-80},{100,-100}},
            lineColor={0,0,255},
                  textString="%name"),Line(
            points={{-28,38},{80,90}},
            color={0,0,255},
                  smooth=Smooth.None),Line(
            points={{56,32},{82,32},{80,32}},
            color={0,0,255},
            smooth=Smooth.None)}));
  end BleedingTransfusionRate;
end Scenario;
