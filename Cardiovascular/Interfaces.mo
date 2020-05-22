within Cardiovascular;
package Interfaces
  extends Modelica.Icons.InterfacesPackage;
  partial model Heart "Abstract heart circulation submodel"

  //   Physiolibrary.Types.Volume V "Volume";
    parameter Boolean useLVCannula = false;

    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rightHeartInflow
      annotation (Placement(transformation(extent={{-110,30},{-90,50}}),
          iconTransformation(extent={{-108,-30},{-88,-10}})));
    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b rightHeartOutflow
      annotation (Placement(transformation(extent={{90,30},{110,50}}),
          iconTransformation(extent={{-110,10},{-90,30}})));
    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a leftHeartInflow
      annotation (Placement(transformation(extent={{90,-30},{110,-10}}),
          iconTransformation(extent={{90,10},{110,30}})));
    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b leftHeartOutflow
      annotation (Placement(transformation(extent={{-110,-30},{-90,-10}}),
          iconTransformation(extent={{90,-28},{110,-8}})));
    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a LVCannula if useLVCannula
      annotation (Placement(transformation(extent={{40,-78},{60,-58}}),
          iconTransformation(extent={{72,-70},{92,-50}})));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),                                                                        graphics={Bitmap(extent={{-86,-106},{82,104}},
            fileName=
                "modelica://Cardiovascular/Resources/Icons/heartPict.png"),
            Text(
            extent={{-98,-78},{102,-112}},
            lineColor={190,0,0},
            lineThickness=1,
            textString="%name")}), Diagram(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}})));

  end Heart;

  partial model Systemic "Abstract systemic circulation submodel"
    extends Physiolibrary.Icons.SystemicCirculation;
    //  extends Physiolibrary.Hydraulic.Interfaces.OnePort;

  //   Physiolibrary.Types.Volume V "Total stressed blood volume of the systemic circulation";

    parameter Boolean useAortalCanulla = false;
    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a q_in annotation (
        Placement(transformation(extent={{90,-10},{110,10}}),
          iconTransformation(extent={{90,-10},{110,10}})));
    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b q_out annotation (
        Placement(transformation(extent={{-110,-10},{-90,10}}),
          iconTransformation(extent={{-110,-10},{-90,10}})));
    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a AortaCannulla if useAortalCanulla annotation (Placement(transformation(extent={{60,-100},{80,-80}}), iconTransformation(extent={{60,-100},{80,-80}})));

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics), Icon(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics={Text(
            extent={{-158,-50},{160,-82}},
            lineColor={0,0,255},
            lineThickness=1,
            textString="%name")}));
  end Systemic;

  partial model Pulmonary "Abstract pulmonary circulation submodel"
    extends Physiolibrary.Icons.PulmonaryCirculation;
    //  extends Physiolibrary.Hydraulic.Interfaces.OnePort;
  //   Physiolibrary.Types.Volume V "Total stressed blood volume of the pulmonary circulation";

    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a q_in annotation (
        Placement(transformation(extent={{-110,-10},{-90,10}}),
          iconTransformation(extent={{-108,-12},{-88,8}})));
    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b q_out annotation (
        Placement(transformation(extent={{90,-10},{110,10}}),
          iconTransformation(extent={{88,-16},{108,4}})));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-156,-38},{156,-64}},
            lineColor={0,0,255},
            lineThickness=1,
            textString="%name")}), Diagram(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics));
  end Pulmonary;

