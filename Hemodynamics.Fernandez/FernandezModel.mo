within ;
package FernandezModel
  package Parts
    model Circulation
                      extends Physiolibrary.Icons.CardioVascular;

    end Circulation;

    model VentricleRight "ventriculo derecho"
      extends Physiolibrary.Icons.RightHeart;
    end VentricleRight;

    model VentricleLeft "ventriculo izquierdo"
      extends Physiolibrary.Icons.LeftHeart;
    end VentricleLeft;

    model pulsos "generates relative position in heart period from 0 to 1"

      Physiolibrary.Types.RealIO.TimeInput timeInput annotation (Placement(
            transformation(extent={{-96,-32},{-56,8}}), iconTransformation(extent={{
                -96,-32},{-56,8}})));
      Physiolibrary.Types.RealIO.TimeOutput timeOutput annotation (Placement(
            transformation(extent={{86,-12},{106,8}}), iconTransformation(extent={{74,
                -24},{106,8}})));


    equation
    /*  p2 = 1/timeInput * time;
  p1 = time /timeInput;
  a2 = p2;
  RtoI = integer(a2);
  a1 = p1-RtoI;
  timeOutput = a1;*/

      timeOutput = (time - integer(time/timeInput)*timeInput)/timeInput;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Ellipse(extent={{-46,52},{68,-78}},
                lineColor={0,0,255})}));
    end pulsos;

    model venderecho "right ventricle"
      pulsos pulsos1
        annotation (Placement(transformation(extent={{-68,0},{-48,20}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel ventricle(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true)
        annotation (Placement(transformation(extent={{-10,-14},{10,6}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a port_a
        annotation (Placement(transformation(extent={{-70,-30},{-50,-10}})));
      PhysiolibraryExtension.Types.RealIO.HydraulicElastanceToCompliance
        hydrauliccompliance annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=270,
            origin={0,16})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve cardiacValve
        annotation (Placement(transformation(extent={{24,-16},{44,4}})));
      Modelica.Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,52})));
      Modelica.Blocks.Math.Product product1 annotation (Placement(
            transformation(
            extent={{-5,-5},{5,5}},
            rotation=270,
            origin={-1,29})));
      Physiolibrary.Blocks.Interpolation.Curve curve(
        x={0,0.0625,0.125,0.1875,0.25,0.3125,0.375,0.4375,1},
        y={0.0066,0.16,0.32,0.45,0.625,0.78,0.27,0.0066,0.0066},
        slope={0,2.5072,2.32,2.44,2.64,-2.84,-6.1872,-0.42144,0})
        annotation (Placement(transformation(extent={{-40,54},{-20,74}})));
    equation
      connect(port_a, ventricle.q_in) annotation (Line(
          points={{-60,-20},{-30,-20},{-30,-4},{0,-4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(hydrauliccompliance.y, ventricle.compliance) annotation (Line(
          points={{0,11},{0,4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricle.q_in, cardiacValve.bloodFlowInflow) annotation (Line(
          points={{0,-4},{12,-4},{12,-6.2},{24.2,-6.2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(product.y, product1.u2) annotation (Line(
          points={{-1.9984e-015,41},{-10,41},{-10,35},{-4,35}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, hydrauliccompliance.hydraulicelastance) annotation (
          Line(
          points={{-1,23.5},{-1,21.75},{-0.1,21.75},{-0.1,20.1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.u2, curve.val) annotation (Line(
          points={{-6,64},{-20,64}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulsos1.timeOutput, curve.u) annotation (Line(
          points={{-49,9.2},{-49,40},{-50,40},{-50,64},{-40,64}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end venderecho;

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
            origin={62,30})));

      Physiolibrary.Types.RealIO.PressureInput PAo "pressure in aorta" annotation (
          Placement(transformation(extent={{-114,-24},{-74,16}}),
            iconTransformation(extent={{-114,-24},{-74,16}})));
      Physiolibrary.Types.RealIO.FrequencyOutput HR
        "heart rate - compatible with Const block" annotation (Placement(
            transformation(extent={{-76,60},{-56,80}}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={-81,61})));
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput evright annotation (
          Placement(transformation(extent={{80,22},{100,42}}), iconTransformation(
              extent={{-14,-14},{14,14}},
            rotation=90,
            origin={-34,56})));
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput evleft annotation (
          Placement(transformation(extent={{78,-18},{98,2}}), iconTransformation(
              extent={{-16,-16},{16,16}},
            rotation=90,
            origin={16,58})));
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput evenacava annotation (
          Placement(transformation(extent={{78,-54},{98,-34}}), iconTransformation(
              extent={{54,-64},{86,-32}})));
      Physiolibrary.Types.RealIO.HydraulicConductanceOutput RS annotation (
          Placement(transformation(extent={{80,-90},{100,-70}}), iconTransformation(
              extent={{-14,-14},{14,14}},
            rotation=270,
            origin={-46,-80})));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={
            Ellipse(
              extent={{56,22},{-72,-30}},
              lineColor={0,0,127},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-92,44},{-68,20}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="HR"),
            Text(
              extent={{-66,40},{6,22}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="EVright"),
            Text(
              extent={{-20,40},{66,22}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="EVleft"),
            Text(
              extent={{-42,-36},{72,-52}},
              lineColor={0,0,127},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid,
              textString="EVenaCava"),
            Text(
              extent={{-82,-48},{-8,-68}},
              lineColor={0,0,127},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid,
              textString="RS"),
            Text(
              extent={{56,12},{80,-12}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="HR")}), Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
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
      parameter Physiolibrary.Types.HydraulicCompliance EV0venacava=1.8751539396141e-06;
      parameter Physiolibrary.Types.HydraulicResistance RS0(displayUnit="(mmHg.s)/ml") = 106657909.932;

    //  parameter Physiolibrary.Types.HydraulicConductance Conductance=0
    protected
      Physiolibrary.Types.Frequency HR0;
    equation
      if not useHRInput then
        HR0=HR0Param;
      end if;
      deadZone.u=PAOmedia-PAo;
      H1.u =(deadZone.y)/133.322387415;
      HR = (HR0*60+H1.y)/60; //recount to SI Hz
      H2.u = (deadZone.y)/133.322387415;
      evright = 1/(EV0right + (H2.y)*(1e+6)*(133.322387415)); //recount to SI
      evleft = 1/(EV0left + H2.y*(1e+6)*(133.322387415)); //recount to SI
      H3.u = (deadZone.y)/133.322387415;
      evenacava = EV0venacava + H3.y*(1e+6)*(133.322387415);
      H4.u = (deadZone.y)/133.322387415;
      RS = 1/(RS0+ H4.y*(1e+6)*(133.322387415));
      connect(evenacava, evenacava) annotation (Line(
          points={{88,-44},{90,-44},{90,-44},{88,-44}},
          color={0,0,127},
          smooth=Smooth.None));
    end Baroreceptor;
  end Parts;

  package Test
    model testpulsos
      Parts.pulsos pulsos
        annotation (Placement(transformation(extent={{-24,-2},{-4,18}})));
      Physiolibrary.Types.Constants.TimeConst timeConst(k(displayUnit="s")=
          0.7) annotation (Placement(transformation(extent={{-48,6},{-40,14}})));
    equation
      connect(timeConst.y, pulsos.timeInput) annotation (Line(
          points={{-39,10},{-30,10},{-30,6.8},{-21.6,6.8}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
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
  end Test;
  annotation (uses(Physiolibrary(version="2.1"), Modelica(version="3.2.1")));
end FernandezModel;
