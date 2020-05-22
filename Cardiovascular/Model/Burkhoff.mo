within Cardiovascular.Model;
package Burkhoff
    extends Modelica.Icons.ExamplesPackage;
  model HemodynamicsBurkhoff_shallow
    //Cardiovascular.Hydraulic.Components.Resistor
    //Cardiovascular.Hydraulic.Components.IdealValveNorm
        extends Cardiovascular.Icons.Runnable_Shallow;
    import Physiolibrary.Hydraulic.Components.*;
    ElasticVessel Cvs(
      volume_start=0.002701,
      ZeroPressureVolume=0.00223,
      Compliance=5.2504310309196e-07)
      annotation (Placement(transformation(extent={{-72,12},{-52,32}})));
    Resistor Ras(Resistance=99991790.56125)
      annotation (Placement(transformation(extent={{-28,12},{-48,32}})));
    ElasticVessel Cas(
      volume_start=0.000834,
      ZeroPressureVolume=0.0007,
      Compliance=1.2751046789376e-08)
      annotation (Placement(transformation(extent={{-24,12},{-4,32}})));
    Resistor Rcs(Resistance=3199737.29796)
      annotation (Placement(transformation(extent={{18,12},{-2,32}})));
    ElasticVessel Caprox(
      volume_start=3.8e-05,
      ZeroPressureVolume=3e-05,
      Compliance=7.5006157584566e-10,
      useExternalPressureInput=true)
      annotation (Placement(transformation(extent={{20,12},{40,32}})));
    Resistor Rcprox(Resistance=2666447.7483)
      annotation (Placement(transformation(extent={{62,12},{42,32}})));
    IdealValveResistance AOV(_Ron=266644.77483) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={80,-4})));
    Parts.ElasticVesselWithSVandP LV(
      useComplianceInput=true,
      volume_start=0.000125,
      ZeroPressureVolume=5e-06,
      useExternalPressureInput=true)
      annotation (Placement(transformation(extent={{92,-14},{112,6}})));
    IdealValveResistance MV(_Ron=333305.9685375) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={122,-4})));
    Parts.ElasticVesselWithSVandP LA(
      useComplianceInput=true,
      useExternalPressureInput=true,
      volume_start=8.1e-05,
      ZeroPressureVolume=5e-06)
      annotation (Placement(transformation(extent={{158,-14},{178,6}})));
    Resistor Rvp(Resistance=1999835.811225)
      annotation (Placement(transformation(extent={{206,-2},{186,18}})));
    Resistor Rvs(Resistance=2666447.7483)
      annotation (Placement(transformation(extent={{-84,-50},{-64,-30}})));
    Parts.ElasticVesselWithSVandP RA(
      useComplianceInput=true,
      useExternalPressureInput=true,
      volume_start=7.3e-05,
      ZeroPressureVolume=5e-06)
      annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
    IdealValveResistance TV(_Ron(displayUnit="(mmHg.s)/ml")=
        333305.9685375) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={4,-40})));
    Parts.ElasticVesselWithSVandP RV(
      useComplianceInput=true,
      ExternalPressure=0,
      volume_start=0.000112,
      ZeroPressureVolume=5e-06,
      useExternalPressureInput=true)
      annotation (Placement(transformation(extent={{16,-50},{36,-30}})));
    IdealValveResistance PV(_Ron=266644.77483) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={50,-40})));
    Resistor Rcsp(Resistance=2666447.7483)
      annotation (Placement(transformation(extent={{70,-50},{90,-30}})));
    ElasticVessel Cap(
      volume_start=0.000802,
      ZeroPressureVolume=0.0006,
      Compliance=1.5001231516913e-07,
      useExternalPressureInput=true)
      annotation (Placement(transformation(extent={{144,-48},{164,-28}})));
    Resistor Rcp(Resistance=2666447.7483)
      annotation (Placement(transformation(extent={{122,-48},{142,-28}})));
    ElasticVessel Cvp(
      volume_start=0.000154,
      ZeroPressureVolume=0.0001,
      Compliance=5.2504310309196e-08,
      useExternalPressureInput=true)
      annotation (Placement(transformation(extent={{184,-48},{204,-28}})));
    ElasticVessel Capprox(
      volume_start=3e-05,
      ZeroPressureVolume=2e-05,
      Compliance=7.5006157584566e-09,
      useExternalPressureInput=true)
      annotation (Placement(transformation(extent={{98,-48},{118,-28}})));
    Resistor Rap(Resistance=2666447.7483)
      annotation (Placement(transformation(extent={{164,-48},{184,-28}})));
    Parts.AtrialElastance RAElastance(
      Tmax(displayUnit="ms") = 0.125,
      Tau(displayUnit="ms") = 0.02,
      Beta(displayUnit="mmHg") = 39.9967162245,
      Alpha=40000,
      Ees=26664477.483)
      annotation (Placement(transformation(extent={{-56,-18},{-32,2}})));
    Parts.VentricularElastance RVElastance(
      Tmax(displayUnit="ms") = 0.2,
      Tau(displayUnit="ms") = 0.03,
      Beta(displayUnit="mmHg") = 45.3296117211,
      Alpha=24000,
      Ees=50662507.2177)
      annotation (Placement(transformation(extent={{14,-14},{36,6}})));
    Parts.AtrialElastance LAElastance(
      Tmax(displayUnit="ms") = 0.125,
      Tau(displayUnit="ms") = 0.02,
      Beta(displayUnit="mmHg") = 39.9967162245,
      Alpha=40000,
      Ees=33330596.85375) annotation (Placement(transformation(
          extent={{-9,-8},{9,8}},
          rotation=0,
          origin={167,32})));
    Parts.VentricularElastance LVElastance(
      Tmax(displayUnit="ms") = 0.2,
      Tau(displayUnit="ms") = 0.03,
      AVDelay(displayUnit="s"),
      Beta(displayUnit="mmHg") = 45.3296117211,
      Alpha=24000,
      Ees=205316476.6191)
      annotation (Placement(transformation(extent={{88,16},{112,36}})));
    Physiolibrary.Types.Constants.FrequencyConst heartRate(k=
          1.3333333333333)
      annotation (Placement(transformation(extent={{-86,34},{-78,42}})));
    Modelica.Blocks.Math.Gain RAVGain(k=0.02) annotation (Placement(
          transformation(
          extent={{-5,-5},{5,5}},
          rotation=180,
          origin={-13,-55})));
    Modelica.Blocks.Math.Add3 add annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={-30,-32})));
    Modelica.Blocks.Math.Gain LAVGain(k=0.02) annotation (Placement(
          transformation(
          extent={{-5,-5},{5,5}},
          rotation=0,
          origin={139,-19})));
    Modelica.Blocks.Math.Add3 add1 annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=270,
          origin={176,14})));
    Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure
      annotation (Placement(transformation(extent={{100,-22},{112,-12}})));
    Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure1
      annotation (Placement(transformation(
          extent={{7,-5},{-7,5}},
          rotation=0,
          origin={19,-53})));
    Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(
          extent={{-3,-3},{3,3}},
          rotation=270,
          origin={35,-25})));
    Modelica.Blocks.Math.Add add3 annotation (Placement(transformation(
          extent={{-3,-3},{3,3}},
          rotation=270,
          origin={109,11})));
    Physiolibrary.Types.Constants.PressureConst IntraThoracicPressure(k=0)
      annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=0,
          origin={50,-4})));
  equation
    connect(AOV.q_in, LV.q_in) annotation (Line(
        points={{90,-4},{102,-4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(LV.q_in, MV.q_out) annotation (Line(
        points={{102,-4},{112,-4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(TV.q_out, RV.q_in) annotation (Line(
        points={{14,-40},{26,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(RV.q_in, PV.q_in) annotation (Line(
        points={{26,-40},{40,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(PV.q_out, Rcsp.q_in) annotation (Line(
        points={{60,-40},{70,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rcsp.q_out, Capprox.q_in) annotation (Line(
        points={{90,-40},{98,-40},{98,-38},{108,-38}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Capprox.q_in, Rcp.q_in) annotation (Line(
        points={{108,-38},{122,-38}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rcp.q_out, Cap.q_in) annotation (Line(
        points={{142,-38},{154,-38}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Cap.q_in, Rap.q_in) annotation (Line(
        points={{154,-38},{164,-38}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rap.q_out, Cvp.q_in) annotation (Line(
        points={{184,-38},{194,-38}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(heartRate.y, RAElastance.HR) annotation (Line(
        points={{-77,38},{-74,38},{-74,6},{-66,6},{-66,0.3},{-54.68,0.3}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(RVElastance.HR, RAElastance.HR) annotation (Line(
        points={{15.21,4.3},{-2,4.3},{-2,6},{-58,6},{-58,0.3},{-54.68,0.3}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(LAElastance.HR, heartRate.y) annotation (Line(
        points={{158.99,38.64},{128,38.64},{128,38},{-77,38}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(LVElastance.HR, heartRate.y) annotation (Line(
        points={{89.32,34.3},{62,34.3},{62,38},{-77,38}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(RA.StressedVolume, RAElastance.Vs) annotation (Line(
        points={{-54.4,-29.8},{-54.4,-19.9},{-54.32,-19.9},{-54.32,-16.8}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(LV.StressedVolume, LVElastance.Vs) annotation (Line(
        points={{97.6,6.2},{97.6,16},{89.68,16},{89.68,17.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(LA.StressedVolume, LAElastance.Vs) annotation (Line(
        points={{163.6,6.2},{159.26,6.2},{159.26,24.96}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(RA.q_in, TV.q_in) annotation (Line(
        points={{-50,-40},{-6,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(LA.q_in, MV.q_in) annotation (Line(
        points={{168,-4},{132,-4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Cvp.q_in, Rvp.q_in) annotation (Line(
        points={{194,-38},{206,-38},{206,8}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rvp.q_out, LA.q_in) annotation (Line(
        points={{186,8},{186,-4},{168,-4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(AOV.q_out, Rcprox.q_in) annotation (Line(
        points={{70,-4},{70,22},{62,22}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rcprox.q_out, Caprox.q_in) annotation (Line(
        points={{42,22},{30,22}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rcs.q_in, Caprox.q_in) annotation (Line(
        points={{18,22},{30,22}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rcs.q_out, Cas.q_in) annotation (Line(
        points={{-2,22},{-14,22}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Cas.q_in, Ras.q_in) annotation (Line(
        points={{-14,22},{-28,22}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Ras.q_out, Cvs.q_in) annotation (Line(
        points={{-48,22},{-62,22}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Cvs.q_in, Rvs.q_in) annotation (Line(
        points={{-62,22},{-84,22},{-84,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rvs.q_out, RA.q_in) annotation (Line(
        points={{-64,-40},{-50,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(RAVGain.y, add.u1) annotation (Line(
        points={{-18.5,-55},{-18.5,-35.2},{-25.2,-35.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(LVElastance.Ct, LV.compliance) annotation (Line(
        points={{103.6,17.4},{103.6,17.21},{102,17.21},{102,4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(LAElastance.Ct, LA.compliance) annotation (Line(
        points={{169.7,25.12},{169.7,18},{168,18},{168,4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(RVElastance.Ct, RV.compliance) annotation (Line(
        points={{28.3,-12.6},{28.3,-25.79},{26,-25.79},{26,-32}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(RAElastance.Ct, RA.compliance) annotation (Line(
        points={{-40.4,-16.6},{-40.4,-26},{-50,-26},{-50,-32}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(RV.StressedVolume, RVElastance.Vs) annotation (Line(
        points={{21.6,-29.8},{21.6,-24.9},{15.54,-24.9},{15.54,-12.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(LV.q_in, pressureMeasure.q_in) annotation (Line(
        points={{102,-4},{103.6,-4},{103.6,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pressureMeasure1.q_in, RV.q_in) annotation (Line(
        points={{21.8,-56},{24,-56},{24,-40},{26,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pressureMeasure1.pressure, RAVGain.u) annotation (Line(
        points={{14.8,-55},{-7,-55}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(add1.u3, add1.u3) annotation (Line(
        points={{172.8,18.8},{172.8,18.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(RVElastance.Pt, add2.u2) annotation (Line(
        points={{34.02,-12.6},{34.02,-18.9},{33.2,-18.9},{33.2,-21.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(RV.externalPressure, add2.y) annotation (Line(
        points={{34,-32},{34,-28.3},{35,-28.3}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(add.y, RA.externalPressure) annotation (Line(
        points={{-34.4,-32},{-42,-32}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(RAElastance.Pt, add.u3) annotation (Line(
        points={{-34.16,-16.6},{-34.16,-26},{-20,-26},{-20,-28.8},{-25.2,-28.8}},
        color={0,190,190},
        smooth=Smooth.None));

    connect(LV.externalPressure, add3.y) annotation (Line(
        points={{110,4},{110,7.7},{109,7.7}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(LA.externalPressure, add1.y) annotation (Line(
        points={{176,4},{176,9.6}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(pressureMeasure.pressure, LAVGain.u) annotation (Line(
        points={{109.6,-19},{120.8,-19},{120.8,-19},{133,-19}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(LAVGain.y, add1.u1) annotation (Line(
        points={{144.5,-19},{184,-19},{184,18.8},{179.2,18.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(IntraThoracicPressure.y, Caprox.externalPressure) annotation (
        Line(
        points={{55,-4},{66,-4},{66,30},{38,30}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(IntraThoracicPressure.y, add3.u2) annotation (Line(
        points={{55,-4},{66,-4},{66,14.6},{107.2,14.6}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(LVElastance.Pt, add3.u1) annotation (Line(
        points={{109.84,17.4},{109.84,16.7},{110.8,16.7},{110.8,14.6}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(add1.u2, LAElastance.Pt) annotation (Line(
        points={{176,18.8},{176,25.12},{174.38,25.12}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(IntraThoracicPressure.y, add1.u3) annotation (Line(
        points={{55,-4},{66,-4},{66,24},{172.8,24},{172.8,18.8}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(IntraThoracicPressure.y, Capprox.externalPressure) annotation (
        Line(
        points={{55,-4},{66,-4},{66,-26},{116,-26},{116,-30}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(Cap.externalPressure, Capprox.externalPressure) annotation (
        Line(
        points={{162,-30},{162,-26},{116,-26},{116,-30}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(Cvp.externalPressure, Capprox.externalPressure) annotation (
        Line(
        points={{202,-30},{202,-26},{116,-26},{116,-30}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(IntraThoracicPressure.y, add2.u1) annotation (Line(
        points={{55,-4},{66,-4},{66,-21.4},{36.8,-21.4}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(add.u2, Capprox.externalPressure) annotation (Line(
        points={{-25.2,-32},{-16,-32},{-16,-18},{66,-18},{66,-26},{116,-26},
            {116,-30}},
        color={0,190,190},
        smooth=Smooth.None));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {220,100}}), graphics),
      Icon(coordinateSystem(extent={{-100,-100},{220,100}})),
      Documentation(info="<html>
<p>Cardiovascular model implemented per description of Burkhoff et al.</p>
<p>[5] W. P. Santamore, D. Burkhoff, Hemodynamic Consequences of Ventricular Interaction as Assessed by Model Analysis., The American Journal of Physiology 260 (1 Pt 2) (1991) H146&ndash;H157.</p>
<p>[6] D. Burkhoff, J. V. Tyberg, Why does Pulmonary Venous Pressure Rise after onset of LV Dysfunction: A Theoretical Analysis., The American Journal of Physiology 265 (5 Pt 2) (1993) H1819&ndash;H1828.</p>
<p>[7] D. Morley, K. Litwak, P. Ferber, P. Spence, R. Dowling, B. Meyns, B. Griffith, D. Burkhoff, Hemodynamic Effects of Partial Ventricular Support in Chronic Heart Failure: Results of Simulation Validated with In Vivo Data, The Journal of Thoracic and Cardiovascular Surgery 133 (1) (2007) 21&ndash;28.e4. doi:10.1016/j.jtcvs.2006.07.037. URL http://linkinghub.elsevier.com/retrieve/pii/S0022522306015728</p>
<p>[8] Harvi - interactive simulation-based digital textbook of cardiovascular physiology and hemodynamics. URL http://www.pvloops.com</p>
</html>"));
  end HemodynamicsBurkhoff_shallow;

  model HemodynamicsBurkhoff
    extends Cardiovascular.System(
      redeclare Parts.Pulmonary pulmonaryCirculation,
      redeclare replaceable Parts.Heart heart,
      redeclare Parts.Systemic systemicCirculation);
      extends Cardiovascular.Icons.Runnable_System;
    annotation (experiment(
        StopTime=5,
        __Dymola_NumberOfIntervals=5000,
        Tolerance=0.001), Documentation(info="<html>
<p>Cardiovascular model implemented per description of Burkhoff et al.</p>
<p>[5] W. P. Santamore, D. Burkhoff, Hemodynamic Consequences of Ventricular Interaction as Assessed by Model Analysis., The American Journal of Physiology 260 (1 Pt 2) (1991) H146&ndash;H157.</p>
<p>[6] D. Burkhoff, J. V. Tyberg, Why does Pulmonary Venous Pressure Rise after onset of LV Dysfunction: A Theoretical Analysis., The American Journal of Physiology 265 (5 Pt 2) (1993) H1819&ndash;H1828.</p>
<p>[7] D. Morley, K. Litwak, P. Ferber, P. Spence, R. Dowling, B. Meyns, B. Griffith, D. Burkhoff, Hemodynamic Effects of Partial Ventricular Support in Chronic Heart Failure: Results of Simulation Validated with In Vivo Data, The Journal of Thoracic and Cardiovascular Surgery 133 (1) (2007) 21&ndash;28.e4. doi:10.1016/j.jtcvs.2006.07.037. URL http://linkinghub.elsevier.com/retrieve/pii/S0022522306015728</p>
<p>[8] Harvi - interactive simulation-based digital textbook of cardiovascular physiology and hemodynamics. URL http://www.pvloops.com</p>
</html>"));
  end HemodynamicsBurkhoff;

  package Parts
    extends Modelica.Icons.UtilitiesPackage;
    model Pulmonary
      extends Cardiovascular.Interfaces.Pulmonary;
      import Physiolibrary.Hydraulic.Components.*;
      Resistor Rcsp(Resistance(displayUnit="(mmHg.s)/ml") = 2666447.7483)
        annotation (Placement(transformation(extent={{-84,-10},{-64,10}})));
    ElasticVessel      Capprox(
        volume_start=3e-05,
        ZeroPressureVolume=2e-05,
        Compliance=7.5006157584566e-09)
        annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
      Resistor Rcp(Resistance(displayUnit="(mmHg.s)/ml") = 2666447.7483)
        annotation (Placement(transformation(extent={{-32,-10},{-12,10}})));
    ElasticVessel      Cap(
        volume_start=0.000802,
        ZeroPressureVolume=0.0006,
        Compliance=1.5001231516913e-07)
        annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
      Resistor Rap(Resistance(displayUnit="(mmHg.s)/ml") = 2666447.7483)
        annotation (Placement(transformation(extent={{12,-10},{32,10}})));
    ElasticVessel      Cvp(
        volume_start=0.000154,
        ZeroPressureVolume=0.0001,
        Compliance=5.2504310309196e-08)
        annotation (Placement(transformation(extent={{34,-10},{54,10}})));
      Resistor Rvp(Resistance(displayUnit="(mmHg.s)/ml") = 1999835.811225)
        annotation (Placement(transformation(extent={{60,-10},{80,10}})));
    equation
      connect(q_in, Rcsp.q_in) annotation (Line(
          points={{-100,0},{-84,0},{-84,2.22045e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rcsp.q_out, Capprox.q_in) annotation (Line(
          points={{-64,2.22045e-16},{-46,2.22045e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Capprox.q_in, Rcp.q_in) annotation (Line(
          points={{-46,2.22045e-16},{-32,2.22045e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rcp.q_out, Cap.q_in) annotation (Line(
          points={{-12,2.22045e-16},{2,2.22045e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Cap.q_in, Rap.q_in) annotation (Line(
          points={{2,2.22045e-16},{12,2.22045e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rap.q_out, Cvp.q_in) annotation (Line(
          points={{32,2.22045e-16},{44,2.22045e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Cvp.q_in, Rvp.q_in) annotation (Line(
          points={{44,2.22045e-16},{60,2.22045e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rvp.q_out, q_out) annotation (Line(
          points={{80,2.22045e-16},{88,2.22045e-16},{88,0},{100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics), Icon(graphics={
              Text(   extent={{-100,60},{100,100}},
              lineColor={0,0,0},
              textString="Burkhoff")}));
    end Pulmonary;

    model Systemic
      extends Cardiovascular.Interfaces.Systemic;
        import Physiolibrary.Hydraulic.Components.*;
      Resistor Rcprox(Resistance(displayUnit="(mmHg.s)/ml") = 2666447.7483)
        annotation (Placement(transformation(extent={{86,-10},{66,10}})));
    ElasticVessel Caprox(
        volume_start=3.8e-05,
        ZeroPressureVolume=3e-05,
        Compliance=7.5006157584566e-10)
        annotation (Placement(transformation(extent={{44,-10},{64,10}})));
      Resistor Rcs(Resistance(displayUnit="(mmHg.s)/ml") = 3199737.29796)
        annotation (Placement(transformation(extent={{42,-10},{22,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel Cas(
        volume_start=0.000834,
        ZeroPressureVolume=0.0007,
        Compliance=1.2751046789376e-08)
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Resistor Ras(Resistance(displayUnit="(mmHg.s)/ml") = 99991790.56125)
        annotation (Placement(transformation(extent={{-2,-10},{-22,10}})));
    ElasticVessel Cvs(
        volume_start=0.002701,
        ZeroPressureVolume=0.00223,
        useComplianceInput=false,
        Compliance=5.2504310309196e-07)
        annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
      Resistor Rvs(Resistance(displayUnit="(mmHg.s)/ml") = 2666447.7483)
        annotation (Placement(transformation(extent={{-56,-10},{-76,10}})));
    equation
      connect(Rcprox.q_in, q_in) annotation (Line(
          points={{86,0},{100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rcprox.q_out, Caprox.q_in) annotation (Line(
          points={{66,0},{54,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Caprox.q_in, Rcs.q_in) annotation (Line(
          points={{54,0},{42,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rcs.q_out, Cas.q_in) annotation (Line(
          points={{22,0},{10,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Cas.q_in, Ras.q_in) annotation (Line(
          points={{10,0},{-2,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Ras.q_out, Cvs.q_in) annotation (Line(
          points={{-22,0},{-38,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Cvs.q_in, Rvs.q_in) annotation (Line(
          points={{-38,0},{-56,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rvs.q_out, q_out) annotation (Line(
          points={{-76,0},{-100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics), Icon(graphics={
              Text(   extent={{-100,60},{100,100}},
              lineColor={0,0,0},
              textString="Burkhoff")}));
    end Systemic;

    model Heart "heart with modified elastance"
      extends Cardiovascular.Interfaces.Heart;
    Parts.ElasticVesselWithSVandP LA(
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=8.1e-05,
        ZeroPressureVolume=5e-06)
        annotation (Placement(transformation(extent={{30,-50},{50,-30}})));
    Parts.AtrialElastance atrialElastance1(
        Tmax(displayUnit="ms") = 0.125,
        Tau(displayUnit="ms") = 0.02,
        Alpha=40000,
        Beta(displayUnit="mmHg") = 39.9967162245,
        Ees=33330596.85375) annotation (Placement(transformation(
            extent={{-17,-13},{17,13}},
            rotation=0,
            origin={31,3})));
      Physiolibrary.Hydraulic.Components.IdealValve MV(_Gon(displayUnit=
              "ml/(mmHg.s)") = 3.0002463033826e-06) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-6,-40})));
    Parts.VentricularElastance ventricularElastance1(
        Tmax(displayUnit="ms") = 0.2,
        Tau(displayUnit="ms") = 0.03,
        Alpha=24000,
        Beta(displayUnit="mmHg") = 45.3296117211,
        Ees=205316476.6191)
        annotation (Placement(transformation(extent={{-52,-20},{-18,6}})));
    Parts.ElasticVesselWithSVandP LV(
        useComplianceInput=true,
        volume_start=0.000125,
        ZeroPressureVolume=5e-06,
        useExternalPressureInput=true) annotation (Placement(transformation(
              extent={{-38,-50},{-18,-30}})));
      Physiolibrary.Hydraulic.Components.IdealValve AOV(_Gon(displayUnit=
              "ml/(mmHg.s)") = 3.7503078792283e-06) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-52,-40})));
      Physiolibrary.Hydraulic.Components.IdealValve PV(_Gon(displayUnit=
              "ml/(mmHg.s)") = 3.7503078792283e-06) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={50,42})));
    Parts.ElasticVesselWithSVandP RV(
        useComplianceInput=true,
        ExternalPressure=0,
        useExternalPressureInput=true,
        volume_start=0.000112,
        ZeroPressureVolume=5e-06)
        annotation (Placement(transformation(extent={{16,32},{36,52}})));
    Parts.VentricularElastance ventricularElastance(
        Tmax(displayUnit="ms") = 0.2,
        Tau(displayUnit="ms") = 0.03,
        Alpha=24000,
        Beta(displayUnit="mmHg") = 45.3296117211,
        Ees=50662507.2177)
        annotation (Placement(transformation(extent={{16,64},{50,92}})));
      Physiolibrary.Hydraulic.Components.IdealValve TV(_Gon(displayUnit=
              "ml/(mmHg.s)") = 3.0002463033826e-06) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={4,42})));
    Parts.AtrialElastance atrialElastance(
        Tmax(displayUnit="ms") = 0.125,
        Tau(displayUnit="ms") = 0.02,
        Alpha=40000,
        Beta(displayUnit="mmHg") = 39.9967162245,
        Ees=26664477.483)
        annotation (Placement(transformation(extent={{-80,62},{-48,92}})));
    Parts.ElasticVesselWithSVandP RA(
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=7.3e-05,
        ZeroPressureVolume=5e-06)
        annotation (Placement(transformation(extent={{-60,32},{-40,52}})));
      replaceable Physiolibrary.Types.Constants.FrequencyConst heartRate(k=
            1.3333333333333)
        annotation (Placement(transformation(extent={{-98,8},{-84,22}})));
      Control.BloodFlowMeasurement bloodFlowMeasurement annotation (
          Placement(transformation(extent={{-76,-50},{-96,-30}})));
      Modelica.Blocks.Math.Add add annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=270,
            origin={51,-21})));
      Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=270,
            origin={-41,59})));
      Modelica.Blocks.Math.Gain RAVGain(k=0.02) annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=180,
            origin={-22,66})));
      Modelica.Blocks.Math.Gain LAVGain(k=0.02) annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=180,
            origin={62,-8})));
      Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure
        annotation (Placement(transformation(extent={{18,52},{4,64}})));
      Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure1
        annotation (Placement(transformation(extent={{-14,-58},{0,-48}})));
    equation
      connect(rightHeartInflow, RA.q_in) annotation (Line(
          points={{-100,40},{-74,40},{-74,42},{-50,42}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RA.q_in, TV.q_in) annotation (Line(
          points={{-50,42},{-6,42}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(TV.q_out, RV.q_in) annotation (Line(
          points={{14,42},{26,42}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RV.q_in, PV.q_in) annotation (Line(
          points={{26,42},{40,42}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(PV.q_out, rightHeartOutflow) annotation (Line(
          points={{60,42},{82,42},{82,40},{100,40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeartInflow, LA.q_in) annotation (Line(
          points={{100,-20},{84,-20},{84,-18},{64,-18},{64,-40},{40,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(LA.q_in, MV.q_in) annotation (Line(
          points={{40,-40},{4,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(MV.q_out, LV.q_in) annotation (Line(
          points={{-16,-40},{-28,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(LV.q_in, AOV.q_in) annotation (Line(
          points={{-28,-40},{-42,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ventricularElastance1.Ct, LV.compliance) annotation (Line(
          points={{-29.9,-18.18},{-28,-18.18},{-28,-32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricularElastance.Ct, RV.compliance) annotation (Line(
          points={{38.1,65.96},{38.1,63.65},{26,63.65},{26,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartRate.y, atrialElastance.HR) annotation (Line(
          points={{-82.25,15},{-82.25,89.45},{-78.24,89.45}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RA.StressedVolume, atrialElastance.Vs) annotation (Line(
          points={{-54.4,52.2},{-54.4,56},{-77.76,56},{-77.76,63.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RV.StressedVolume, ventricularElastance.Vs) annotation (Line(
          points={{21.6,52.2},{21.6,54},{18.38,54},{18.38,65.68}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(LV.StressedVolume, ventricularElastance1.Vs) annotation (Line(
          points={{-32.4,-29.8},{-32.4,-24},{-49.62,-24},{-49.62,-18.44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(LA.StressedVolume, atrialElastance1.Vs) annotation (Line(
          points={{35.6,-29.8},{35.6,-26},{16.38,-26},{16.38,-8.44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartRate.y, ventricularElastance1.HR) annotation (Line(
          points={{-82.25,15},{-82.25,3.79},{-50.13,3.79}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricularElastance.HR, atrialElastance.HR) annotation (Line(
          points={{17.87,89.62},{-46,89.62},{-46,96},{-82,96},{-82,89.45},{
              -78.24,89.45}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(bloodFlowMeasurement.q_in, AOV.q_out) annotation (Line(
          points={{-76,-40},{-62,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(bloodFlowMeasurement.q_out, leftHeartOutflow) annotation (
          Line(
          points={{-96,-40},{-100,-40},{-100,-20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(bloodFlowMeasurement.HR, heartRate.y) annotation (Line(
          points={{-80,-30},{-82,-30},{-82,15},{-82.25,15}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricularElastance1.Pt, LV.externalPressure) annotation (
          Line(
          points={{-21.06,-18.18},{-20,-18.18},{-20,-32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(LA.externalPressure, add.y) annotation (Line(
          points={{48,-32},{50,-32},{50,-26.5},{51,-26.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(atrialElastance1.HR, heartRate.y) annotation (Line(
          points={{15.87,13.79},{15.87,15},{-82.25,15}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(atrialElastance.Pt, add1.u2) annotation (Line(
          points={{-50.88,64.1},{-44,64.1},{-44,65}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.y, RA.externalPressure) annotation (Line(
          points={{-41,53.5},{-41,53.75},{-42,53.75},{-42,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.u1, RAVGain.y) annotation (Line(
          points={{-38,65},{-38,66},{-28.6,66}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.u1, LAVGain.y) annotation (Line(
          points={{54,-15},{54,-12},{54,-8},{55.4,-8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure1.q_in, LV.q_in) annotation (Line(
          points={{-9.8,-56},{-24,-56},{-24,-40},{-28,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressureMeasure1.pressure, LAVGain.u) annotation (Line(
          points={{-2.8,-55},{69.2,-55},{69.2,-8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure.q_in, RV.q_in) annotation (Line(
          points={{13.8,54.4},{14,54.4},{14,46},{26,46},{26,42}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressureMeasure.pressure, RAVGain.u) annotation (Line(
          points={{6.8,55.6},{6.8,66},{-14.8,66}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RA.compliance, atrialElastance.Ct) annotation (Line(
          points={{-50,50},{-50,58},{-59.2,58},{-59.2,64.1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(atrialElastance1.Pt, add.u2) annotation (Line(
          points={{44.94,-8.18},{44.94,-11.09},{48,-11.09},{48,-15}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(LA.compliance, atrialElastance1.Ct) annotation (Line(
          points={{40,-32},{38,-32},{38,-8.18},{36.1,-8.18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RV.externalPressure, ventricularElastance.Pt) annotation (
          Line(
          points={{34,50},{34,56},{46.94,56},{46.94,65.96}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics), Icon(graphics={
              Text(   extent={{-100,60},{100,100}},
              lineColor={0,0,0},
              textString="Burkhoff")}));
    end Heart;

    model ElasticVesselWithSVandP
      "elastic vessel computes aditionally stressed volume and pressure"
      extends Physiolibrary.Hydraulic.Components.ElasticVessel;
      Physiolibrary.Types.RealIO.VolumeOutput StressedVolume annotation (
          Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-88,-100}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-44,102})));
    equation
      StressedVolume = volume - zpv;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics), Icon(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end ElasticVesselWithSVandP;

    partial model HeartElastance
      "Elastance of heart atria and ventricules by Burkhoff"
      import Physiolibrary.Types.*;
      RealIO.VolumeInput Vs "Stressed volume" annotation (Placement(
          visible=true,
          transformation(
            origin={-163.397,-51.3719},
            extent={{-20.0,-20.0},{20.0,20.0}},
            rotation=0),
          iconTransformation(
            origin={-86,-88},
            extent={{-9.999980000000001,-10},{10,9.99995}},
            rotation=90)));
      parameter Real Alpha(final unit="1/m3")
        "coefficient of end diastolic pressure-volume curve";
      parameter Pressure Beta
        "coefficient of end diastolic pressure-volume curve";
      parameter Boolean useEs_extInput=false
        "=true, if external elastance/compliance value is used" annotation (
        Evaluate=true,
        HideResult=true,
        choices(__Dymola_checkBox=true),
        Dialog(group="External inputs/outputs"));
      parameter HydraulicElastance Ees
        "coefficient of end-systolic elastance"
            annotation (Dialog(enable=not useEs_extInput));
      HydraulicElastance Et "Elastance";
      Time Tsyst;
      //need to define in extended model
      parameter Time Tmax "duration of systole ";
      parameter Time Tau "time constant of myocardial relaxation ";
      Real Et0
        "Relative elastance value (Elastance/End-Systolic Elastance)";
      RealIO.PressureOutput Pt "peak isovolumic pressure" annotation (
          Placement(transformation(extent={{64,-78},{84,-58}}),
            iconTransformation(
              extent={{-10,-10},{10,10}},
            rotation=270,
            origin={82,-86})));
      RealIO.HydraulicComplianceOutput Ct annotation (Placement(
            transformation(extent={{52,-76},{72,-56}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={30,-86})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/
            Ees) = 1/mes if useEs_extInput annotation (Placement(
            transformation(extent={{64,56},{104,96}}), iconTransformation(
            extent={{-13,-13},{13,13}},
            rotation=180,
            origin={87,67})));
    protected
     HydraulicElastance mes;
    equation
      if not useEs_extInput then
        mes = Ees;
      end if;
      if Tsyst <= 3/2*Tmax then
        Et0 = 0.5*(sin(Modelica.Constants.pi/Tmax*Tsyst - Modelica.Constants.pi
          /2) + 1);
      else
        Et0 = 0.5*exp(-(Tsyst - 3*Tmax/2)/Tau);
      end if;
      //1e+6 and 133.322368 are recalculation in SI units - as the original equation comes in torr and ml.
      //  Et = (1 - Et0) * Beta * (exp(Alpha * Vs * 1e+6) - 1) / Vs * 1e+6) * 133.322368 * 1e+6 + Et0 * Ees;
      Et = Modelica.Constants.eps + Et0*mes;
      Pt = (1 - Et0)*Beta*(exp(Alpha*Vs) - 1);
      Ct = 1/Et;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics), Icon(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Rectangle(
                      extent={{-100,100},{100,-76}},
                      lineColor={0,0,127},
                      fillColor={255,255,170},
                      fillPattern=FillPattern.Solid),Line(
                      points={{-38,94},{-38,-36},{86,-36}},
                      color={0,0,0},
                      smooth=Smooth.None),Line(
                      points={{-34,-34},{30,-32},{54,-30},{70,-28},{76,-26},
                {82,-24},{86,-22},{90,-20}},
                      color={0,0,0},
                      smooth=Smooth.None),Line(
                      points={{-34,-36},{4,94}},
                      color={0,0,0},
                      smooth=Smooth.None),Line(
                      points={{-34,-36},{88,80}},
                      color={255,0,0},
                      smooth=Smooth.None),Polygon(
                      points={{76,72},{72,80},{80,76},{76,72}},
                      lineColor={255,0,0},
                      smooth=Smooth.None,
                      fillColor={255,0,0},
                      fillPattern=FillPattern.Solid),Polygon(
                      points={{0,-4},{-4,4},{4,0},{0,-4}},
                      lineColor={255,0,0},
                      smooth=Smooth.None,
                      fillColor={255,0,0},
                fillPattern=FillPattern.Solid,
                      origin={84,69},
                      rotation=180),Text(
                      extent={{-110,-52},{-64,-76}},
                      lineColor={0,0,255},
                      fillColor={255,0,0},
                fillPattern=FillPattern.Solid,
                      textString="Vs"),Text(
                      extent={{6,-50},{52,-76}},
                      lineColor={0,0,255},
                      fillColor={255,0,0},
                      fillPattern=FillPattern.Solid,
                      textString="Ct"),Text(
                      extent={{-100,120},{100,104}},
                      lineColor={0,0,255},
                      fillColor={170,213,255},
                      fillPattern=FillPattern.Solid,
                      textString="%name"),Text(
                      extent={{58,-50},{100,-78}},
                      lineColor={0,0,255},
                      fillColor={255,0,0},
                      fillPattern=FillPattern.Solid,
              textString="Ped")}));
    end HeartElastance;

    model VentricularElastance
      extends HeartIntervals;
      //produces tvsyst and tasyst
      extends HeartElastance;
      //consumes tsyst from above
    equation
      Tsyst = Tvsyst;
    end VentricularElastance;

    model HeartIntervals
      discrete Physiolibrary.Types.Time HP(start=0)
        "heart period - duration of cardiac cycle";
      Boolean b(start=false);
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
          transformation(
            extent={{-134.0,8.0},{-94.0,48.0}},
            origin={1.3363,-48.0},
            rotation=0),
          iconTransformation(
            extent={{-73.7009,4.4},{-51.7009,26.4}},
            origin={-26.2991,67.6},
            rotation=0),
          visible=true));
      Physiolibrary.Types.Time Tasyst
        "time elapsed from the beginning of atrial systole";
      Physiolibrary.Types.Time Tvsyst
        "time elapsed from the beginning of ventricular systole";
      parameter Physiolibrary.Types.Time AVDelay(displayUnit="s") = 0.160
        "AV interval";
      Physiolibrary.Types.Time T0 "start time of cardiac cycle";
      Physiolibrary.Types.Time EDTV "Ventricular end Diastolic Time";
    equation
      b = time - pre(T0) >= pre(HP);
      when {initial(),b} then
        T0 = time;
        HP = 1/HR;
        EDTV = T0 + AVDelay;
      end when;
      Tasyst = time - T0;
      if time - T0 < AVDelay then
        Tvsyst = 0;
      else
        Tvsyst = time - (T0 + AVDelay);
      end if;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Text(
                      visible=true,
                      origin={-18.5625,68},
                      lineColor={0,0,255},
                      extent={{-73.4375,6.00004},{-23.4375,24}},
                      textString="HR",
                      fontName="Arial")}));
    end HeartIntervals;

    model AtrialElastance
      extends HeartIntervals;
      extends HeartElastance;
    equation
      Tsyst = Tasyst;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics));
    end AtrialElastance;
  end Parts;

  model HemodynamicsBurkhoffBVControl
    extends Interfaces.Controlled.System(
      redeclare replaceable ControlledParts.PulmonaryControl
        pulmonaryCirculation,
      redeclare replaceable ControlledParts.HeartControl heart(MV(
            useLimitationInputs=false), AOV(useLimitationInputs=false)),
      redeclare replaceable ControlledParts.SystemicControl
        systemicCirculation(Ras(useConductanceInput=false)),
      redeclare Model.Control.Baroreflex shortTermControl(baroreceptor(
          PAOmedia=11585.715466364,
          EV0right=50662507.2177,
          EV0left=205316476.6191,
          EV0venacava=5.2504310309196e-07,
          activationDelay=10)),
      redeclare replaceable Model.Control.BloodVolumeControl
        longTermControl);
  /*    redeclare Control.StenosisControl simulationControl(venacavastenosis(
          InitialElastance=1906510.1400345, FinalElastance=
            1906510.1400345),                                aorticstenosis(
          InitialResistance(displayUnit="(mmHg.s)/ml") = 266644.77483,
          FinalResistance(displayUnit="(mmHg.s)/ml") = 266644.77483),
      mitralvalvestenosis(InitialResistance=333305.9685375, FinalResistance=333305.9685375)));*/
      extends Cardiovascular.Icons.Runnable_System;
    annotation (experiment(
        StopTime=5,
        __Dymola_NumberOfIntervals=5000,
        Tolerance=0.001), Documentation(info="<html>
<p>Cardiovascular model implemented per description of Burkhoff et al.</p>
<p>[5] W. P. Santamore, D. Burkhoff, Hemodynamic Consequences of Ventricular Interaction as Assessed by Model Analysis., The American Journal of Physiology 260 (1 Pt 2) (1991) H146&ndash;H157.</p>
<p>[6] D. Burkhoff, J. V. Tyberg, Why does Pulmonary Venous Pressure Rise after onset of LV Dysfunction: A Theoretical Analysis., The American Journal of Physiology 265 (5 Pt 2) (1993) H1819&ndash;H1828.</p>
<p>[7] D. Morley, K. Litwak, P. Ferber, P. Spence, R. Dowling, B. Meyns, B. Griffith, D. Burkhoff, Hemodynamic Effects of Partial Ventricular Support in Chronic Heart Failure: Results of Simulation Validated with In Vivo Data, The Journal of Thoracic and Cardiovascular Surgery 133 (1) (2007) 21&ndash;28.e4. doi:10.1016/j.jtcvs.2006.07.037. URL http://linkinghub.elsevier.com/retrieve/pii/S0022522306015728</p>
<p>[8] Harvi - interactive simulation-based digital textbook of cardiovascular physiology and hemodynamics. URL http://www.pvloops.com</p>
</html>"));
  end HemodynamicsBurkhoffBVControl;

  package ControlledParts
    extends Modelica.Icons.UtilitiesPackage;

    model PulmonaryControl
      extends Interfaces.Controlled.Pulmonary;
      extends Parts.Pulmonary;
      Modelica.Blocks.Math.Add3 add3_1
        annotation (Placement(transformation(extent={{-36,22},{-56,42}})));
    equation
      connect(Capprox.volume, add3_1.u3) annotation (Line(
          points={{-40,-10},{-40,-16},{-34,-16},{-34,24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Cap.volume, add3_1.u2) annotation (Line(
          points={{8,-10},{10,-10},{10,-16},{16,-16},{16,32},{-34,32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Cvp.volume, add3_1.u1) annotation (Line(
          points={{50,-10},{52,-10},{52,-16},{56,-16},{56,40},{-34,40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add3_1.y, busConnector.pulmonaryBloodVolume) annotation (Line(
          points={{-57,32},{-68,32},{-68,34},{-80,34}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end PulmonaryControl;

    model SystemicControl
      extends Interfaces.Controlled.Systemic;
      extends Parts.Systemic(Cvs(useComplianceInput=true), Caprox(
            useComplianceInput=false));
      Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(transformation(
            extent={{-7,-7},{7,7}},
            rotation=180,
            origin={-65,-23})));
      Cardiovascular.Model.Control.MeanAortaPressureMeasurement aortaPressureMeasurement
        annotation (Placement(transformation(extent={{32,12},{52,32}})));
    equation
      connect(add3_1.u3, Cvs.volume) annotation (Line(
          points={{-56.6,-17.4},{-32,-17.4},{-32,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add3_1.u2, Cas.volume) annotation (Line(
          points={{-56.6,-23},{16,-23},{16,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add3_1.u1, Caprox.volume) annotation (Line(
          points={{-56.6,-28.6},{60,-28.6},{60,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add3_1.y, busConnector.systemicBloodVolume) annotation (Line(
          points={{-72.7,-23},{-80,-23},{-80,34}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(Rcs.q_in, aortaPressureMeasurement.q_in) annotation (Line(
          points={{42,0},{42,16},{38,16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(aortaPressureMeasurement.Pmean, busConnector.aortameanpressure)
        annotation (Line(
          points={{49,25},{62,25},{62,34},{-80,34}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(Cvs.compliance, busConnector.venacavacompliance) annotation (
          Line(
          points={{-38,8},{-38,34},{-80,34}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end SystemicControl;

    model HeartControl
      extends Interfaces.Controlled.Heart;
      extends Parts.Heart(
        redeclare Types.Constants.FrequencyControl heartRate,
        ventricularElastance(useEs_extInput=true),
        atrialElastance1(useEs_extInput=false),
        ventricularElastance1(useEs_extInput=true),
        AOV(_Goff(displayUnit="ml/(mmHg.s)"), useLimitationInputs=false),
        MV(useLimitationInputs=false));

      Modelica.Blocks.Math.Sum sum1(nin=4)
        annotation (Placement(transformation(extent={{58,6},{78,26}})));
    equation
      connect(heartRate.c, busConnector.heartrate) annotation (Line(
          points={{-94.5,15},{-94.5,49.5},{-98,49.5},{-98,86}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(ventricularElastance.Es_ext, busConnector.rvcompliance)
        annotation (Line(
          points={{47.79,87.38},{28,87.38},{28,86},{-98,86}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(ventricularElastance1.Es_ext, busConnector.lvcompliance)
        annotation (Line(
          points={{-20.21,1.71},{82,1.71},{82,86},{-98,86}},
          color={128,255,0},
          smooth=Smooth.None,
          thickness=0.5), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(RV.volume, sum1.u[1]) annotation (Line(
          points={{32,32},{32,14.5},{56,14.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RA.volume, sum1.u[2]) annotation (Line(
          points={{-44,32},{-46,32},{-46,15.5},{56,15.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(LV.volume, sum1.u[3]) annotation (Line(
          points={{-22,-50},{-22,-72},{56,-72},{56,16.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(LA.volume, sum1.u[4]) annotation (Line(
          points={{46,-50},{46,-58},{56,-58},{56,17.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sum1.y, busConnector.heartBloodVolume) annotation (Line(
          points={{79,16},{82,16},{82,86},{-98,86}},
          color={127,255,0},
          smooth=Smooth.None,
          thickness=0.5), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end HeartControl;

    model AorticValveStenosisScenario
      extends Model.Scenario.StenosisControl(
        venacavastenosis(InitialElastance=1906510.1400345, FinalElastance=
              1906510.1400345),
        aorticstenosis(
          InitialResistance(displayUnit="(mmHg.s)/ml") = 266644.77483,
          FinalResistance(displayUnit="(mmHg.s)/ml") = 10665790.9932,
          duration=60),
        mitralvalvestenosis(InitialResistance=333305.9685375,
            FinalResistance=333305.9685375));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end AorticValveStenosisScenario;

    model AorticValveHeartControl
      extends HeartControl(AOV(useLimitationInputs=true));
    equation
      connect(AOV.Goff, busConnector.avbackflowconductance) annotation (
          Line(
          points={{-58,-50},{-58,-60},{-98,-60},{-98,86}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(AOV.Gon, busConnector.avoutflowresistance) annotation (Line(
          points={{-46,-50},{-46,-60},{-98,-60},{-98,86}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end AorticValveHeartControl;
  end ControlledParts;

  model StenosisAorticValve
    extends HemodynamicsBurkhoffBVControl(redeclare
        ControlledParts.AorticValveStenosisScenario scenarioControl(
          aorticstenosis(duration=60)), redeclare
        ControlledParts.AorticValveHeartControl heart);
    annotation (experiment(StopTime=120, __Dymola_NumberOfIntervals=5000));
  end StenosisAorticValve;

  model StenosisAorticValveWithoutControl
    extends StenosisAorticValve(shortTermControl(baroreceptor(
            activationDelay=1000)));
    annotation (experiment(StopTime=120, __Dymola_NumberOfIntervals=5000));
  end StenosisAorticValveWithoutControl;

  model Bleeding
    extends HemodynamicsBurkhoffBVControl(redeclare
        Scenario.BleedingTransfusionScenario scenarioControl(
        BloodTrans=0,
        Tbs=600,
        Tbd=300,
        BloodLoss=0.0005,
        Tts=1200,
        Ttd=600), longTermControl(redeclare
          Control.BloodVolume.PlasmaBleeding plasma, redeclare
          Control.BloodVolume.RBCBleeding redBloodCells));
    annotation (experiment(StopTime=3600, __Dymola_NumberOfIntervals=5000));
  end Bleeding;
  annotation (Documentation(info="<html>
<p>Model as presented in [1], reimplemented an extended.</p>
<p>[1]	Burkhoff D, Tyberg JV. Why does pulmonary venous pressure rise after onset of LV dysfunction: a theoretical analysis. Am J Physiol 1993;265:H1819&ndash;28.</p>
</html>"));
end Burkhoff;