package Controlled
  extends Modelica.Icons.InterfacesPackage;
  partial model System
    "Interface for cardiovascular system controlled by short-term(baroreflex), long-term(blood volume) and pathologies(stenosis)"
    extends Cardiovascular.System(
        redeclare replaceable Pulmonary pulmonaryCirculation constrainedby
          Controlled.Pulmonary,
        redeclare replaceable Heart heart constrainedby Controlled.Heart,
        redeclare replaceable Systemic systemicCirculation constrainedby
          Controlled.Systemic);

    replaceable ShortTermControl shortTermControl
      annotation (Placement(transformation(extent={{-52,16},{-36,32}})));
    replaceable LongTermControl longTermControl
      annotation (Placement(transformation(extent={{-50,-12},{-30,8}})));
    replaceable ScenarioControl scenarioControl
      annotation (Placement(transformation(extent={{-50,-36},{-30,-16}})));
  equation
      connect(pulmonaryCirculation.busConnector, heart.busConnector)
        annotation (Line(
        points={{-8,25.2},{-14,25.2},{-14,26},{-18,26},{-18,-5.6},{-8.4,-5.6}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None));

      connect(systemicCirculation.busConnector, heart.busConnector)
        annotation (Line(
        points={{-7.6,-29},{-18,-29},{-18,-5.6},{-8.4,-5.6}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None));
      connect(shortTermControl.busConnector, heart.busConnector) annotation (
          Line(
        points={{-37.6,31.2},{-18,31.2},{-18,-5.6},{-8.4,-5.6}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None));
      connect(longTermControl.busConnector, heart.busConnector) annotation (
          Line(
        points={{-41.8,0.4},{-18,0.4},{-18,-5.6},{-8.4,-5.6}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None));
      connect(longTermControl.port_a, heart.rightHeartInflow) annotation (
          Line(
        points={{-30.6,-8},{-14,-8},{-14,-1.6},{-9.84,-1.6}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
      connect(scenarioControl.busConnector, heart.busConnector) annotation (
          Line(
        points={{-32,-17},{-18,-17},{-18,-5.6},{-8.4,-5.6}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
                {{-60,-40},{20,40}}), graphics));
  end System;

  model Pulmonary "Abstract controlled pulmonary circulation submodel"
    extends Cardiovascular.Interfaces.Pulmonary;
    Physiolibrary.Types.BusConnector busConnector annotation (Placement(
          transformation(extent={{-100,14},{-60,54}}), iconTransformation(
            extent={{-100,12},{-60,52}})));
  end Pulmonary;

  partial model Heart "Abstract controlled heart circulation submodel"
    extends Cardiovascular.Interfaces.Heart;
    Physiolibrary.Types.BusConnector busConnector annotation (Placement(
          transformation(extent={{-118,66},{-78,106}}), iconTransformation(
            extent={{-100,-90},{-60,-50}})));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
                {{-100,-100},{100,100}}), graphics));
  end Heart;

  model Systemic "Abstract controlled systemic circulation submodel"
    extends Cardiovascular.Interfaces.Systemic;
    Physiolibrary.Types.BusConnector busConnector annotation (Placement(
          transformation(extent={{-100,14},{-60,54}}), iconTransformation(
            extent={{-96,-50},{-56,-10}})));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
                {{-100,-100},{100,100}}), graphics));
  end Systemic;

  partial model LongTermControl
    "Abstract submodel of long-term volume control"

    Physiolibrary.Types.BusConnector busConnector annotation (Placement(
            transformation(extent={{0,-8},{40,32}}), iconTransformation(
              extent={{-38,4},{2,44}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a port_a annotation (
          Placement(transformation(extent={{84,-70},{104,-50}}),
          iconTransformation(extent={{84,-70},{104,-50}})));
    Model.Control.BloodVolume.VolumeRefill2 volumeRefill
      annotation (Placement(transformation(extent={{46,-38},{86,6}})));
  equation
    connect(volumeRefill.busConnector, busConnector) annotation (Line(
        points={{63.6,-7.64},{20,-7.64},{20,12}},
        color={0,0,255},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(volumeRefill.port_b, port_a) annotation (Line(
        points={{84.4,-35.8},{94,-35.8},{94,-60}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
                {{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={Bitmap(extent={{-80,-80},{82,80}}, fileName=
                "modelica://Physiolibrary/Resources/Icons/bloodProperties.png"),
              Text( extent={{-100,-62},{100,-100}},
            lineColor={0,0,255},
            textString="%name")}));
  end LongTermControl;

  partial model ShortTermControl
    "Abstract submodel of short-term CVS parameters values"

    Physiolibrary.Types.BusConnector busConnector annotation (Placement(
          transformation(extent={{-28,14},{12,54}}), iconTransformation(
            extent={{60,70},{100,110}})));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-80,-80},{80,80}},
              fileName=
              "modelica://Physiolibrary/Resources/Icons/baroreflex.png"),Text(
            extent={{-100,-80},{100,-118}},
            lineColor={0,0,255},
            textString="%name")}), Diagram(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics));

  end ShortTermControl;

  model ScenarioControl "Abstract submodel of possible scenarios"

    Physiolibrary.Types.BusConnector busConnector annotation (Placement(
          transformation(extent={{60,70},{100,110}}), iconTransformation(
            extent={{60,70},{100,110}})));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
            extent={{-96,80},{98,-60}},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
                    pattern=LinePattern.None),Text(
            extent={{-100,-60},{100,-98}},
            lineColor={0,0,255},
                    textString="%name"),Line(
            points={{-96,96},{-96,-60}},
            color={0,0,255},
                    smooth=Smooth.None),Line(
            points={{-96,-60},{98,-60}},
            color={0,0,255},
            smooth=Smooth.None,
                    arrow={Arrow.None,Arrow.Filled}),Text(
            extent={{-42,-62},{40,-68}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
                    textString="time")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
  end ScenarioControl;
end Controlled;
end Interfaces;
