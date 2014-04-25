within ;
package FernandezModel
  package Parts



    model pulsos "generates relative position in heart period from 0 to 1"
      discrete Physiolibrary.Types.Time HP(start = 0)
        "heart period - duration of cardiac cycle";
      Boolean b(start = false);
      Physiolibrary.Types.RealIO.TimeOutput T0 "start time of cardiac cycle";
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
            transformation(extent={{-158,20},{-118,60}}), iconTransformation(extent=
               {{-88,-32},{-48,8}})));
      Modelica.Blocks.Interfaces.RealOutput heartphase annotation (Placement(transformation(
              extent={{-162,64},{-142,84}}), iconTransformation(extent={{72,-24},{92,
                -4}})));
    equation
      b = time - pre(T0) >= pre(HP);
      when {initial(),b} then
        T0 = time;
        HP = 1 / HR;
      end when;
      heartphase = (time - pre(T0))/pre(HP);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Ellipse(extent={{-46,52},{68,-78}},
                lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,170,170})}),
                                        Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end pulsos;

    model Baroreceptor
      Modelica.Blocks.Continuous.TransferFunction H1(a={15,1}, b={1});
      Modelica.Blocks.Continuous.TransferFunction H2(a={15,1}, b={0.048});
      Modelica.Blocks.Continuous.TransferFunction H3(a={30,1}, b={0.194});
      Modelica.Blocks.Continuous.TransferFunction H4(a={2,1}, b={0.1});
      Modelica.Blocks.Nonlinear.DeadZone deadZone(uMax=13.3, uMin=-13.3);
      parameter Physiolibrary.Types.Pressure PAOmedia=13863.981751466;

      parameter Physiolibrary.Types.Frequency HR0Param=1.3333333333333
        annotation (Dialog(enable=not useConductanceInput));
      parameter Boolean useHRInput = false
        "=true, if external HR value is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
      Physiolibrary.Types.RealIO.FrequencyInput cond(start=HR0Param)=HR0 if useHRInput annotation (Placement(
            transformation(extent={{-62,36},{-22,76}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-10,40})));

      Physiolibrary.Types.RealIO.PressureInput PAo "pressure in aorta" annotation (
          Placement(transformation(extent={{2,-58},{42,-18}}),
            iconTransformation(extent={{-20,-20},{20,20}},
            rotation=90,
            origin={38,-44})));
      Physiolibrary.Types.RealIO.FrequencyOutput HR
        "heart rate - compatible with Const block" annotation (Placement(
            transformation(extent={{-76,60},{-56,80}}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=270,
            origin={-35,-55})));
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput evright annotation (
          Placement(transformation(extent={{80,22},{100,42}}), iconTransformation(
              extent={{-14,-14},{14,14}},
            rotation=270,
            origin={-80,-58})));
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput evleft annotation (
          Placement(transformation(extent={{78,-18},{98,2}}), iconTransformation(
              extent={{-16,-16},{16,16}},
            rotation=270,
            origin={6,-56})));
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput evenacava annotation (
          Placement(transformation(extent={{78,-54},{98,-34}}), iconTransformation(
              extent={{-16,-16},{16,16}},
            rotation=180,
            origin={-112,4})));
      Physiolibrary.Types.RealIO.HydraulicConductanceOutput RS annotation (
          Placement(transformation(extent={{80,-90},{100,-70}}), iconTransformation(
              extent={{-14,-14},{14,14}},
            rotation=0,
            origin={82,12})));
      parameter Physiolibrary.Types.HydraulicElastance EV0right=106657909.932, EV0left=103991462.1837;
    /*    PAOmedia=13465.561128915,
    EV0right=106657909.932,
    EV0left=103991462.1837,
    EV0venacava=4.5003694550739e-09
    
    PAOmedia=13465.561128915,
    EV0right=106657909.932,
    EV0left=103991462.1837,
    EV0venacava=1.8751539396141e-06,
    RS0(displayUnit="ml/(mmHg.s)") = 4.6016277678131e-09)*/
      parameter Physiolibrary.Types.HydraulicCompliance EV0venacava=1/533289.54966;
      parameter Physiolibrary.Types.HydraulicResistance RS0(displayUnit="(mmHg.s)/ml") = 106657909.932;

    //  parameter Physiolibrary.Types.HydraulicConductance Conductance=0
    protected
      Physiolibrary.Types.Frequency HR0;
    equation
      if not useHRInput then
        HR0=HR0Param;
      end if;
      deadZone.u=(PAOmedia-PAo)/133.322387415;
      H1.u =deadZone.y;
      HR = (HR0*60+H1.y)/60; //recount to SI Hz
      H2.u = deadZone.y;
      evright = 1/(EV0right + H2.y*(1e+6)*(133.322387415)); //recount to SI
      evleft = 1/(EV0left + H2.y*(1e+6)*(133.322387415)); //recount to SI
      H3.u = deadZone.y;
      evenacava = 1/(1/EV0venacava + H3.y*(1e+6)*(133.322387415));
      H4.u = deadZone.y;
      RS = 1/(RS0+ H4.y*(1e+6)*(133.322387415)); //recount to conductance
      connect(evenacava, evenacava) annotation (Line(
          points={{88,-44},{90,-44},{90,-44},{88,-44}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={
            Ellipse(
              extent={{56,22},{-72,-30}},
              lineColor={0,0,127},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-48,-16},{-24,-40}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="HR"),
            Text(
              extent={{-116,-24},{-44,-42}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="EVright"),
            Text(
              extent={{-36,-22},{50,-40}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="EVleft"),
            Text(
              extent={{-116,16},{-2,0}},
              lineColor={0,0,127},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid,
              textString="EVenaCava"),
            Text(
              extent={{14,22},{88,2}},
              lineColor={0,0,127},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid,
              textString="RS"),
            Text(
              extent={{-16,26},{8,2}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="HR"),
            Text(
              extent={{24,-8},{48,-26}},
              lineColor={0,0,127},
              textString="PAo")}),Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end Baroreceptor;

    model combitable

      Physiolibrary.Blocks.Interpolation.Curve curve(
        x={0,0.0625,0.125,0.1875,0.25,0.3125,0.375,0.4375,1},
        y={0.0066,0.16,0.32,0.45,0.625,0.78,0.27,0.0066,0.0066},
        slope={0,0,2.32,2.44,2.64,-2.84,-6.1872,0,0})
        annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
      Modelica.Blocks.Interfaces.RealInput phaseInput annotation (Placement(
            transformation(extent={{-98,-26},{-58,14}}), iconTransformation(extent={
                {-98,-26},{-58,14}})));
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput hydrauliccompliance
        annotation (Placement(transformation(extent={{82,2},{102,22}}),
            iconTransformation(extent={{62,-18},{102,22}})));
      Cardiovascular.Types.RealIO.HydraulicElastanceToCompliance
        hydrauliccompliance1
        annotation (Placement(transformation(extent={{26,0},{34,8}})));
    equation
      connect(phaseInput, curve.u) annotation (Line(
          points={{-78,-6},{-48,-6},{-48,0},{-18,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(curve.val, hydrauliccompliance1.hydraulicelastance) annotation (
          Line(
          points={{2,0},{14,0},{14,3.9},{25.9,3.9}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydrauliccompliance1.y, hydrauliccompliance) annotation (Line(
          points={{35,4},{60,4},{60,12},{92,12}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={Rectangle(
              extent={{-62,42},{62,-62}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,170}), Line(
              points={{-56,-50},{-48,-32},{-32,12},{-18,28},{-12,24},{-12,-16},
                  {-10,-46},{-10,-50},{58,-50}},
              color={0,0,255},
              smooth=Smooth.None)}),      Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end combitable;

    model ventriculo "right ventricle"

      pulsos pulsos1(HP(displayUnit="s", start=1))
        annotation (Placement(transformation(extent={{-72,42},{-52,62}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel ventricle(
        useComplianceInput=true,
        useV0Input=false,
        useExternalPressureInput=false,
        volume_start=0.00015,
        ZeroPressureVolume=0)
        annotation (Placement(transformation(extent={{-8,-24},{12,-4}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow
        annotation (Placement(transformation(extent={{-88,-30},{-68,-10}}),
            iconTransformation(extent={{-26,-8},{-6,12}})));
      Cardiovascular.Hydraulic.Components.CardiacValve cardiacValve
        annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
      Modelica.Blocks.Math.Product product1 annotation (Placement(
            transformation(
            extent={{-5,-5},{5,5}},
            rotation=270,
            origin={1,23})));
      Modelica.Blocks.Sources.Constant const(k=0.87)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-12,84})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{22,-24},{42,-4}}),iconTransformation(
              extent={{30,50},{50,70}})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput maxelastance annotation (
          Placement(transformation(extent={{-104,4},{-64,44}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={6,68})));
      Physiolibrary.Types.RealIO.FrequencyInput heartRate annotation (Placement(
            transformation(extent={{-120,32},{-80,72}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-36,68})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst backflowConductance(k=0)
        annotation (Placement(transformation(extent={{-52,-4},{-44,4}})));
      combitable combitable1
        annotation (Placement(transformation(extent={{-36,56},{-16,76}})));
      Modelica.Blocks.Math.Product product2 annotation (Placement(
            transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-19,31})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst
        hydraulicResistance(k(displayUnit="(mmHg.s)/ml") = 399967.162245)
        annotation (Placement(transformation(extent={{-42,12},{-34,20}})));
    equation
      connect(const.y, product1.u1) annotation (Line(
          points={{-1,84},{4,84},{4,29}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartRate, pulsos1.HR) annotation (Line(
          points={{-100,52},{-86,52},{-86,50.8},{-68.8,50.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, ventricle.compliance) annotation (Line(
          points={{1,17.5},{1,13.75},{2,13.75},{2,-6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(maxelastance, product2.u2) annotation (Line(
          points={{-84,24},{-58,24},{-58,28},{-25,28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product2.y, product1.u2) annotation (Line(
          points={{-13.5,31},{-9.75,31},{-9.75,29},{-2,29}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulsos1.heartphase, combitable1.phaseInput) annotation (Line(
          points={{-53.8,50.6},{-43.9,50.6},{-43.9,65.4},{-33.8,65.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product2.u1, combitable1.hydrauliccompliance) annotation (Line(
          points={{-25,34},{-34,34},{-34,52},{-12,52},{-12,66.2},{-17.8,66.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricle.q_in, outflow) annotation (Line(
          points={{2,-14},{32,-14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(cardiacValve.inflow, inflow) annotation (Line(
          points={{-39.8,-20.2},{-59.9,-20.2},{-59.9,-20},{-78,-20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(cardiacValve.outflow, ventricle.q_in) annotation (Line(
          points={{-20,-20},{-10,-20},{-10,-14},{2,-14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(backflowConductance.y, cardiacValve.backflowConductance)
        annotation (Line(
          points={{-43,0},{-40,0},{-40,-12.4},{-37.4,-12.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(hydraulicResistance.y, cardiacValve.outflowResistance)
        annotation (Line(
          points={{-33,16},{-26,16},{-26,-11.2},{-24.8,-11.2}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end ventriculo;

    model RightHeart
      extends ventriculo(hydraulicResistance(k=1706526.558912));
      extends Physiolibrary.Icons.RightHeart;
    end RightHeart;

    model LeftHeart
      extends ventriculo( combitable1(curve(y={0.0033,0.41,0.63,0.73,0.8,0.76,
                0.25,0.0033,0.0033}, slope={0,5.0136,2.56,1.36,0.24,-4.4,-6.0536,
                0,0})),
        hydraulicResistance(k=7839356.380002),
        const(k=0.8));
      extends Physiolibrary.Icons.LeftHeart;
    end LeftHeart;

    model Heart
      extends Physiolibrary.Icons.Heart;
    //  extends Physiolibrary.Icons.RightHeart;

      RightHeart rightHeart
        annotation (Placement(transformation(extent={{-52,-32},{-2,24}})));
      LeftHeart leftHeart
        annotation (Placement(transformation(extent={{-12,-32},{30,16}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rightHeartInflow
        annotation (Placement(transformation(extent={{-86,-32},{-58,-4}}),
            iconTransformation(extent={{-58,-26},{-38,-6}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b rightHeartOutflow
        annotation (Placement(transformation(extent={{-30,44},{0,74}}),
            iconTransformation(extent={{-50,32},{-30,52}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a leftHeartInflow
        annotation (Placement(transformation(extent={{16,-40},{46,-10}}),
            iconTransformation(extent={{20,30},{40,50}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b leftHeartOutflow
        annotation (Placement(transformation(extent={{78,-14},{108,16}}),
            iconTransformation(extent={{24,-28},{44,-8}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst ERMAX(k=
            103991462.1837)
        annotation (Placement(transformation(extent={{-54,50},{-38,66}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst ELMAX(k=
            106657909.932)
        annotation (Placement(transformation(extent={{14,64},{38,82}})));
      Physiolibrary.Types.Constants.FrequencyConst heartRate(k=1.2)
        annotation (Placement(transformation(extent={{-96,30},{-78,44}})));
      Cardiovascular.Hydraulic.Components.FlowPressureMeasurement
        flowPressureMeasurement
        annotation (Placement(transformation(extent={{46,16},{66,36}})));
    equation
      connect(rightHeartInflow, rightHeart.inflow) annotation (Line(
          points={{-72,-18},{-50,-18},{-50,-3.44},{-31,-3.44}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.outflow, rightHeartOutflow) annotation (Line(
          points={{-17,12.8},{-17,25.4},{-15,25.4},{-15,59}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeartInflow, leftHeart.inflow) annotation (Line(
          points={{31,-25},{31,-7.52},{5.64,-7.52}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ERMAX.y, rightHeart.maxelastance) annotation (Line(
          points={{-36,58},{-32,58},{-32,15.04},{-25.5,15.04}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ELMAX.y, leftHeart.maxelastance) annotation (Line(
          points={{41,73},{41,42.5},{10.26,42.5},{10.26,8.32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartRate.y, rightHeart.heartRate) annotation (Line(
          points={{-75.75,37},{-36,37},{-36,15.04}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartRate.y, leftHeart.heartRate) annotation (Line(
          points={{-75.75,37},{-75.75,88},{1.44,88},{1.44,8.32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftHeart.outflow, flowPressureMeasurement.q_in) annotation (Line(
          points={{17.4,6.4},{17.4,26},{46,26}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(flowPressureMeasurement.q_out, leftHeartOutflow) annotation (Line(
          points={{66,26},{93,26},{93,1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(flowPressureMeasurement.HR, leftHeart.heartRate) annotation (Line(
          points={{56,32.6},{56,88},{1.44,88},{1.44,8.32}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end Heart;

    model sistemapulmonararterial
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-106,-10},{-86,10}}),
            iconTransformation(extent={{-104,-12},{-84,8}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{86,-12},{106,8}}),
            iconTransformation(extent={{88,-10},{108,10}})));
      Cardiovascular.Hydraulic.Components.CardiacValve cardiacValve
        annotation (Placement(transformation(extent={{-72,-8},{-52,12}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArteries(
        useComplianceInput=true,
        volume_start=0.00012,
        ZeroPressureVolume=0)
        annotation (Placement(transformation(extent={{-30,-6},{-10,14}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst
        hydraulicConductance(k=0)
        annotation (Placement(transformation(extent={{-94,34},{-76,48}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        hydraulicElastance2Compliance(k=17771874.242419)
        annotation (Placement(transformation(extent={{-42,54},{-26,68}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst
        hydraulicResistance(k(displayUnit="(mmHg.s)/ml") = 1479878.5003065)
        annotation (Placement(transformation(extent={{-90,64},{-74,80}})));
    equation
      connect(pulmonaryArteries.q_in, outflow) annotation (Line(
          points={{-20,4},{40,4},{40,-2},{96,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(hydraulicElastance2Compliance.y, pulmonaryArteries.compliance)
        annotation (Line(
          points={{-24,61},{-20,61},{-20,12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicResistance.y, cardiacValve.outflowResistance)
        annotation (Line(
          points={{-72,72},{-64,72},{-64,10.8},{-56.8,10.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicConductance.y, cardiacValve.backflowConductance)
        annotation (Line(
          points={{-73.75,41},{-73.75,25.5},{-69.4,25.5},{-69.4,9.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(inflow, cardiacValve.inflow) annotation (Line(
          points={{-96,0},{-84,0},{-84,1.8},{-71.8,1.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(cardiacValve.outflow, pulmonaryArteries.q_in) annotation (Line(
          points={{-52,2},{-36,2},{-36,4},{-20,4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Rectangle(
              extent={{-78,20},{84,-30}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-76,-38},{86,-56}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid,
              textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end sistemapulmonararterial;

    model sistemapulmonarvenoso
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-104,-12},{-84,8}}),
            iconTransformation(extent={{-106,-10},{-86,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{88,-12},{108,8}}),
            iconTransformation(extent={{84,-14},{104,6}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{22,-10},{42,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins(
          useComplianceInput=true, volume_start=0.00024)
        annotation (Placement(transformation(extent={{62,-8},{82,12}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        hydraulicElastance2Compliance(k=4399638.784695)
        annotation (Placement(transformation(extent={{48,30},{72,52}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst
        hydraulicConductance(k(displayUnit="ml/(mmHg.s)") = 5.2504310309196e-08)
        annotation (Placement(transformation(extent={{-2,38},{18,54}})));
    equation
      connect(hydraulicElastance2Compliance.y, pulmonaryVeins.compliance)
        annotation (Line(
          points={{75,41},{75,19.5},{72,19.5},{72,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicConductance.y, conductor.cond) annotation (Line(
          points={{20.5,46},{20.5,26},{32,26},{32,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inflow, conductor.q_in) annotation (Line(
          points={{-94,-2},{-36,-2},{-36,0},{22,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(conductor.q_out, pulmonaryVeins.q_in) annotation (Line(
          points={{42,0},{58,0},{58,2},{72,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryVeins.q_in, outflow) annotation (Line(
          points={{72,2},{86,2},{86,-2},{98,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Rectangle(
              extent={{-76,30},{82,-38}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid), Text(
              extent={{-98,-42},{102,-56}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid,
              textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end sistemapulmonarvenoso;

    model PulmonaryCirculation
      extends Physiolibrary.Icons.PulmonaryCirculation;
      sistemapulmonararterial sistemapulmonararterial1
        annotation (Placement(transformation(extent={{-62,-10},{-42,10}})));
      sistemapulmonarvenoso sistemapulmonarvenoso1
        annotation (Placement(transformation(extent={{22,-10},{42,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-90,-10},{-70,10}}), iconTransformation(
              extent={{-108,-12},{-88,8}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{70,-12},{90,8}}), iconTransformation(
              extent={{90,-10},{110,10}})));
    equation
      connect(inflow, sistemapulmonararterial1.inflow) annotation (Line(
          points={{-80,0},{-70,0},{-70,-0.2},{-61.4,-0.2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(sistemapulmonararterial1.outflow, sistemapulmonarvenoso1.inflow)
        annotation (Line(
          points={{-42.2,0},{22.4,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(sistemapulmonarvenoso1.outflow, outflow) annotation (Line(
          points={{41.4,-0.4},{60.7,-0.4},{60.7,-2},{80,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end PulmonaryCirculation;

    model arteriaaorta
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-102,-10},{-82,10}}),
            iconTransformation(extent={{84,-10},{104,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{86,-6},{106,14}}),
            iconTransformation(extent={{-102,-10},{-82,10}})));
      Cardiovascular.Hydraulic.Components.CardiacValve cardiacValve
        annotation (Placement(transformation(extent={{-62,2},{-42,22}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
        useComplianceInput=true,
        volume_start=0.0001,
        ZeroPressureVolume=0)
        annotation (Placement(transformation(extent={{-20,4},{0,24}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst
        hydraulicConductance(k=0)
        annotation (Placement(transformation(extent={{-84,52},{-66,66}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        hydraulicElastance2Compliance(k=106657909.932)
        annotation (Placement(transformation(extent={{-32,72},{-16,86}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst
        hydraulicResistance(k(displayUnit="(mmHg.s)/ml") = 1666529.8426875)
        annotation (Placement(transformation(extent={{-80,82},{-64,98}})));
    equation
      connect(hydraulicElastance2Compliance.y, arteries.compliance) annotation (
         Line(
          points={{-14,79},{-10,79},{-10,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicResistance.y, cardiacValve.outflowResistance)
        annotation (Line(
          points={{-62,90},{-54,90},{-54,20.8},{-46.8,20.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicResistance.y, cardiacValve.outflowResistance)
        annotation (Line(
          points={{-62,90},{-54,90},{-54,20.8},{-46.8,20.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicConductance.y, cardiacValve.backflowConductance)
        annotation (Line(
          points={{-63.75,59},{-63.75,39.5},{-59.4,39.5},{-59.4,19.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(inflow, cardiacValve.inflow) annotation (Line(
          points={{-92,0},{-78,0},{-78,11.8},{-61.8,11.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(cardiacValve.outflow, arteries.q_in) annotation (Line(
          points={{-42,12},{-26,12},{-26,14},{-10,14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(arteries.q_in, outflow) annotation (Line(
          points={{-10,14},{44,14},{44,4},{96,4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Rectangle(
              extent={{-76,16},{78,-20}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid), Text(
              extent={{-74,-22},{98,-44}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid,
              textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end arteriaaorta;

    model circulatorosystemica
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-30,-10},{-10,10}}),
            iconTransformation(extent={{-106,-10},{-86,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{88,-12},{108,8}}),
            iconTransformation(extent={{84,-14},{104,6}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{12,-10},{32,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel systemicvessels(
        useComplianceInput=true,
        volume_start=0.00334,
        ZeroPressureVolume=0)
        annotation (Placement(transformation(extent={{58,-8},{78,12}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        hydraulicElastance2Compliance(k=2039832.5274495)
        annotation (Placement(transformation(extent={{46,26},{70,48}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst systemicResistance(k(
            displayUnit="ml/(mmHg.s)") = 1.2226003686284e-08)
        annotation (Placement(transformation(extent={{0,32},{20,48}})));
    equation
      connect(hydraulicElastance2Compliance.y, systemicvessels.compliance)
        annotation (Line(
          points={{73,37},{73,15.5},{68,15.5},{68,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inflow, conductor.q_in) annotation (Line(
          points={{-20,0},{12,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(conductor.q_out, systemicvessels.q_in) annotation (Line(
          points={{32,0},{50,0},{50,2},{68,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicvessels.q_in, outflow) annotation (Line(
          points={{68,2},{82,2},{82,-2},{98,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicResistance.y, conductor.cond) annotation (Line(
          points={{22.5,40},{22.5,23},{22,23},{22,6}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Rectangle(
              extent={{-76,30},{82,-38}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid), Text(
              extent={{-98,-42},{102,-56}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid,
              textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end circulatorosystemica;

    model venacava
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-104,-12},{-84,8}}),
            iconTransformation(extent={{-106,-10},{-86,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{88,-12},{108,8}}),
            iconTransformation(extent={{84,-14},{104,6}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{22,-10},{42,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel venacava(
          useComplianceInput=true, volume_start=0.0005)
        annotation (Placement(transformation(extent={{60,-8},{80,12}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        hydraulicElastance2Compliance(k=533289.54966)
        annotation (Placement(transformation(extent={{46,36},{70,58}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst
        hydraulicConductance(k(displayUnit="ml/(mmHg.s)") = 1.2376016001453e-08)
        annotation (Placement(transformation(extent={{-2,38},{18,54}})));
    equation
      connect(hydraulicElastance2Compliance.y, venacava.compliance) annotation (
         Line(
          points={{73,47},{73,25.5},{70,25.5},{70,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicConductance.y, conductor.cond) annotation (Line(
          points={{20.5,46},{20.5,26},{32,26},{32,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(outflow, venacava.q_in) annotation (Line(
          points={{98,-2},{86,-2},{86,2},{70,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(venacava.q_in, conductor.q_out) annotation (Line(
          points={{70,2},{56,2},{56,0},{42,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(conductor.q_in, inflow) annotation (Line(
          points={{22,0},{-36,0},{-36,-2},{-94,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Rectangle(
              extent={{-76,30},{82,-38}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid), Text(
              extent={{-98,-42},{102,-56}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid,
              textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end venacava;

    model SystemicCirculation
    extends Physiolibrary.Icons.SystemicCirculation;
      arteriaaorta arteriaaorta1
        annotation (Placement(transformation(extent={{48,-26},{76,12}})));
      circulatorosystemica circulatorosystemica1 annotation (Placement(
            transformation(
            extent={{-15,-21},{15,21}},
            rotation=180,
            origin={15,-7})));
      venacava venacava1 annotation (Placement(transformation(
            extent={{-17,-15},{17,15}},
            rotation=180,
            origin={-35,-7})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{86,-10},{106,10}}), iconTransformation(
              extent={{84,-8},{104,12}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{-92,-10},{-72,10}}), iconTransformation(
              extent={{-102,-10},{-82,10}})));
    equation
      connect(inflow, arteriaaorta1.inflow) annotation (Line(
          points={{96,0},{86,0},{86,-7},{75.16,-7}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(arteriaaorta1.outflow, circulatorosystemica1.inflow) annotation (Line(
          points={{49.12,-7},{29.4,-7}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(circulatorosystemica1.outflow, venacava1.inflow) annotation (Line(
          points={{0.9,-6.16},{-3.7,-6.16},{-3.7,-7},{-18.68,-7}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(venacava1.outflow, outflow) annotation (Line(
          points={{-50.98,-6.4},{-59.7,-6.4},{-59.7,0},{-82,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end SystemicCirculation;

    model Heart_controllable
      extends Heart;
      Cardiovascular.Types.RealIO.HydraulicElastanceInput ERMax annotation (
          Placement(transformation(extent={{58,28},{98,68}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-20,50})));
      Cardiovascular.Types.RealIO.HydraulicElastanceInput hydraulicelastance1
        annotation (Placement(transformation(extent={{64,-20},{104,20}}),
            iconTransformation(
            extent={{-9,-9},{9,9}},
            rotation=270,
            origin={17,51})));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end Heart_controllable;

    model Heart_controllable2
      extends Physiolibrary.Icons.Heart;
    //  extends Physiolibrary.Icons.RightHeart;

      RightHeart rightHeart
        annotation (Placement(transformation(extent={{-52,-32},{-2,24}})));
      LeftHeart leftHeart
        annotation (Placement(transformation(extent={{-12,-32},{30,16}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rightHeartInflow
        annotation (Placement(transformation(extent={{-86,-32},{-58,-4}}),
            iconTransformation(extent={{-70,-24},{-50,-4}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b rightHeartOutflow
        annotation (Placement(transformation(extent={{-30,44},{0,74}}),
            iconTransformation(extent={{-70,26},{-50,46}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a leftHeartInflow
        annotation (Placement(transformation(extent={{16,-40},{46,-10}}),
            iconTransformation(extent={{40,10},{60,30}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b leftHeartOutflow
        annotation (Placement(transformation(extent={{78,-14},{108,16}}),
            iconTransformation(extent={{16,-42},{36,-22}})));
      Cardiovascular.Hydraulic.Components.FlowPressureMeasurement
        flowPressureMeasurement
        annotation (Placement(transformation(extent={{46,16},{66,36}})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput ERMax annotation (
          Placement(transformation(extent={{-74,34},{-34,74}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-38,52})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput ELMax annotation (
          Placement(transformation(extent={{-12,52},{28,92}}),  iconTransformation(
            extent={{-9,-9},{9,9}},
            rotation=270,
            origin={17,55})));
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
            transformation(extent={{-116,18},{-76,58}}), iconTransformation(
            extent={{-11,-11},{11,11}},
            rotation=270,
            origin={-7,45})));
      Physiolibrary.Types.RealIO.PressureOutput pressure annotation (Placement(
            transformation(extent={{46,-16},{66,4}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={48,44})));
    equation
      connect(rightHeartInflow, rightHeart.inflow) annotation (Line(
          points={{-72,-18},{-50,-18},{-50,-3.44},{-31,-3.44}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.outflow, rightHeartOutflow) annotation (Line(
          points={{-17,12.8},{-17,25.4},{-15,25.4},{-15,59}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeartInflow, leftHeart.inflow) annotation (Line(
          points={{31,-25},{31,-7.52},{5.64,-7.52}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.outflow, flowPressureMeasurement.q_in) annotation (Line(
          points={{17.4,6.4},{17.4,26},{46,26}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(flowPressureMeasurement.q_out, leftHeartOutflow) annotation (Line(
          points={{66,26},{93,26},{93,1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(HR, rightHeart.heartRate) annotation (Line(
          points={{-96,38},{-67,38},{-67,15.04},{-36,15.04}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HR, leftHeart.heartRate) annotation (Line(
          points={{-96,38},{-68,38},{-68,90},{1.44,90},{1.44,8.32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowPressureMeasurement.HR, leftHeart.heartRate) annotation (Line(
          points={{56,32.6},{54,32.6},{54,90},{1.44,90},{1.44,8.32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ELMax, leftHeart.maxelastance) annotation (Line(
          points={{8,72},{10.26,72},{10.26,8.32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ERMax, rightHeart.maxelastance) annotation (Line(
          points={{-54,54},{-42,54},{-42,52},{-25.5,52},{-25.5,15.04}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowPressureMeasurement.Pmean, pressure) annotation (Line(
          points={{52.2,23},{52.2,10.5},{56,10.5},{56,-6}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end Heart_controllable2;

    model circulatorosystemica_controllable
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-30,-10},{-10,10}}),
            iconTransformation(extent={{-106,-10},{-86,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{88,-12},{108,8}}),
            iconTransformation(extent={{84,-14},{104,6}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{12,-10},{32,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel systemicvessels(
        useComplianceInput=true,
        volume_start=0.00334,
        ZeroPressureVolume=0)
        annotation (Placement(transformation(extent={{58,-8},{78,12}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        hydraulicElastance2Compliance(k=2039832.5274495)
        annotation (Placement(transformation(extent={{46,26},{70,48}})));
      Physiolibrary.Types.RealIO.HydraulicConductanceInput RSO annotation (
          Placement(transformation(extent={{-36,34},{4,74}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-6,48})));
    equation
      connect(hydraulicElastance2Compliance.y, systemicvessels.compliance)
        annotation (Line(
          points={{73,37},{73,15.5},{68,15.5},{68,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inflow, conductor.q_in) annotation (Line(
          points={{-20,0},{12,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(conductor.q_out, systemicvessels.q_in) annotation (Line(
          points={{32,0},{50,0},{50,2},{68,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicvessels.q_in, outflow) annotation (Line(
          points={{68,2},{82,2},{82,-2},{98,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RSO, conductor.cond) annotation (Line(
          points={{-16,54},{22,54},{22,6}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics={Rectangle(
              extent={{-76,30},{82,-38}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid), Text(
              extent={{-98,-42},{102,-56}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{-34,24},{26,16}},
              lineColor={0,0,127},
              textString="RSO")}),   Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end circulatorosystemica_controllable;

    model venacava_controllable
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-104,-12},{-84,8}}),
            iconTransformation(extent={{-106,-10},{-86,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{88,-12},{108,8}}),
            iconTransformation(extent={{84,-14},{104,6}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{22,-10},{42,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel venacava(
          useComplianceInput=true, volume_start=0.0005)
        annotation (Placement(transformation(extent={{60,-8},{80,12}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst
        hydraulicConductance(k(displayUnit="ml/(mmHg.s)") = 1.2376016001453e-08)
        annotation (Placement(transformation(extent={{-2,38},{18,54}})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput hydrauliccompliance
        annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={50,56}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,50})));
    equation
      connect(hydraulicConductance.y, conductor.cond) annotation (Line(
          points={{20.5,46},{20.5,26},{32,26},{32,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(outflow, venacava.q_in) annotation (Line(
          points={{98,-2},{86,-2},{86,2},{70,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(venacava.q_in, conductor.q_out) annotation (Line(
          points={{70,2},{56,2},{56,0},{42,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(conductor.q_in, inflow) annotation (Line(
          points={{22,0},{-36,0},{-36,-2},{-94,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(hydrauliccompliance, venacava.compliance) annotation (Line(
          points={{50,56},{50,34},{70,34},{70,10}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics={Rectangle(
              extent={{-76,30},{82,-38}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid), Text(
              extent={{-98,-42},{102,-56}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{-30,26},{38,14}},
              lineColor={0,0,127},
              textString="EVenaCava")}),
                                     Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end venacava_controllable;

    model SystemicCirculation_controllable
    extends Physiolibrary.Icons.SystemicCirculation;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{86,-10},{106,10}}), iconTransformation(
              extent={{84,-8},{104,12}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{-92,-10},{-72,10}}), iconTransformation(
              extent={{-102,-10},{-82,10}})));
      venacava_controllable venacava_controllable1
        annotation (Placement(transformation(extent={{-22,-14},{-40,6}})));
      circulatorosystemica_controllable circulatorosystemica_controllable1
        annotation (Placement(transformation(extent={{24,-14},{4,6}})));
      Physiolibrary.Types.RealIO.HydraulicConductanceInput RSO annotation (
          Placement(transformation(extent={{-22,12},{18,52}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={72,60})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput EVenaCava annotation
        (Placement(transformation(extent={{-92,16},{-52,56}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-74,58})));
      arteriaaorta_controllable arteriaaorta_controllable1
        annotation (Placement(transformation(extent={{44,-14},{64,6}})));
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
            transformation(extent={{12,12},{52,52}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-18,64})));
      Physiolibrary.Types.RealIO.PressureOutput Pmean annotation (Placement(
            transformation(extent={{72,22},{92,42}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={40,60})));
    equation
      connect(venacava_controllable1.outflow, outflow) annotation (Line(
          points={{-39.46,-4.4},{-59.73,-4.4},{-59.73,0},{-82,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(venacava_controllable1.inflow, circulatorosystemica_controllable1.outflow)
        annotation (Line(
          points={{-22.36,-4},{-8,-4},{-8,-4.4},{4.6,-4.4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RSO, circulatorosystemica_controllable1.RSO) annotation (Line(
          points={{-2,32},{24,32},{24,0.8},{14.6,0.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(EVenaCava, venacava_controllable1.hydrauliccompliance)
        annotation (Line(
          points={{-72,36},{-52,36},{-52,34},{-31,34},{-31,1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(circulatorosystemica_controllable1.inflow,
        arteriaaorta_controllable1.outflow) annotation (Line(
          points={{23.6,-4},{44.8,-4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(arteriaaorta_controllable1.inflow, inflow) annotation (Line(
          points={{63.4,-4},{80,-4},{80,0},{96,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(arteriaaorta_controllable1.HR, HR) annotation (Line(
          points={{54,-0.4},{50,-0.4},{50,32},{32,32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(arteriaaorta_controllable1.Pmean, Pmean) annotation (Line(
          points={{60.6,-1.2},{60.6,32.4},{82,32.4},{82,32}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end SystemicCirculation_controllable;

    model arteriaaorta_controllable
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-102,-10},{-82,10}}),
            iconTransformation(extent={{84,-10},{104,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{86,-6},{106,14}}),
            iconTransformation(extent={{-102,-10},{-82,10}})));
      Cardiovascular.Hydraulic.Components.CardiacValve cardiacValve
        annotation (Placement(transformation(extent={{-62,2},{-42,22}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
        useComplianceInput=true,
        volume_start=0.0001,
        ZeroPressureVolume=0)
        annotation (Placement(transformation(extent={{-20,4},{0,24}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst
        hydraulicConductance(k=0)
        annotation (Placement(transformation(extent={{-84,52},{-66,66}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        hydraulicElastance2Compliance(k=106657909.932)
        annotation (Placement(transformation(extent={{-32,72},{-16,86}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst
        hydraulicResistance(k(displayUnit="(mmHg.s)/ml") = 1666529.8426875)
        annotation (Placement(transformation(extent={{-80,82},{-64,98}})));
      Cardiovascular.Hydraulic.Components.FlowPressureMeasurement
        flowPressureMeasurement
        annotation (Placement(transformation(extent={{12,2},{32,22}})));
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
            transformation(extent={{-14,18},{26,58}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,36})));
      Physiolibrary.Types.RealIO.PressureOutput Pmean annotation (Placement(
            transformation(extent={{28,-26},{48,-6}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={66,28})));
    equation
      connect(hydraulicElastance2Compliance.y, arteries.compliance) annotation (
         Line(
          points={{-14,79},{-10,79},{-10,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicResistance.y, cardiacValve.outflowResistance)
        annotation (Line(
          points={{-62,90},{-54,90},{-54,20.8},{-46.8,20.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicResistance.y, cardiacValve.outflowResistance)
        annotation (Line(
          points={{-62,90},{-54,90},{-54,20.8},{-46.8,20.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicConductance.y, cardiacValve.backflowConductance)
        annotation (Line(
          points={{-63.75,59},{-63.75,39.5},{-59.4,39.5},{-59.4,19.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(inflow, cardiacValve.inflow) annotation (Line(
          points={{-92,0},{-78,0},{-78,11.8},{-61.8,11.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(cardiacValve.outflow, arteries.q_in) annotation (Line(
          points={{-42,12},{-26,12},{-26,14},{-10,14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(arteries.q_in, flowPressureMeasurement.q_in) annotation (Line(
          points={{-10,14},{2,14},{2,12},{12,12}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(flowPressureMeasurement.q_out, outflow) annotation (Line(
          points={{32,12},{64,12},{64,4},{96,4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(HR, flowPressureMeasurement.HR) annotation (Line(
          points={{6,38},{14,38},{14,18.6},{22,18.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowPressureMeasurement.Pmean, Pmean) annotation (Line(
          points={{18.2,9},{18.2,-16},{38,-16}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Rectangle(
              extent={{-76,16},{78,-20}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid), Text(
              extent={{-74,-22},{98,-44}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid,
              textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end arteriaaorta_controllable;
  end Parts;

  package Test
    model testpulsos
      Parts.pulsos pulsos
        annotation (Placement(transformation(extent={{-24,-2},{-4,18}})));
      Parts.combitable combitable
        annotation (Placement(transformation(extent={{8,0},{28,20}})));
      Physiolibrary.Types.Constants.FrequencyConst frequency(k=1.3333333333333)
        annotation (Placement(transformation(extent={{-52,6},{-44,14}})));
    equation
      connect(frequency.y, pulsos.HR) annotation (Line(
          points={{-43,10},{-32,10},{-32,6.8},{-20.8,6.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulsos.heartphase, combitable.timeInput) annotation (Line(
          points={{-5.8,6.6},{3.1,6.6},{3.1,9.4},{10.2,9.4}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end testpulsos;

    model testBaro
      Parts.Baroreceptor baroreceptor(
        HR0Param(displayUnit="1/min") = 1.3333333333333,
        useHRInput=true,
        RS0(displayUnit="(mmHg.s)/ml") = 166652984.26875)
        annotation (Placement(transformation(extent={{6,-12},{68,42}})));
      Modelica.Blocks.Sources.Ramp ramp(
        duration=120,
        height=10000,
        offset=11000,
        startTime=60)
        annotation (Placement(transformation(extent={{-58,4},{-38,24}})));
      Physiolibrary.Types.Constants.FrequencyConst HeartRate(k(displayUnit=
              "1/min") = 1.2)                                                   annotation(Placement(transformation(extent={{-18,54},
                {-10,62}})));
    equation
      connect(ramp.y, baroreceptor.PAo) annotation (Line(
          points={{-37,14},{-14,14},{-14,13.92},{7.86,13.92}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HeartRate.y, baroreceptor.cond) annotation (Line(
          points={{-9,58},{56.22,58},{56.22,23.1}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end testBaro;

    model testvenderecho
      Parts.venderecho venderecho
        annotation (Placement(transformation(extent={{-44,30},{-24,50}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume1(P=
            7999.3432449)
        annotation (Placement(transformation(extent={{-28,0},{-8,20}})));
      Physiolibrary.Types.Constants.FrequencyConst frequency(k=1.3333333333333)
        annotation (Placement(transformation(extent={{-60,60},{-52,68}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        hydraulicElastance2Compliance(k=399967.162245)
        annotation (Placement(transformation(extent={{-40,86},{-32,94}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(SolutionFlow=
            0.0001)
        annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
    equation
      connect(unlimitedVolume1.y, venderecho.outflow) annotation (Line(
          points={{-8,10},{-4,10},{-4,42},{-30,42},{-30,46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(frequency.y, venderecho.heartRate) annotation (Line(
          points={{-51,64},{-36,64},{-36,46.8},{-37.6,46.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicElastance2Compliance.y, venderecho.maxelastance)
        annotation (Line(
          points={{-31,90},{-33.4,90},{-33.4,46.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(unlimitedPump.q_out, venderecho.inflow) annotation (Line(
          points={{-60,40},{-48,40},{-48,40.2},{-35.6,40.2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end testvenderecho;

    model testHeart
      Parts.Heart heart
        annotation (Placement(transformation(extent={{-22,-34},{38,26}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume2(P=
            10665.7909932)
        annotation (Placement(transformation(extent={{34,-44},{54,-24}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(SolutionFlow=
            8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-72,-34},{-52,-14}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump1(SolutionFlow=
           8.3333333333333e-05) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={52,60})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume1(P=
            1333.22387415)
        annotation (Placement(transformation(extent={{-56,26},{-36,46}})));
      Physiolibrary.Types.Constants.FrequencyConst frequency(k=1.3333333333333)
        annotation (Placement(transformation(extent={{-50,70},{-42,78}})));
      Physiolibrary.Types.Constants.PressureConst pressure(k=0)
        annotation (Placement(transformation(extent={{-2,88},{6,96}})));
    equation
      connect(unlimitedVolume2.y, heart.leftHeartOutflow) annotation (Line(
          points={{54,-34},{62,-34},{62,-32},{70,-32},{70,-9.4},{18.2,-9.4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(unlimitedPump.q_out, heart.rightHeartInflow) annotation (Line(
          points={{-52,-24},{-6.4,-24},{-6.4,-8.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(unlimitedPump1.q_out, heart.leftHeartInflow) annotation (Line(
          points={{42,60},{26,60},{26,8},{17,8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(unlimitedVolume1.y, heart.rightHeartOutflow) annotation (Line(
          points={{-36,36},{-20,36},{-20,8.6},{-4,8.6}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(frequency.y, heart.heartRate) annotation (Line(
          points={{-41,74},{0,74},{0,15.8},{0.8,15.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressure.y, heart.PTH) annotation (Line(
          points={{7,92},{12,92},{12,15.8},{14,15.8}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end testHeart;
  end Test;

  package Models
    model Hemodynamics
      extends MeursModel.Models.Hemodynamics_pure(
      redeclare FernandezModel.Parts.Heart heart,
      redeclare FernandezModel.Parts.PulmonaryCirculation pulmonaryCirculation,
      redeclare FernandezModel.Parts.SystemicCirculation systemicCirculation);

      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-40,-20},
                {60,100}}), graphics));
    end Hemodynamics;

    model Hemodynamics_pure
      replaceable Parts.Heart
                  heart
        annotation (Placement(transformation(extent={{-24,-22},{18,14}})));
      replaceable Parts.SystemicCirculation
                                systemicCirculation
        annotation (Placement(transformation(extent={{-20,-66},{12,-34}})));
      Parts.PulmonaryCirculation pulmonaryCirculation
        annotation (Placement(transformation(extent={{-20,48},{14,80}})));
    equation
      connect(heart.leftHeartOutflow, systemicCirculation.inflow) annotation (
          Line(
          points={{2.46,-9.76},{26,-9.76},{26,-49.68},{11.04,-49.68}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicCirculation.outflow, heart.rightHeartInflow) annotation (
          Line(
          points={{-18.72,-50},{-32,-50},{-32,-6.52},{-15.6,-6.52}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(heart.rightHeartOutflow, pulmonaryCirculation.inflow) annotation (
         Line(
          points={{-15.6,2.48},{-34,2.48},{-34,63.68},{-19.66,63.68}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryCirculation.outflow, heart.leftHeartInflow) annotation (
          Line(
          points={{14,64},{28,64},{28,-0.4},{7.5,-0.4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end Hemodynamics_pure;

    model Hemodynamics_with_baro
      extends Hemodynamics_pure(redeclare Parts.Heart_controllable2 heart,redeclare
          Parts.SystemicCirculation_controllable                                                                           systemicCirculation);
      Parts.Baroreceptor baroreceptor(EV0venacava=533289.54966)
        annotation (Placement(transformation(extent={{-20,22},{20,54}})));
    equation
      connect(baroreceptor.evleft, heart.ELMax) annotation (Line(
          points={{1.2,29.04},{1.2,17.52},{0.57,17.52},{0.57,5.9}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.HR, heart.HR) annotation (Line(
          points={{-7,29.2},{-7,16.6},{-4.47,16.6},{-4.47,4.1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.evright, heart.ERMax) annotation (Line(
          points={{-16,28.72},{-14,28.72},{-14,5.36},{-10.98,5.36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.evenacava, systemicCirculation.EVenaCava)
        annotation (Line(
          points={{-22.4,38.64},{-44,38.64},{-44,-40.72},{-15.84,-40.72}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.HR, systemicCirculation.HR) annotation (Line(
          points={{-7,29.2},{-7,-5.4},{-6.88,-5.4},{-6.88,-39.76}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(systemicCirculation.RSO, baroreceptor.RS) annotation (Line(
          points={{7.52,-40.4},{40,-40.4},{40,39.92},{16.4,39.92}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.PAo, systemicCirculation.Pmean) annotation (Line(
          points={{7.6,30.96},{14,30.96},{14,-28},{2.4,-28},{2.4,-40.4}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end Hemodynamics_with_baro;
  end Models;
  annotation (uses(Physiolibrary(version="2.1"), Modelica(version="3.2.1"),
      MeursModel(version="2")));
end FernandezModel;
