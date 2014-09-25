within ;
package SkeletalVO2Kinetics
  package Parts
    "Basic components needed to model the VO2 Kinetics, which are not in Physiolibrary"
    model Tube
      "Introduces time delay between output flow value from input flow values."
       extends Physiolibrary.Icons.SkeletalMuscle;
      extends AbstractSolute(port_in(q(start=1e-5)));

      Physiolibrary.Types.RealIO.VolumeFlowRateInput SolventFlowRate(start=1)
        "solvent volume flow rate (e.g. cardiac otput)" annotation (Placement(
            transformation(extent={{-44,38},{-4,78}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-14,62})));
      Physiolibrary.Types.RealIO.TimeOutput TD "time delay" annotation (Placement(
            transformation(extent={{-4,-46},{16,-26}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-8,-52})));
      parameter Physiolibrary.Types.Volume TubeVolume=0.002;
    equation
      //port_in.conc*CO=port_in.q;

      TD=TubeVolume/SolventFlowRate;
      port_out.q=-delay(port_in.q,TD);
      port_in.q = port_in.conc*SolventFlowRate;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Rectangle(
              extent={{-94,4},{90,-6}},
              fillPattern=FillPattern.Solid,
              fillColor={255,170,170},
              pattern=LinePattern.None)}),      Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end Tube;

    model SoluteElimination "Eliminates solute from the solvent."
      extends AbstractSolute;

      Physiolibrary.Types.RealIO.MolarFlowRateInput SoluteEliminationRate
        annotation (Placement(transformation(extent={{-20,2},{20,42}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-38,40})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput SolventFlowRate
        annotation (Placement(transformation(extent={{-20,2},{20,42}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={42,40})));

      Physiolibrary.Chemical.Interfaces.ChemicalPort_b
                                                     port_elim annotation (
          Placement(transformation(extent={{-164,-14},{-144,6}}),
            iconTransformation(extent={{-10,-30},{10,-10}})));
    equation
      port_elim.q = -min(port_in.conc*SolventFlowRate,SoluteEliminationRate);
      port_elim.q+port_out.q+port_in.q=0;
    //  port_in.conc = port_in.q/SolventFlowRate;
    //  port_out.conc = -port_out.q/SolventFlowRate;
      port_in.q = port_in.conc*SolventFlowRate;
      //port_out.q =-max(0, port_in.q - SoluteEliminationRate);//cannot eliminate more than it comes in
    // port_out.conc  = -port_out.q/SolventFlowRate; //concentration is positive
    //  port_in.conc = port_in.q/SolventFlowRate;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={Rectangle(
              extent={{-98,20},{100,-20}},
              lineColor={0,0,255},
              fillColor={0,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-62,10},{-58,6}},
              lineColor={0,0,255},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-18,20},{-14,16}},
              lineColor={0,0,255},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-58,20},{-54,16}},
              lineColor={0,0,255},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{42,12},{46,8}},
              lineColor={0,0,255},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-18,26},{-14,22}},
              lineColor={0,0,255},
              fillColor={170,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-58,28},{-54,24}},
              lineColor={0,0,255},
              fillColor={170,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{36,6},{40,2}},
              lineColor={0,0,255},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{46,4},{50,0}},
              lineColor={0,0,255},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{70,52},{84,38},{70,26},{70,38},{54,38},{54,42},{70,42},{70,52}},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end SoluteElimination;

    model Mixing "Mixes two solutes together."

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a port_a0
        "inflow of 1st solute"                                                        annotation (
          Placement(transformation(extent={{-108,4},{-88,24}}), iconTransformation(
              extent={{-108,40},{-88,60}})));
      Physiolibrary.Chemical.Interfaces.ChemicalPort_a port_a1
        "inflow of 2nd solute"                                                        annotation (
          Placement(transformation(extent={{-108,-24},{-88,-4}}),
            iconTransformation(extent={{-108,-60},{-88,-40}})));
      Physiolibrary.Chemical.Interfaces.ChemicalPort_b port_b
        "outflow of mixed solute"                                                       annotation (Placement(
            transformation(extent={{88,-8},{108,12}}), iconTransformation(extent={{88,
                -8},{108,12}})));
    equation
      port_a0.q+port_a1.q+port_b.q=0;
      port_a0.conc+port_a1.conc = 2*port_b.conc;
      port_a0.q*port_a1.conc+port_a1.q*port_a0.conc = (-port_b.q)/port_b.conc*port_a0.conc*port_a1.conc;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Ellipse(
              extent={{-94,50},{100,-48}},
              fillPattern=FillPattern.Solid,
              fillColor={170,213,255},
              pattern=LinePattern.None),
            Polygon(
              points={{-98,-40},{-86,-58},{-50,0},{-66,10},{-68,10},{-98,-40}},
              pattern=LinePattern.None,
              smooth=Smooth.None,
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-100,40},{-66,18},{-52,36},{-88,60},{-100,40}},
              smooth=Smooth.None,
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Polygon(
              points={{66,16},{80,2},{66,-10},{66,2},{50,2},{50,6},{66,6},{66,16}},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Polygon(
              points={{-42,32},{-34,28},{-30,20},{-32,8},{-36,4},{-36,20},{-38,26},{
                  -42,32}},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Polygon(
              points={{-6,14},{2,10},{6,2},{4,-10},{0,-14},{0,2},{-2,8},{-6,14}},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={-50,4},
              rotation=90,
              pattern=LinePattern.None),
            Polygon(
              points={{-6,14},{2,10},{6,2},{4,-10},{0,-14},{0,2},{-2,8},{-6,14}},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={-36,-10},
              rotation=180,
              pattern=LinePattern.None),
            Polygon(
              points={{-6,14},{2,10},{6,2},{4,-10},{0,-14},{0,2},{-2,8},{-6,14}},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={-22,4},
              rotation=270,
              pattern=LinePattern.None),
            Ellipse(
              extent={{-74,26},{-66,18}},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{-64,36},{-56,28}},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{-82,-18},{-76,-24}},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{-76,40},{-68,32}},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{-72,-8},{-66,-14}},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{-68,-22},{-62,-28}},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{6,4},{12,-2}},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{2,12},{10,4}},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{16,4},{24,-4}},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{24,8},{30,2}},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{32,12},{40,4}},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{42,6},{48,0}},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None)}),Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end Mixing;

  block VolumeConcToMolarConcentrationConst
      "Constant signal of type Concentration."
    extends Oxygen;
   parameter Real concentration
        "Constant Volume Concentration (0-1) output value";

        Physiolibrary.Types.RealIO.ConcentrationOutput y
        "Concentration constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
          iconTransformation(extent={{40,-10},{60,10}})));
  equation
        y=concentration*density/molarMass;
    annotation (defaultComponentName="concentration",
               Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
          coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
              graphics={
          Rectangle(extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
                radius=10,
            fillColor={236,236,236},
                            fillPattern=FillPattern.Solid),
          Text( extent={{-100,-44},{100,-64}},
            lineColor={0,0,0},
                    fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                textString="%name"),
          Text(         extent={{-40,10},{40,-10}},
            lineColor={0,0,0},
                fillColor={236,236,236},
            fillPattern=FillPattern.Solid,
                    textString="Const")}));
  end VolumeConcToMolarConcentrationConst;

    partial model AbstractSolute "Two port component, 
counts volume concentration from molar concentration of solute 
and molar mass and density."
      extends Oxygen;
      Real out_volume_conc;

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a port_in annotation (Placement(transformation(extent={{-110,
                -10},{-90,10}}), iconTransformation(extent={{-110,-10},{-90,10}})));
      Physiolibrary.Chemical.Interfaces.ChemicalPort_b port_out annotation (Placement(transformation(extent={{90,-10},
                {110,10}}),     iconTransformation(extent={{90,-12},{110,8}})));
    equation
      out_volume_conc=port_out.conc*molarMass/density;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end AbstractSolute;

    block Oxygen "Defined molar mass and density of oxygen at 37°C (?)."
     parameter Modelica.SIunits.Density density=1.26;
     parameter Modelica.SIunits.MolarMass molarMass=0.032;
    end Oxygen;

    model SkeletalVO2Kinetics_O2flow
      "Flow model, control signals must be delivered from input connectors."
      extends SkeletalVO2Icon;

      Physiolibrary.Chemical.Components.Substance muscleO2deox2
        annotation (Placement(transformation(extent={{-72,-30},{-52,-10}})));
      Physiolibrary.Chemical.Components.Substance muscleO2elim
        annotation (Placement(transformation(extent={{2,-30},{22,-10}})));
      Physiolibrary.Chemical.Components.Substance nonmuscleO2elim
        annotation (Placement(transformation(extent={{10,32},{30,52}})));
      Physiolibrary.Chemical.Components.Substance nonmuscleO2deox
        annotation (Placement(transformation(extent={{-22,10},{-2,30}})));
      Physiolibrary.Chemical.Sources.UnlimitedGasStorage unlimitedGasStorage1(
          PartialPressure=13865.52829116)
        annotation (Placement(transformation(extent={{24,62},{44,82}})));
      Physiolibrary.Chemical.Components.Substance O2Lungdeox
        annotation (Placement(transformation(extent={{-74,56},{-54,76}})));
      Physiolibrary.Chemical.Components.Clearance clearance(useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-52,80},{-32,100}})));
      Parts.Mixing mixing annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-64,38})));
      Physiolibrary.Chemical.Components.Stream Stream1(useSolutionFlowInput=true)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-62,12})));
      Physiolibrary.Chemical.Components.Stream Stream(useSolutionFlowInput=true)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-34,20})));
      Parts.SoluteElimination nonmuscleElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={14,18})));
      Parts.SoluteElimination muscleElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={12,-40})));
      Parts.Tube tube annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-28,-38})));
      Physiolibrary.Types.RealIO.MolarFlowRateInput muscleEliminationRate
        annotation (Placement(transformation(rotation=0, extent={{-24,-92},{-4,
                -72}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-4,-80})));
      Physiolibrary.Types.RealIO.MolarFlowRateInput nonMuscleEliminationRate
        annotation (Placement(transformation(
            rotation=180,
            extent={{-10,-10},{10,10}},
            origin={34,0}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-6,-26})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput nonMuscleFlowRate
        annotation (Placement(transformation(rotation=0, extent={{-40,-16},{-20,4}}),
                       iconTransformation(extent={{-40,-16},{-20,4}})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput muslceFlowRate(start=1)
        annotation (Placement(transformation(rotation=0, extent={{-38,-70},{-18,-50}}),
                        iconTransformation(extent={{-38,-70},{-18,-50}})));
      Modelica.Blocks.Math.Add add annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-87,91})));
    equation
      connect(nonmuscleElimination.port_in, unlimitedGasStorage1.q_out)
        annotation (Line(
          points={{24,18},{48,18},{48,20},{64,20},{64,72},{44,72}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleElimination.port_in, unlimitedGasStorage1.q_out)
        annotation (Line(
          points={{22,-40},{76,-40},{76,72},{44,72}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(nonmuscleElimination.port_elim, nonmuscleO2elim.q_out)
        annotation (Line(
          points={{14,20},{14,42},{20,42}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleElimination.port_elim, muscleO2elim.q_out) annotation (Line(
          points={{12,-38},{12,-20}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(mixing.port_b, O2Lungdeox.q_out) annotation (Line(
          points={{-64.2,47.8},{-64.2,56.9},{-64,56.9},{-64,66}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(tube.port_out, muscleO2deox2.q_out) annotation (Line(
          points={{-38,-37.8},{-62,-37.8},{-62,-20}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(O2Lungdeox.q_out, clearance.q_in) annotation (Line(
          points={{-64,66},{-64,90},{-52,90}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Stream.q_in, nonmuscleO2deox.q_out) annotation (Line(
          points={{-24,20},{-12,20}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Stream.q_out, mixing.port_a1) annotation (Line(
          points={{-44,20},{-52,20},{-52,28.2},{-59,28.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleO2deox2.q_out, Stream1.q_in) annotation (Line(
          points={{-62,-20},{-62,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Stream1.q_out, mixing.port_a0) annotation (Line(
          points={{-62,22},{-66,22},{-66,28.2},{-69,28.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Stream1.solutionFlow, tube.SolventFlowRate) annotation (Line(
          points={{-66,12},{-82,12},{-82,-44.2},{-26.6,-44.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscleElimination.port_out, tube.port_in) annotation (Line(
          points={{2,-39.8},{-8,-39.8},{-8,-38},{-18,-38}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(nonmuscleElimination.port_out, nonmuscleO2deox.q_out) annotation (
          Line(
          points={{4,18.2},{-4,18.2},{-4,20},{-12,20}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(nonMuscleFlowRate, nonmuscleElimination.SolventFlowRate)
        annotation (Line(points={{-30,-6},{9.8,-6},{9.8,14}},
                                                            color={0,0,127}));
      connect(muslceFlowRate, tube.SolventFlowRate) annotation (Line(points={{-28,-60},
              {-28,-44.2},{-64,-44.2},{-26.6,-44.2}},          color={0,0,127}));
      connect(nonMuscleEliminationRate, nonmuscleElimination.SoluteEliminationRate)
        annotation (Line(
          points={{34,0},{22,0},{22,14},{17.8,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscleEliminationRate, muscleElimination.SoluteEliminationRate)
        annotation (Line(
          points={{-14,-82},{24,-82},{24,-54},{15.8,-54},{15.8,-44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, clearance.solutionFlow) annotation (Line(
          points={{-81.5,91},{-60.75,91},{-60.75,94},{-42,94}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(add.u2, nonMuscleFlowRate) annotation (Line(
          points={{-93,88},{-96,88},{-96,-6},{-30,-6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.u1, muslceFlowRate) annotation (Line(
          points={{-93,94},{-98,94},{-98,-60},{-28,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(nonMuscleFlowRate, Stream.solutionFlow) annotation (Line(
          points={{-30,-6},{-30,-6},{-30,16},{-34,16}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(muslceFlowRate, muscleElimination.SolventFlowRate) annotation (
          Line(
          points={{-28,-60},{7.8,-60},{7.8,-44}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end SkeletalVO2Kinetics_O2flow;

    model Constant_scenario "Delivers constant signal of control parameters."

      Physiolibrary.Types.Constants.MolarFlowRateConst nonmuscleEliminationRate(k=0.0001)
        annotation (Placement(transformation(
            extent={{-10,-8},{10,8}},
            rotation=0,
            origin={-20,-50})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst nonmuscleflowrate(k=
            3.3333333333333e-05) annotation (Placement(transformation(
            extent={{-9,-9},{9,9}},
            rotation=0,
            origin={-23,51})));
      Physiolibrary.Types.Constants.MolarFlowRateConst muscleEliminationRate(k=
            0.00018333333333333) annotation (Placement(transformation(
            extent={{-9,-8},{9,8}},
            rotation=0,
            origin={-19,-74})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst muscleflowrate(k=5e-05)
        annotation (Placement(transformation(
            extent={{-8,-9},{8,9}},
            rotation=0,
            origin={-22,17})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput muscleflowrate_o
        annotation (Placement(transformation(rotation=0, extent={{10,8},{30,28}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={102,-38})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput nonmuscleflowrate_o
        annotation (Placement(transformation(rotation=0, extent={{10,48},{30,68}}),
            iconTransformation(extent={{92,30},{112,50}})));
      Physiolibrary.Types.RealIO.MolarFlowRateOutput nonmuscleeliminationrate_o
        annotation (Placement(transformation(rotation=0, extent={{10,-52},{30,
                -32}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={104,-2})));
      Physiolibrary.Types.RealIO.MolarFlowRateOutput muscleeliminationrate_o
        annotation (Placement(transformation(rotation=0, extent={{12,-82},{32,
                -62}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={104,-78})));
    equation
      connect(nonmuscleeliminationrate_o, nonmuscleEliminationRate.y)
        annotation (Line(points={{20,-42},{20,-50},{-7.5,-50}},  color={0,0,127}));
      connect(muscleeliminationrate_o, muscleEliminationRate.y) annotation (
          Line(points={{22,-72},{22,-74},{-7.75,-74}},  color={0,0,127}));
      connect(nonmuscleflowrate_o, nonmuscleflowrate.y) annotation (Line(points={{20,58},
              {20,51},{-11.75,51}},         color={0,0,127}));
      connect(muscleflowrate_o, muscleflowrate.y)
        annotation (Line(points={{20,18},{-12,18},{-12,17}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),            graphics={Rectangle(
              extent={{-90,96},{92,-98}},
              lineColor={0,0,127},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-28,26},{82,0}},
              lineColor={0,0,255},
              textString="non-muscle"),
            Text(
              extent={{-6,-52},{88,-78}},
              lineColor={0,0,255},
              textString="muscle"),
            Text(
              extent={{-6,92},{92,70}},
              lineColor={0,0,255},
              textString="Control")}),          Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end Constant_scenario;

    block SkeletalVO2Icon

      annotation (Icon(graphics={
            Bitmap(
              extent={{-32,20},{32,-20}},
              fileName=
                  "modelica://Physiolibrary/Resources/Icons/krevniRecisteTkaniKosterniSvaly.png",
              origin={14,-60},
              rotation=180),
            Bitmap(extent={{-22,20},{44,-34}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/krevniRecisteSiluetacloveka.png"),
            Bitmap(extent={{-22,56},{40,8}},  fileName=
                  "modelica://Physiolibrary/Resources/Icons/krevniRecistePlice.png"),
            Line(
              points={{40,32},{52,4},{40,-8},{52,-32},{48,-58},{38,-60}},
              smooth=Smooth.Bezier,
              color={255,0,0},
              thickness=1),
            Bitmap(extent={{2,64},{48,44}},   fileName=
                  "modelica://Physiolibrary/Resources/Icons/O2.png"),
            Line(
              points={{-20,-60},{-20,-42},{-10,-34},{-18,-8},{-18,6},{-10,12},{-20,
                  32}},
              color={200,0,120},
              thickness=1,
              smooth=Smooth.Bezier)}));

    end SkeletalVO2Icon;
  end Parts;

  package Model "elementar models of skeletal kinetics to simulate"
    model SkeletalVO2Kinetics_flat "Basic flat model, for test purposes."

      Physiolibrary.Chemical.Sources.UnlimitedGasStorage unlimitedGasStorage1(
          PartialPressure=13865.52829116)
        annotation (Placement(transformation(extent={{24,62},{44,82}})));
      Physiolibrary.Chemical.Components.Substance nonmuscleO2deox
        annotation (Placement(transformation(extent={{-22,10},{-2,30}})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k=3.3333333333333e-05)
        annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={54,-6})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate1(k=5e-05)
        annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={56,-66})));
      Parts.SoluteElimination nonmuscleElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={14,18})));
      Parts.SoluteElimination muscleElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={12,-40})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=0.0001)
                                 annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={30,4})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate2(k=
            0.00018333333333333) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={32,-52})));
      Physiolibrary.Chemical.Components.Substance nonmuscleO2elim
        annotation (Placement(transformation(extent={{10,32},{30,52}})));
      Physiolibrary.Chemical.Components.Substance muscleO2elim
        annotation (Placement(transformation(extent={{2,-30},{22,-10}})));
      Parts.Mixing mixing annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-64,38})));
      Parts.Tube tube annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-28,-38})));
      Physiolibrary.Chemical.Components.Substance O2Lungdeox
        annotation (Placement(transformation(extent={{-74,56},{-54,76}})));
      Modelica.Blocks.Math.Add add annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=90,
            origin={-89,31})));
      Physiolibrary.Chemical.Components.Substance muscleO2deox2
        annotation (Placement(transformation(extent={{-72,-30},{-52,-10}})));
      Physiolibrary.Chemical.Components.Clearance clearance(
          useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-52,80},{-32,100}})));
      Physiolibrary.Chemical.Components.Stream Stream(useSolutionFlowInput=true)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-34,20})));
      Physiolibrary.Chemical.Components.Stream Stream1(useSolutionFlowInput=
            true) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-62,12})));
    equation
      connect(volumeFlowRate1.y, muscleElimination.SolventFlowRate) annotation (
          Line(
          points={{51,-66},{7.8,-66},{7.8,-44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate.y, nonmuscleElimination.SolventFlowRate) annotation (
          Line(
          points={{49,-6},{9.8,-6},{9.8,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(molarFlowRate1.y, nonmuscleElimination.SoluteEliminationRate)
        annotation (Line(
          points={{25,4},{17.8,4},{17.8,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscleElimination.SoluteEliminationRate, molarFlowRate2.y)
        annotation (Line(
          points={{15.8,-44},{15.8,-52},{27,-52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(nonmuscleElimination.port_in, unlimitedGasStorage1.q_out)
        annotation (Line(
          points={{24,18},{48,18},{48,20},{64,20},{64,72},{44,72}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleElimination.port_in, unlimitedGasStorage1.q_out)
        annotation (Line(
          points={{22,-40},{76,-40},{76,72},{44,72}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(nonmuscleElimination.port_elim, nonmuscleO2elim.q_out)
        annotation (Line(
          points={{14,20},{14,42},{20,42}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleElimination.port_elim, muscleO2elim.q_out) annotation (Line(
          points={{12,-38},{12,-20}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(mixing.port_b, O2Lungdeox.q_out) annotation (Line(
          points={{-64.2,47.8},{-64.2,56.9},{-64,56.9},{-64,66}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(tube.SolventFlowRate, volumeFlowRate1.y) annotation (Line(
          points={{-26.6,-44.2},{-26.6,-66},{51,-66}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.u1, tube.SolventFlowRate) annotation (Line(
          points={{-92,25},{-92,-44.2},{-26.6,-44.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(tube.port_out, muscleO2deox2.q_out) annotation (Line(
          points={{-38,-37.8},{-62,-37.8},{-62,-20}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(O2Lungdeox.q_out, clearance.q_in) annotation (Line(
          points={{-64,66},{-64,90},{-52,90}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Stream.q_in, nonmuscleO2deox.q_out) annotation (Line(
          points={{-24,20},{-12,20}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Stream.q_out, mixing.port_a1) annotation (Line(
          points={{-44,20},{-52,20},{-52,28.2},{-59,28.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleO2deox2.q_out, Stream1.q_in) annotation (Line(
          points={{-62,-20},{-62,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Stream1.q_out, mixing.port_a0) annotation (Line(
          points={{-62,22},{-66,22},{-66,28.2},{-69,28.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Stream1.solutionFlow, tube.SolventFlowRate) annotation (Line(
          points={{-66,12},{-82,12},{-82,-44.2},{-26.6,-44.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscleElimination.port_out, tube.port_in) annotation (Line(
          points={{2,-39.8},{-8,-39.8},{-8,-38},{-18,-38}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(add.u2, nonmuscleElimination.SolventFlowRate) annotation (Line(
          points={{-86,25},{-86,-6},{9.8,-6},{9.8,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Stream.solutionFlow, nonmuscleElimination.SolventFlowRate)
        annotation (Line(
          points={{-34,16},{-34,-6},{9.8,-6},{9.8,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(clearance.solutionFlow, add.y) annotation (Line(
          points={{-42,94},{-42,98},{-89,98},{-89,36.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(nonmuscleElimination.port_out, nonmuscleO2deox.q_out) annotation (
         Line(
          points={{4,18.2},{-4,18.2},{-4,20},{-12,20}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),        graphics));
    end SkeletalVO2Kinetics_flat;

    model SkeletalVO2Kinetics
      "Basic model connecting flow and control components. Prepared for further experiments."

      Parts.SkeletalVO2Kinetics_O2flow skeletalVO2Kinetics_O2flow annotation (
          Placement(transformation(rotation=0, extent={{12,-58},{108,48}})));
      replaceable Parts.Constant_scenario skeletalVO2Kinetics_Control
        annotation (Placement(transformation(rotation=0, extent={{-68,-60},{10,
                20}})));
    equation
      connect(skeletalVO2Kinetics_Control.nonmuscleflowrate_o,
        skeletalVO2Kinetics_O2flow.nonMuscleFlowRate) annotation (Line(
          points={{10.78,-4},{11.2,-4},{11.2,-8.18},{45.6,-8.18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(skeletalVO2Kinetics_Control.muscleflowrate_o,
        skeletalVO2Kinetics_O2flow.muslceFlowRate) annotation (Line(
          points={{10.78,-35.2},{11.2,-35.2},{11.2,-36.8},{46.56,-36.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(skeletalVO2Kinetics_Control.muscleeliminationrate_o,
        skeletalVO2Kinetics_O2flow.muscleEliminationRate) annotation (Line(
          points={{11.56,-51.2},{20.82,-51.2},{20.82,-47.4},{58.08,-47.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(skeletalVO2Kinetics_Control.nonmuscleeliminationrate_o,
        skeletalVO2Kinetics_O2flow.nonMuscleEliminationRate) annotation (Line(
          points={{11.56,-20.8},{20,-20.8},{20,-18.78},{57.12,-18.78}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),        graphics), experiment(StopTime=240,
            __Dymola_NumberOfIntervals=5000));
    end SkeletalVO2Kinetics;




  end Model;

  package Test "Test components and models used during  development."
    model TestCardioInflow

      Physiolibrary.Chemical.Components.Substance o2_tissue
        annotation (Placement(transformation(extent={{24,-6},{44,14}})));
      Physiolibrary.Chemical.Components.Stream Stream(SolutionFlow=
            8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-10,-6},{10,14}})));
      Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage O2_lung(Conc=9.8)
        annotation (Placement(transformation(extent={{-30,66},{-10,86}})));
      Physiolibrary.Chemical.Components.Clearance clearance(Clearance=
            8.3333333333333e-05)
        annotation (Placement(transformation(extent={{62,-6},{82,14}})));
    equation
      connect(Stream.q_out, o2_tissue.q_out) annotation (Line(
          points={{10,4},{34,4}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(O2_lung.q_out, Stream.q_in) annotation (Line(
          points={{-10,76},{-10,4}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(o2_tissue.q_out, clearance.q_in) annotation (Line(
          points={{34,4},{62,4}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),        graphics));
    end TestCardioInflow;

    model testSkeletalVO2Kinetics

      Parts.SoluteElimination soluteElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-2,26})));
      CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow(port_in(conc(start=9.8)))
        annotation (Placement(transformation(extent={{-12,50},{8,70}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=
            0.00016666666666667) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={22,-6})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-96,58},{-78,74}})));
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
        annotation (Placement(transformation(extent={{-92,84},{-74,96}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{-70,-14},{-50,6}})));
      Modelica.Blocks.Sources.Constant const(k=0)
        annotation (Placement(transformation(extent={{-102,-22},{-82,-2}})));
    equation
      connect(molarFlowRate1.y, soluteElimination.SoluteEliminationRate)
        annotation (Line(
          points={{17,-6},{10,-6},{10,22},{1.8,22}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(volumeFlowRate.y, cardioPulmonarySoluteInFlow.solventflowrate)
        annotation (Line(
          points={{-75.75,66},{-62,66},{-62,80},{-2,80},{-2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(concentration.y, cardioPulmonarySoluteInFlow.outflowSoluteConcentration)
        annotation (Line(
          points={{-71.75,90},{3.2,90},{3.2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(volumeFlowRate.y, add.u1) annotation (Line(
          points={{-75.75,66},{-75.75,34},{-72,34},{-72,2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(const.y, add.u2) annotation (Line(
          points={{-81,-12},{-76,-12},{-76,-10},{-72,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, soluteElimination.SolventFlowRate) annotation (Line(
          points={{-49,-4},{-28,-4},{-28,-6},{-6.2,-6},{-6.2,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(soluteElimination.port_out, cardioPulmonarySoluteInFlow.port_in)
        annotation (Line(
          points={{-12,26.2},{-16,26.2},{-16,26},{-20,26},{-20,60},{-12.4,60}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(cardioPulmonarySoluteInFlow.port_out, soluteElimination.port_in)
        annotation (Line(
          points={{8,59.8},{26,59.8},{26,26},{8.4,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Ellipse(
              extent={{-36,38},{38,-34}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics),
        experiment(
          StopTime=60,
          Tolerance=0.1,
          __Dymola_fixedstepsize=1,
          __Dymola_Algorithm="Dassl"),
        __Dymola_experimentSetupOutput);
    end testSkeletalVO2Kinetics;

    model testSkeletalVO2Kinetics2

      Parts.SoluteElimination soluteElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-2,26})));
      CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow(port_in(conc(start=9.8)))
        annotation (Placement(transformation(extent={{-12,50},{8,70}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=
            8.3333333333333e-05) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={22,-6})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(
            displayUnit="ml/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-96,58},{-78,74}})));
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
        annotation (Placement(transformation(extent={{-92,84},{-74,96}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{-70,-14},{-50,6}})));
      Modelica.Blocks.Sources.Constant const(k=2)
        annotation (Placement(transformation(extent={{-102,-22},{-82,-2}})));
      Parts.Mixing mixing annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-34,42})));
      Physiolibrary.Chemical.Sources.UnlimitedSolutePump unlimitedSolutePump(
          SoluteFlow=3.6666666666667e-05)
        annotation (Placement(transformation(extent={{-64,12},{-44,32}})));
    equation
      connect(cardioPulmonarySoluteInFlow.port_out, soluteElimination.port_in)
        annotation (Line(
          points={{8,59.8},{34,59.8},{34,26},{8.4,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(molarFlowRate1.y, soluteElimination.SoluteEliminationRate)
        annotation (Line(
          points={{17,-6},{10,-6},{10,22},{1.8,22}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(volumeFlowRate.y, cardioPulmonarySoluteInFlow.solventflowrate)
        annotation (Line(
          points={{-75.75,66},{-62,66},{-62,80},{-2,80},{-2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(concentration.y, cardioPulmonarySoluteInFlow.outflowSoluteConcentration)
        annotation (Line(
          points={{-71.75,90},{3.2,90},{3.2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(volumeFlowRate.y, add.u1) annotation (Line(
          points={{-75.75,66},{-75.75,34},{-72,34},{-72,2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(const.y, add.u2) annotation (Line(
          points={{-81,-12},{-76,-12},{-76,-10},{-72,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, soluteElimination.SolventFlowRate) annotation (Line(
          points={{-49,-4},{-28,-4},{-28,-6},{-6.2,-6},{-6.2,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mixing.port_b, cardioPulmonarySoluteInFlow.port_in) annotation (
          Line(
          points={{-34.2,51.8},{-34.2,60},{-12.4,60}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(soluteElimination.port_out, mixing.port_a1) annotation (Line(
          points={{-12,26.2},{-29,26.2},{-29,32.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(mixing.solventflowrate, add.u1) annotation (Line(
          points={{-41.4,42},{-76,42},{-76,34},{-72,34},{-72,2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(unlimitedSolutePump.q_out, mixing.port_a) annotation (Line(
          points={{-44,22},{-39,22},{-39,32.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Ellipse(
              extent={{-36,38},{38,-34}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics),
        experiment(
          StopTime=60,
          Tolerance=0.1,
          __Dymola_fixedstepsize=1,
          __Dymola_Algorithm="Dassl"),
        __Dymola_experimentSetupOutput);
    end testSkeletalVO2Kinetics2;

    model testSkeletalVO2Kinetics3

      Parts.SoluteElimination soluteElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-2,26})));
      CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow(port_in(conc(start=9.8)))
        annotation (Placement(transformation(extent={{-12,50},{8,70}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=8.3333333333333e-05)
                                 annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={22,-6})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-96,58},{-78,74}})));
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
        annotation (Placement(transformation(extent={{-92,84},{-74,96}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{-74,-44},{-54,-24}})));
      Modelica.Blocks.Sources.Constant const(k=2)
        annotation (Placement(transformation(extent={{-106,-72},{-86,-52}})));
      Parts.Mixing mixing(port_a(conc(start=0.02))) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-32,42})));
      Physiolibrary.Chemical.Sources.UnlimitedSolutePump unlimitedSolutePump(
          SoluteFlow=3.6666666666667e-05,q_out(conc(start=0.33))) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-38,-18})));
      Parts.Tube tube(TubeVolume(displayUnit="l") = 0.002) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-38,12})));
      Modelica.Blocks.Math.Add add1(
                                   k2=-1)
        annotation (Placement(transformation(extent={{-68,2},{-48,22}})));
    equation
      connect(cardioPulmonarySoluteInFlow.port_out, soluteElimination.port_in)
        annotation (Line(
          points={{8,59.8},{34,59.8},{34,26},{8.4,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(molarFlowRate1.y, soluteElimination.SoluteEliminationRate)
        annotation (Line(
          points={{17,-6},{10,-6},{10,22},{1.8,22}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(volumeFlowRate.y, cardioPulmonarySoluteInFlow.solventflowrate)
        annotation (Line(
          points={{-75.75,66},{-62,66},{-62,80},{-2,80},{-2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(concentration.y, cardioPulmonarySoluteInFlow.outflowSoluteConcentration)
        annotation (Line(
          points={{-71.75,90},{3.2,90},{3.2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(const.y, add.u2) annotation (Line(
          points={{-85,-62},{-78,-62},{-78,-40},{-76,-40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, soluteElimination.SolventFlowRate) annotation (Line(
          points={{-53,-34},{-28,-34},{-28,-6},{-6.2,-6},{-6.2,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mixing.port_b, cardioPulmonarySoluteInFlow.port_in) annotation (Line(
          points={{-32.2,51.8},{-32.2,60},{-12.4,60}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(soluteElimination.port_out, mixing.port_a1) annotation (Line(
          points={{-12,26.2},{-27,26.2},{-27,32.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(unlimitedSolutePump.q_out, tube.port_in) annotation (Line(
          points={{-38,-8},{-38,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(tube.port_out, mixing.port_a) annotation (Line(
          points={{-38,21.8},{-36,21.8},{-36,32.2},{-37,32.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(add1.y, tube.SolventFlowRate) annotation (Line(
          points={{-47,12},{-44,12},{-44,12.6},{-42.2,12.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate.y, add1.u1) annotation (Line(
          points={{-75.75,66},{-76,66},{-76,18},{-70,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate.y, add.u1) annotation (Line(
          points={{-75.75,66},{-76,66},{-76,-28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate.y, mixing.solventflowrate) annotation (Line(
          points={{-75.75,66},{-76,66},{-76,42},{-39.4,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, add1.u2) annotation (Line(
          points={{-53,-34},{-52,-34},{-52,-12},{-70,-12},{-70,6}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Ellipse(
              extent={{-36,38},{38,-34}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics),
        experiment(
          StopTime=60,
          Tolerance=0.1,
          __Dymola_fixedstepsize=1,
          __Dymola_Algorithm="Dassl"),
        __Dymola_experimentSetupOutput);
    end testSkeletalVO2Kinetics3;

    model testSkeletalVO2Kinetics4

      Parts.SoluteElimination soluteElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-2,26})));
      CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow(port_in(conc(start=9.8)))
        annotation (Placement(transformation(extent={{-12,50},{8,70}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=
            0.00016666666666667) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={16,10})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-96,58},{-78,74}})));
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
        annotation (Placement(transformation(extent={{-92,84},{-74,96}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{-48,-16},{-28,4}})));
      Parts.SoluteElimination soluteElimination1
                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={0,-24})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate2(k=0.00035)
                                 annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={20,-40})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst flowdistribution(k(
            displayUnit="l/min") = 3.3333333333333e-05)
        annotation (Placement(transformation(extent={{-78,-44},{-60,-28}})));
    equation
      connect(molarFlowRate1.y, soluteElimination.SoluteEliminationRate)
        annotation (Line(
          points={{11,10},{10,10},{10,22},{1.8,22}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(volumeFlowRate.y, cardioPulmonarySoluteInFlow.solventflowrate)
        annotation (Line(
          points={{-75.75,66},{-62,66},{-62,80},{-2,80},{-2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(concentration.y, cardioPulmonarySoluteInFlow.outflowSoluteConcentration)
        annotation (Line(
          points={{-71.75,90},{3.2,90},{3.2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(add.y, soluteElimination.SolventFlowRate) annotation (Line(
          points={{-27,-6},{-6.2,-6},{-6.2,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(soluteElimination.port_out, cardioPulmonarySoluteInFlow.port_in)
        annotation (Line(
          points={{-12,26.2},{-16,26.2},{-16,26},{-20,26},{-20,60},{-12.4,60}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(cardioPulmonarySoluteInFlow.port_out, soluteElimination.port_in)
        annotation (Line(
          points={{8,59.8},{26,59.8},{26,26},{8.4,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(soluteElimination1.port_in, soluteElimination.port_in)
        annotation (Line(
          points={{10.4,-24},{26,-24},{26,26},{8.4,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(soluteElimination1.port_out, cardioPulmonarySoluteInFlow.port_in)
        annotation (Line(
          points={{-10,-23.8},{-16,-23.8},{-16,-24},{-20,-24},{-20,60},{-12.4,
              60}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));

      connect(soluteElimination1.SoluteEliminationRate, molarFlowRate2.y)
        annotation (Line(
          points={{3.8,-28},{4,-28},{4,-40},{15,-40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.u1, volumeFlowRate.y) annotation (Line(
          points={{-50,0},{-75.75,0},{-75.75,66}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowdistribution.y, add.u2) annotation (Line(
          points={{-57.75,-36},{-54,-36},{-54,-12},{-50,-12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowdistribution.y, soluteElimination1.SolventFlowRate)
        annotation (Line(
          points={{-57.75,-36},{-4.2,-36},{-4.2,-28}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Ellipse(
              extent={{-36,38},{38,-34}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics),
        experiment(
          StopTime=60,
          Tolerance=0.1,
          __Dymola_fixedstepsize=1,
          __Dymola_Algorithm="Dassl"),
        __Dymola_experimentSetupOutput);
    end testSkeletalVO2Kinetics4;

    model testSkeletalVO2Kinetics5

      CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow(port_in(conc(start=9.8)))
        annotation (Placement(transformation(extent={{50,42},{70,62}})));
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
        annotation (Placement(transformation(extent={{-30,76},{-12,88}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{6,18},{16,28}})));
      Parts.SoluteElimination muscleElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={62,-32})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate2(k=0.00035)
                                 annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={92,-84})));
      Modelica.Blocks.Math.Add add1(
                                   k2=-1)
        annotation (Placement(transformation(extent={{18,-38},{38,-58}})));
      Parts.Tube tube(SolventFlowRate(start=8.3333333333333e-05, displayUnit=
              "ml/min"), TubeVolume(displayUnit="l") = 0.002) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={48,0})));
      Parts.SoluteElimination nonMuscleElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={64,26})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=
            0.00016666666666667) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={74,6})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst FlowRateDistribution(k(
            displayUnit="l/min") = 3.3333333333333e-05)
        annotation (Placement(transformation(extent={{9,-8},{-9,8}},
            rotation=180,
            origin={-9,-42})));
      Modelica.Blocks.Sources.Ramp ramp(
        height=1,
        duration=30,
        offset=1,
        startTime=10)
        annotation (Placement(transformation(extent={{-94,26},{-74,46}})));
      Modelica.Blocks.Math.Product product1
        annotation (Placement(transformation(extent={{-56,42},{-36,62}})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate1(
                                                                       k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-94,56},{-76,72}})));
      Modelica.Blocks.Math.Product product2
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=90,
            origin={68,-68})));
    equation

      connect(concentration.y, cardioPulmonarySoluteInFlow.outflowSoluteConcentration)
        annotation (Line(
          points={{-9.75,82},{65.2,82},{65.2,56.2}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(add1.y, muscleElimination.SolventFlowRate) annotation (Line(
          points={{39,-48},{57.8,-48},{57.8,-36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscleElimination.port_out, tube.port_in) annotation (Line(
          points={{52,-31.8},{46,-31.8},{46,-10},{48,-10}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(tube.port_out, cardioPulmonarySoluteInFlow.port_in) annotation (
          Line(
          points={{48,9.8},{48,52},{49.6,52}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(cardioPulmonarySoluteInFlow.port_out, muscleElimination.port_in)
        annotation (Line(
          points={{70,51.8},{82,51.8},{82,-32},{72.4,-32}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(add1.y, tube.SolventFlowRate) annotation (Line(
          points={{39,-48},{40,-48},{40,0.6},{43.8,0.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(cardioPulmonarySoluteInFlow.port_out, nonMuscleElimination.port_in)
        annotation (Line(
          points={{70,51.8},{82,51.8},{82,26},{74.4,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(nonMuscleElimination.port_out, cardioPulmonarySoluteInFlow.port_in)
        annotation (Line(
          points={{54,26.2},{50,26.2},{50,26},{48,26},{48,52},{49.6,52}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(molarFlowRate1.y, nonMuscleElimination.SoluteEliminationRate)
        annotation (Line(
          points={{69,6},{67.8,6},{67.8,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, nonMuscleElimination.SolventFlowRate) annotation (Line(
          points={{16.5,23},{38.25,23},{38.25,22},{59.8,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ramp.y, product1.u2) annotation (Line(
          points={{-73,36},{-66,36},{-66,46},{-58,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate1.y, product1.u1) annotation (Line(
          points={{-73.75,64},{-66,64},{-66,58},{-58,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, cardioPulmonarySoluteInFlow.solventflowrate)
        annotation (Line(
          points={{-35,52},{4,52},{4,62},{60,62},{60,56.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, add.u1) annotation (Line(
          points={{-35,52},{-34,52},{-34,26},{5,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, add1.u1) annotation (Line(
          points={{-35,52},{-34,52},{-34,-54},{16,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(FlowRateDistribution.y, add1.u2) annotation (Line(
          points={{2.25,-42},{16,-42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.u2, tube.SolventFlowRate) annotation (Line(
          points={{5,20},{2,20},{2,0},{40,0},{40,0.6},{43.8,0.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product2.y, muscleElimination.SoluteEliminationRate) annotation (
          Line(
          points={{68,-57},{68,-36},{65.8,-36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(molarFlowRate2.y, product2.u2) annotation (Line(
          points={{87,-84},{80,-84},{80,-80},{74,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ramp.y, product2.u1) annotation (Line(
          points={{-73,36},{-68,36},{-68,-80},{62,-80},{62,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Ellipse(
              extent={{-36,38},{38,-34}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics),
        experiment(
          StopTime=60,
          Tolerance=0.1,
          __Dymola_fixedstepsize=1,
          __Dymola_Algorithm="Dassl"),
        __Dymola_experimentSetupOutput);
    end testSkeletalVO2Kinetics5;

    model testSkeletalVO2Kinetics6

      CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow(port_in(conc(start=9.8)))
        annotation (Placement(transformation(extent={{50,42},{70,62}})));
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
        annotation (Placement(transformation(extent={{-30,76},{-12,88}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{6,18},{16,28}})));
      Parts.SoluteElimination muscleElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={62,-32})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate2(k=0.00035)
                                 annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={92,-84})));
      Modelica.Blocks.Math.Add add1(
                                   k2=-1)
        annotation (Placement(transformation(extent={{18,-38},{38,-58}})));
      Parts.Tube tube(SolventFlowRate(start=8.3333333333333e-05, displayUnit=
              "ml/min"), TubeVolume(displayUnit="l") = 0.002) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={48,0})));
      Parts.SoluteElimination nonMuscleElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={64,26})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=
            0.00016666666666667) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={74,6})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst FlowRateDistribution(k(
            displayUnit="l/min") = 3.3333333333333e-05)
        annotation (Placement(transformation(extent={{9,-8},{-9,8}},
            rotation=180,
            origin={-9,-42})));
      Modelica.Blocks.Sources.Ramp ramp(
        height=1,
        duration=30,
        offset=1,
        startTime=10)
        annotation (Placement(transformation(extent={{-94,26},{-74,46}})));
      Modelica.Blocks.Math.Product product1
        annotation (Placement(transformation(extent={{-56,42},{-36,62}})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate1(
                                                                       k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-94,56},{-76,72}})));
      Modelica.Blocks.Math.Product product2
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=90,
            origin={68,-68})));
      Parts.Mixing mixing annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={34,36})));
    equation

      connect(concentration.y, cardioPulmonarySoluteInFlow.outflowSoluteConcentration)
        annotation (Line(
          points={{-9.75,82},{65.2,82},{65.2,56.2}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(add1.y, muscleElimination.SolventFlowRate) annotation (Line(
          points={{39,-48},{57.8,-48},{57.8,-36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscleElimination.port_out, tube.port_in) annotation (Line(
          points={{52,-31.8},{46,-31.8},{46,-10.4},{48,-10.4}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(cardioPulmonarySoluteInFlow.port_out, muscleElimination.port_in)
        annotation (Line(
          points={{70,51.8},{82,51.8},{82,-32},{72.4,-32}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(add1.y, tube.SolventFlowRate) annotation (Line(
          points={{39,-48},{40,-48},{40,-1.4},{41.8,-1.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(cardioPulmonarySoluteInFlow.port_out, nonMuscleElimination.port_in)
        annotation (Line(
          points={{70,51.8},{82,51.8},{82,26},{74.4,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(molarFlowRate1.y, nonMuscleElimination.SoluteEliminationRate)
        annotation (Line(
          points={{69,6},{67.8,6},{67.8,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, nonMuscleElimination.SolventFlowRate) annotation (Line(
          points={{16.5,23},{38.25,23},{38.25,22},{59.8,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ramp.y, product1.u2) annotation (Line(
          points={{-73,36},{-66,36},{-66,46},{-58,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate1.y, product1.u1) annotation (Line(
          points={{-73.75,64},{-66,64},{-66,58},{-58,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, cardioPulmonarySoluteInFlow.solventflowrate)
        annotation (Line(
          points={{-35,52},{4,52},{4,62},{60,62},{60,56.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, add.u1) annotation (Line(
          points={{-35,52},{-34,52},{-34,26},{5,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, add1.u1) annotation (Line(
          points={{-35,52},{-34,52},{-34,-54},{16,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(FlowRateDistribution.y, add1.u2) annotation (Line(
          points={{2.25,-42},{16,-42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.u2, tube.SolventFlowRate) annotation (Line(
          points={{5,20},{2,20},{2,0},{40,0},{40,-1.4},{41.8,-1.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product2.y, muscleElimination.SoluteEliminationRate) annotation (
          Line(
          points={{68,-57},{68,-36},{65.8,-36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(molarFlowRate2.y, product2.u2) annotation (Line(
          points={{87,-84},{80,-84},{80,-80},{74,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ramp.y, product2.u1) annotation (Line(
          points={{-73,36},{-68,36},{-68,-80},{62,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mixing.port_b, cardioPulmonarySoluteInFlow.port_in) annotation (
          Line(
          points={{33.8,45.8},{33.8,52},{49.6,52}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(product1.y, mixing.solventflowrate) annotation (Line(
          points={{-35,52},{-4,52},{-4,36},{26.6,36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(tube.port_out, mixing.port_a) annotation (Line(
          points={{48.2,10},{38,10},{38,10},{29,10},{29,26.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(mixing.port_a1, nonMuscleElimination.port_out) annotation (Line(
          points={{39,26.2},{46.5,26.2},{46.5,26.2},{54,26.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Ellipse(
              extent={{-36,38},{38,-34}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics),
        experiment(
          StopTime=60,
          Tolerance=0.1,
          __Dymola_fixedstepsize=1,
          __Dymola_Algorithm="Dassl"),
        __Dymola_experimentSetupOutput);
    end testSkeletalVO2Kinetics6;

    model testSkeletalVO2Kinetics7

      CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow(port_in(conc(start=9.8),
            q(start=0.03)))
        annotation (Placement(transformation(extent={{42,44},{62,64}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{6,4},{16,14}})));
      Parts.SoluteElimination muscleElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={82,-32})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate2(k=0.00035)
                                 annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={116,-86})));
      Modelica.Blocks.Math.Add add1(
                                   k2=-1)
        annotation (Placement(transformation(extent={{18,-38},{38,-58}})));
      Parts.Tube tube(   TubeVolume(displayUnit="l") = 0.002, SolventFlowRate(start=
             8.3333333333333e-05, displayUnit="ml/min"))      annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={42,-10})));
      Parts.SoluteElimination nonMuscleElimination(port_in(q(start=0.00028667166666667)))
                                                                                 annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={88,26})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=
            0.00016666666666667) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={100,-4})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst FlowRateDistribution(k(
            displayUnit="l/min") = 3.3333333333333e-05)
        annotation (Placement(transformation(extent={{9,-8},{-9,8}},
            rotation=180,
            origin={-9,-42})));
      Modelica.Blocks.Sources.Ramp ramp(
        offset=1,
        startTime=60,
        duration=10,
        height=2)
        annotation (Placement(transformation(extent={{-94,26},{-74,46}})));
      Modelica.Blocks.Math.Product product1
        annotation (Placement(transformation(extent={{-56,42},{-36,62}})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate1(
                                                                       k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-94,56},{-76,72}})));
      Modelica.Blocks.Math.Product product2
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=90,
            origin={98,-62})));
      Parts.Mixing mixing annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={28,36})));
      Parts.VolumeConcToMolarConcentrationConst concentration(
        density=1.26,
        molarMass=0.032,
        concentration=0.25)
        annotation (Placement(transformation(extent={{0,86},{20,100}})));
    equation

      connect(add1.y, muscleElimination.SolventFlowRate) annotation (Line(
          points={{39,-48},{77.8,-48},{77.8,-36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscleElimination.port_out, tube.port_in) annotation (Line(
          points={{72,-31.8},{40,-31.8},{40,-20},{42,-20}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(add1.y, tube.SolventFlowRate) annotation (Line(
          points={{39,-48},{34,-48},{34,-11.4},{35.8,-11.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(molarFlowRate1.y, nonMuscleElimination.SoluteEliminationRate)
        annotation (Line(
          points={{95,-4},{91.8,-4},{91.8,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ramp.y, product1.u2) annotation (Line(
          points={{-73,36},{-66,36},{-66,46},{-58,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate1.y, product1.u1) annotation (Line(
          points={{-73.75,64},{-66,64},{-66,58},{-58,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, add.u1) annotation (Line(
          points={{-35,52},{-34,52},{-34,12},{5,12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, add1.u1) annotation (Line(
          points={{-35,52},{-34,52},{-34,-54},{16,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(FlowRateDistribution.y, add1.u2) annotation (Line(
          points={{2.25,-42},{16,-42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.u2, tube.SolventFlowRate) annotation (Line(
          points={{5,6},{-6,6},{-6,-10},{34,-10},{34,-11.4},{35.8,-11.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product2.y, muscleElimination.SoluteEliminationRate) annotation (
          Line(
          points={{98,-51},{98,-36},{85.8,-36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ramp.y, product2.u1) annotation (Line(
          points={{-73,36},{-68,36},{-68,-74},{92,-74}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mixing.port_b, cardioPulmonarySoluteInFlow.port_in) annotation (
          Line(
          points={{27.8,45.8},{27.8,54},{42,54}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(product1.y, mixing.solventflowrate) annotation (Line(
          points={{-35,52},{-10,52},{-10,36},{20.6,36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, cardioPulmonarySoluteInFlow.solventflowrate) annotation (
          Line(
          points={{-35,52},{-40,52},{-40,66},{52,66},{52,58.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product2.u2, molarFlowRate2.y) annotation (Line(
          points={{104,-74},{104,-86},{111,-86}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(tube.port_out, mixing.port_a0) annotation (Line(
          points={{42.2,0},{42.2,16},{22,16},{22,26.2},{23,26.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(nonMuscleElimination.port_out, mixing.port_a1) annotation (Line(
          points={{78,26.2},{33,26.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(cardioPulmonarySoluteInFlow.port_out, nonMuscleElimination.port_in)
        annotation (Line(
          points={{62,53.8},{108,53.8},{108,26},{98,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleElimination.port_in, nonMuscleElimination.port_in) annotation (
          Line(
          points={{92,-32},{108,-32},{108,26},{98,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(concentration.y, cardioPulmonarySoluteInFlow.outflowSoluteConcentration)
        annotation (Line(
          points={{22.5,93},{57.2,93},{57.2,58.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, nonMuscleElimination.SolventFlowRate) annotation (Line(
          points={{16.5,9},{83.8,9},{83.8,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mixing.q1, nonMuscleElimination.SolventFlowRate) annotation (Line(
          points={{33.1,28.7},{52,28.7},{52,10},{83.8,9},{83.8,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mixing.q0, tube.SolventFlowRate) annotation (Line(
          points={{22.1,29.1},{18,29.1},{18,-10},{34,-10},{34,-11.4},{35.8,
              -11.4}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {220,120}}),            graphics={Ellipse(
              extent={{-36,38},{38,-34}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{220,120}}),
            graphics),
        experiment(
          StopTime=120,
          __Dymola_fixedstepsize=1,
          __Dymola_Algorithm="Dassl"),
        __Dymola_experimentSetupOutput);
    end testSkeletalVO2Kinetics7;

    model testMixing

      Parts.Mixing mixing
        annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
      Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage O2_muscle(Conc=4)
        annotation (Placement(transformation(extent={{-82,-44},{-62,-24}})));
      Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage O2_nonmuscle(Conc=3)
        annotation (Placement(transformation(extent={{-84,28},{-64,48}})));
      Physiolibrary.Chemical.Components.Substance o2mixed
        annotation (Placement(transformation(extent={{34,-8},{54,12}})));
      Physiolibrary.Chemical.Components.Stream Stream(                     SolutionFlow(displayUnit="l/min")=
             5e-05)
        annotation (Placement(transformation(extent={{-48,30},{-28,50}})));
      Physiolibrary.Chemical.Components.Stream Stream1(                     SolutionFlow(displayUnit="l/min")=
             3.3333333333333e-05)
        annotation (Placement(transformation(extent={{-40,-42},{-20,-22}})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate1(
                                                                       k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-20,62},{-2,78}})));
    equation
      connect(mixing.port_b, o2mixed.q_out) annotation (Line(
          points={{7.8,0.2},{26.9,0.2},{26.9,2},{44,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(O2_muscle.q_out, Stream1.q_in) annotation (Line(
          points={{-62,-34},{-52,-34},{-52,-32},{-40,-32}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Stream1.q_out, mixing.port_a1) annotation (Line(
          points={{-20,-32},{-16,-32},{-16,-5},{-11.8,-5}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(O2_nonmuscle.q_out, Stream.q_in) annotation (Line(
          points={{-64,38},{-56,38},{-56,40},{-48,40}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Stream.q_out, mixing.port_a) annotation (Line(
          points={{-28,40},{-20,40},{-20,5},{-11.8,5}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(volumeFlowRate1.y, mixing.solventflowrate) annotation (Line(
          points={{0.25,70},{0,70},{0,7.4},{-2,7.4}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end testMixing;

    model testMixing2

      Parts.Mixing mixing
        annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
      Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage O2_muscle(Conc=4)
        annotation (Placement(transformation(extent={{-82,-44},{-62,-24}})));
      Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage O2_nonmuscle(Conc=3)
        annotation (Placement(transformation(extent={{-84,28},{-64,48}})));
      Physiolibrary.Chemical.Components.Substance o2mixed
        annotation (Placement(transformation(extent={{34,-8},{54,12}})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate1(
                                                                       k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-20,62},{-2,78}})));
    equation
      connect(mixing.port_b, o2mixed.q_out) annotation (Line(
          points={{7.8,0.2},{26.9,0.2},{26.9,2},{44,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(volumeFlowRate1.y, mixing.solventflowrate) annotation (Line(
          points={{0.25,70},{0,70},{0,7.4},{-2,7.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(O2_muscle.q_out, mixing.port_a1) annotation (Line(
          points={{-62,-34},{-38,-34},{-38,-5},{-11.8,-5}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(O2_nonmuscle.q_out, mixing.port_a) annotation (Line(
          points={{-64,38},{-38,38},{-38,5},{-11.8,5}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end testMixing2;

    model testSkeletalVO2Kinetics8
      extends Parts.SkeletalVO2Icon;

      SkeletalO2Kinetics skeletalO2Kinetics annotation (Placement(transformation(
              rotation=0, extent={{-2,-48},{126,44}})));
      SkeletalO2Control skeletalO2Control annotation (Placement(transformation(
              rotation=0, extent={{-52,-58},{22,48}})));
    equation

      connect(skeletalO2Control.o2Conc, skeletalO2Kinetics.outflowLungO2Concentration)
        annotation (Line(
          points={{-6.63478,19.7333},{20.6826,19.7333},{20.6826,26.6222},{45.36,
              26.6222}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(skeletalO2Control.allFlowRate, skeletalO2Kinetics.allFlowRate)
        annotation (Line(
          points={{-1.16522,10.1429},{21.4174,10.1429},{21.4174,11.2889},{42.8,
              11.2889}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(skeletalO2Control.molarMuscleFlowRate, skeletalO2Kinetics.muscleEliminationRate)
        annotation (Line(
          points={{-7.92174,-32.7619},{9.03913,-32.7619},{9.03913,-27.5556},{30,
              -27.5556}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(skeletalO2Control.muscleFlowRate, skeletalO2Kinetics.muscleFlowRate)
        annotation (Line(
          points={{-3.41739,-41.8476},{19.2913,-41.8476},{19.2913,-36.7556},{
              45.36,-36.7556}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(skeletalO2Control.nonMuscleFlowRate, skeletalO2Kinetics.nonMuscleFlowRate)
        annotation (Line(
          points={{-2.13043,-15.6},{19.9348,-15.6},{19.9348,-11.2},{44.08,-11.2}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(skeletalO2Control.molarNonMuscleFlowRate, skeletalO2Kinetics.nonmuscleEliminationRate)
        annotation (Line(
          points={{-7.6,-3.99048},{9.2,-3.99048},{9.2,-2},{28.72,-2}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {220,120}}),            graphics),
                                                Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{220,120}}),
            graphics),
        experiment(
          StopTime=120,
          __Dymola_fixedstepsize=1,
          __Dymola_Algorithm="Dassl"),
        __Dymola_experimentSetupOutput);
    end testSkeletalVO2Kinetics8;

    model SkeletalO2Kinetics
      extends Parts.SkeletalVO2Icon;

      CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow(port_in(conc(start=9.8),
            q(start=0.03)))
        annotation (Placement(transformation(extent={{-28,36},{-8,56}})));
      MuscleElimination muscleElimination annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={12,-40})));
      Parts.Tube tube(TubeVolume(displayUnit="l") = 0.002, SolventFlowRate(start=8.3333333333333e-05,
            displayUnit="ml/min")) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-28,-18})));
      Parts.SoluteElimination nonMuscleElimination(port_in(q(start=0.00028667166666667)))
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={18,18})));
      Parts.Mixing mixing annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-42,28})));
      Physiolibrary.Types.RealIO.ConcentrationInput outflowLungO2Concentration
        annotation (Placement(transformation(
            rotation=180,
            extent={{-10,-10},{10,10}},
            origin={10,60}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-26,66})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput allFlowRate annotation (
          Placement(transformation(rotation=0, extent={{-66,48},{-46,68}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-30,36})));
      Physiolibrary.Types.RealIO.MolarFlowRateInput muscleEliminationRate
        annotation (Placement(transformation(rotation=180,
                                                         extent={{-10,-10},{10,10}},
            origin={28,-56}), iconTransformation(extent={{-60,-50},{-40,-30}})));

      Physiolibrary.Types.RealIO.MolarFlowRateInput nonmuscleEliminationRate
        annotation (Placement(transformation(rotation=0, extent={{2,-24},{22,-4}}),
            iconTransformation(extent={{-62,0},{-42,20}})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput nonMuscleFlowRate annotation (
          Placement(transformation(rotation=0, extent={{-26,-4},{-6,16}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-28,-8})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput muscleFlowRate(start=8.3333333333333e-05,
          displayUnit="ml/min") annotation (Placement(transformation(rotation=0,
              extent={{-58,-74},{-38,-54}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-26,-58})));
    equation
      connect(muscleElimination.port_out,tube. port_in) annotation (Line(
          points={{2,-39.8},{-30,-39.8},{-30,-28},{-28,-28}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(mixing.port_b,cardioPulmonarySoluteInFlow. port_in) annotation (
          Line(
          points={{-42.2,37.8},{-42.2,46},{-28,46}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(tube.port_out,mixing. port_a0) annotation (Line(
          points={{-27.8,-8},{-27.8,8},{-48,8},{-48,18.2},{-47,18.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(nonMuscleElimination.port_out,mixing. port_a1) annotation (Line(
          points={{8,18.2},{-37,18.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(cardioPulmonarySoluteInFlow.port_out,nonMuscleElimination. port_in)
        annotation (Line(
          points={{-8,45.8},{38,45.8},{38,18},{28,18}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleElimination.port_in,nonMuscleElimination. port_in) annotation (
          Line(
          points={{22,-40},{38,-40},{38,18},{28,18}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleFlowRate, muscleElimination.SolventFlowRate) annotation (Line(
            points={{-48,-64},{7.8,-64},{7.8,-46},{7.8,-44}}, color={0,0,127}));
      connect(nonmuscleEliminationRate, nonMuscleElimination.SoluteEliminationRate)
        annotation (Line(points={{12,-14},{21.8,-14},{21.8,14}},color={0,0,127}));
      connect(muscleFlowRate, tube.SolventFlowRate) annotation (Line(points={{-48,-64},
              {-36,-64},{-36,-19.4},{-34.2,-19.4}}, color={0,0,127}));
      connect(cardioPulmonarySoluteInFlow.solventflowrate, allFlowRate) annotation (
         Line(
          points={{-18,50.2},{-18,58},{-56,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(cardioPulmonarySoluteInFlow.outflowSoluteConcentration,
        outflowLungO2Concentration) annotation (Line(
          points={{-12.8,50.2},{-12.8,60},{10,60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(nonMuscleFlowRate, nonMuscleElimination.SolventFlowRate) annotation (
          Line(
          points={{-16,6},{13.8,6},{13.8,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mixing.solventflowrate, allFlowRate) annotation (Line(
          points={{-49.4,28},{-56,28},{-56,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscleEliminationRate, muscleElimination.SoluteEliminationRate)
        annotation (Line(
          points={{28,-56},{15.8,-56},{15.8,-44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mixing.q0, tube.SolventFlowRate) annotation (Line(
          points={{-47.9,21.1},{-52,21.1},{-52,-22},{-36,-22},{-36,-19.4},{-34.2,-19.4}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(mixing.q1, nonMuscleElimination.SolventFlowRate) annotation (Line(
          points={{-36.9,20.7},{-2,20.7},{-2,6},{13.8,6},{13.8,14}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(extent={{-100,-80},{100,100}},
              preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={{-100,
                -80},{100,100}}, preserveAspectRatio=false), graphics));
    end SkeletalO2Kinetics;

    model SkeletalO2Control

      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{24,8},{34,18}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarMuscleFlowRateConst(k=0.00035)
        annotation (Placement(transformation(
            extent={{-7,-7},{7,7}},
            rotation=0,
            origin={-83,-89})));
      Modelica.Blocks.Math.Add add1(k2=-1)
        annotation (Placement(transformation(extent={{6,0},{20,-14}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarNonMuscleFlowRateConst(
          k=0.00016666666666667) annotation (Placement(transformation(
            extent={{-8,-5},{8,5}},
            rotation=0,
            origin={4,-91})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst FlowRateDistribution(k(
            displayUnit="l/min") = 3.3333333333333e-05) annotation (Placement(
            transformation(
            extent={{7,-5},{-7,5}},
            rotation=180,
            origin={-15,-3})));
      Modelica.Blocks.Sources.Ramp ramp(
        offset=1,
        startTime=60,
        duration=10,
        height=1) annotation (Placement(transformation(extent={{-94,26},{-74,46}})));
      Modelica.Blocks.Math.Product product1
        annotation (Placement(transformation(extent={{-56,42},{-36,62}})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate1(k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-94,56},{-76,72}})));
      Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-54,-86})));
      Parts.VolumeConcToMolarConcentrationConst concentration(
        density=1.26,
        molarMass=0.032,
        concentration=0.27)
        annotation (Placement(transformation(extent={{-94,80},{-74,94}})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput nonMuscleFlowRate annotation (Placement(
            transformation(rotation=0, extent={{45.5,3.5},{68.5,24.5}}),
            iconTransformation(extent={{43.5,-26.5},{66.5,-5.5}})));
      Physiolibrary.Types.RealIO.ConcentrationOutput o2Conc annotation (Placement(
            transformation(rotation=0, extent={{-52.5,75.5},{-29.5,96.5}}),
            iconTransformation(extent={{29.5,43.5},{52.5,64.5}})));
      Physiolibrary.Types.RealIO.MolarFlowRateOutput molarNonMuscleFlowRate
        annotation (Placement(transformation(rotation=0, extent={{34.5,-103.5},{57.5,
                -82.5}}), iconTransformation(extent={{26.5,-3.5},{49.5,17.5}})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput allFlowRate annotation (Placement(
            transformation(rotation=0, extent={{48.5,40.5},{71.5,61.5}}),
            iconTransformation(extent={{46.5,24.5},{69.5,45.5}})));
      Physiolibrary.Types.RealIO.MolarFlowRateOutput molarMuscleFlowRate annotation (
          Placement(transformation(rotation=0, extent={{-30.5,-96.5},{-7.5,-75.5}}),
            iconTransformation(extent={{25.5,-60.5},{48.5,-39.5}})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput muscleFlowRate annotation (Placement(
            transformation(rotation=0, extent={{45.5,-16.5},{68.5,4.5}}),
            iconTransformation(extent={{39.5,-78.5},{62.5,-57.5}})));
    equation
      connect(ramp.y,product1. u2) annotation (Line(
          points={{-73,36},{-66,36},{-66,46},{-58,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate1.y,product1. u1) annotation (Line(
          points={{-73.75,64},{-66,64},{-66,58},{-58,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y,add. u1) annotation (Line(
          points={{-35,52},{-34,52},{-34,16},{23,16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y,add1. u1) annotation (Line(
          points={{-35,52},{-34,52},{-34,-11.2},{4.6,-11.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(FlowRateDistribution.y,add1. u2) annotation (Line(
          points={{-6.25,-3},{2,-3},{2,-2.8},{4.6,-2.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ramp.y,product2. u1) annotation (Line(
          points={{-73,36},{-68,36},{-68,-80},{-66,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product2.u2, molarMuscleFlowRateConst.y) annotation (Line(
          points={{-66,-92},{-74,-92},{-74,-89},{-74.25,-89}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(allFlowRate, product1.y) annotation (Line(points={{60,51},{-34,51},{-34,
              52},{-35,52}}, color={0,0,127}));
      connect(molarMuscleFlowRate, product2.y)
        annotation (Line(points={{-19,-86},{-43,-86}}, color={0,0,127}));
      connect(molarNonMuscleFlowRateConst.y, molarNonMuscleFlowRate) annotation (
          Line(
          points={{14,-91},{32,-91},{32,-93},{46,-93}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(concentration.y, o2Conc) annotation (Line(
          points={{-71.5,87},{-50.75,87},{-50.75,86},{-41,86}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.y, muscleFlowRate) annotation (Line(
          points={{20.7,-7},{44,-7},{44,-6},{57,-6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, nonMuscleFlowRate) annotation (Line(
          points={{34.5,13},{42.25,13},{42.25,14},{57,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.u2, add1.y) annotation (Line(
          points={{23,10},{20.7,10},{20.7,-7}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(extent={{-100,-100},{130,110}},
              preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={{
                -100,-100},{130,110}}, preserveAspectRatio=false), graphics={
            Rectangle(
              extent={{-100,74},{26,-86}},
              lineColor={0,0,127},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-96,38},{22,16}},
              lineColor={0,0,127},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Scenario.
0-59 s initial
60-70s ramp, rise CO
70s-.. steady
",            horizontalAlignment=TextAlignment.Left),
            Text(
              extent={{36,-32},{74,-46}},
              lineColor={0,0,127},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="muscle"),
            Text(
              extent={{38,22},{82,10}},
              lineColor={0,0,127},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="nonmuscle")}));
    end SkeletalO2Control;

    model TestCardioInflow3

      Physiolibrary.Chemical.Sources.UnlimitedGasStorage unlimitedGasStorage1(
          PartialPressure=13865.52829116)
        annotation (Placement(transformation(extent={{24,62},{44,82}})));
      Physiolibrary.Chemical.Components.Substance nonmuscleO2deox
        annotation (Placement(transformation(extent={{-32,8},{-12,28}})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k=3.3333333333333e-05)
        annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={54,-6})));
      Parts.SoluteElimination nonmuscleElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={14,18})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=0.00016666666666667)
                                 annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={30,4})));
      Physiolibrary.Chemical.Components.Substance nonmuscleO2deox1
        annotation (Placement(transformation(extent={{12,30},{32,50}})));
    equation
      connect(nonmuscleElimination.port_out, nonmuscleO2deox.q_out) annotation (
          Line(
          points={{4,18.2},{-16,18.2},{-16,18},{-22,18}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(volumeFlowRate.y, nonmuscleElimination.SolventFlowRate) annotation (
          Line(
          points={{49,-6},{9.8,-6},{9.8,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(molarFlowRate1.y, nonmuscleElimination.SoluteEliminationRate)
        annotation (Line(
          points={{25,4},{17.8,4},{17.8,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(nonmuscleElimination.port_in, unlimitedGasStorage1.q_out)
        annotation (Line(
          points={{24,18},{48,18},{48,20},{64,20},{64,72},{44,72}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(nonmuscleElimination.port_elim, nonmuscleO2deox1.q_out)
        annotation (Line(
          points={{14,20},{18,20},{18,40},{22,40}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),        graphics));
    end TestCardioInflow3;

    model TestCardioInflow4

      Physiolibrary.Chemical.Sources.UnlimitedGasStorage unlimitedGasStorage1(
          PartialPressure=13865.52829116)
        annotation (Placement(transformation(extent={{24,62},{44,82}})));
      Physiolibrary.Chemical.Components.Substance nonmuscleO2deox
        annotation (Placement(transformation(extent={{-32,8},{-12,28}})));
      Physiolibrary.Chemical.Components.Substance muscleO2deox
        annotation (Placement(transformation(extent={{-32,-50},{-12,-30}})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k=3.3333333333333e-05)
        annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={54,-6})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate1(k=5e-05)
        annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={56,-66})));
      Parts.SoluteElimination nonmuscleElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={14,18})));
      Parts.SoluteElimination muscleElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={12,-40})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=0.0001)
                                 annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={30,4})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate2(k=
            0.00018333333333333) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={32,-52})));
      Physiolibrary.Chemical.Components.Substance nonmuscleO2deox1
        annotation (Placement(transformation(extent={{4,32},{24,52}})));
      Physiolibrary.Chemical.Components.Substance muscleO2deox1
        annotation (Placement(transformation(extent={{2,-30},{22,-10}})));
    equation
      connect(nonmuscleElimination.port_out, nonmuscleO2deox.q_out) annotation (
          Line(
          points={{4,18.2},{-16,18.2},{-16,18},{-22,18}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleElimination.port_out, muscleO2deox.q_out) annotation (Line(
          points={{2,-39.8},{-16,-39.8},{-16,-40},{-22,-40}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(volumeFlowRate1.y, muscleElimination.SolventFlowRate) annotation (
          Line(
          points={{51,-66},{7.8,-66},{7.8,-44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate.y, nonmuscleElimination.SolventFlowRate) annotation (
          Line(
          points={{49,-6},{9.8,-6},{9.8,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(molarFlowRate1.y, nonmuscleElimination.SoluteEliminationRate)
        annotation (Line(
          points={{25,4},{17.8,4},{17.8,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscleElimination.SoluteEliminationRate, molarFlowRate2.y)
        annotation (Line(
          points={{15.8,-44},{15.8,-52},{27,-52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(nonmuscleElimination.port_in, unlimitedGasStorage1.q_out)
        annotation (Line(
          points={{24,18},{48,18},{48,20},{64,20},{64,72},{44,72}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleElimination.port_in, unlimitedGasStorage1.q_out)
        annotation (Line(
          points={{22,-40},{76,-40},{76,72},{44,72}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(nonmuscleElimination.port_elim, nonmuscleO2deox1.q_out)
        annotation (Line(
          points={{14,20},{14,42}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleElimination.port_elim, muscleO2deox1.q_out) annotation (
          Line(
          points={{12,-38},{12,-20}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),        graphics));
    end TestCardioInflow4;

    model TestCardioInflow51

      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate1(k=
            8.3333333333333e-05)
        annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={56,-66})));
      Parts.Tube tube(
        port_in(conc(start=0.5), q(start=3.3333333333333e-05)),
        SolventFlowRate(start=3.3333333333333e-05),
        TubeVolume=0.002)                       annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-64,-18})));
      Physiolibrary.Chemical.Components.Substance muscleO2deox2
        annotation (Placement(transformation(extent={{-72,-2},{-52,18}})));
      Physiolibrary.Chemical.Sources.UnlimitedGasStorage unlimitedGasStorage1(
          PartialPressure=13865.52829116)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=180,
            origin={6,-42})));
      Physiolibrary.Chemical.Components.Stream Stream(SolutionFlow=
            8.3333333333333e-05)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-32,-42})));
      Physiolibrary.Chemical.Components.Substance muscleO2deox1
        annotation (Placement(transformation(extent={{-66,-54},{-46,-34}})));
    equation
      connect(tube.SolventFlowRate, volumeFlowRate1.y) annotation (Line(
          points={{-70.2,-19.4},{-70.2,-66},{51,-66}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(tube.port_out, muscleO2deox2.q_out) annotation (Line(
          points={{-63.8,-8},{-62,-8},{-62,8}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Stream.q_in, unlimitedGasStorage1.q_out) annotation (Line(
          points={{-22,-42},{-4,-42}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Stream.q_out, muscleO2deox1.q_out) annotation (Line(
          points={{-42,-42},{-50,-42},{-50,-44},{-56,-44}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),        graphics));
    end TestCardioInflow51;

    model TestCardioInflow52

      Physiolibrary.Chemical.Sources.UnlimitedGasStorage unlimitedGasStorage1(
          PartialPressure=13865.52829116)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=180,
            origin={2,-20})));
      Physiolibrary.Chemical.Components.Substance muscleO2deox2
        annotation (Placement(transformation(extent={{-90,34},{-70,54}})));
      Physiolibrary.Chemical.Components.Substance muscleO2deox1
        annotation (Placement(transformation(extent={{-84,-26},{-64,-6}})));
      Physiolibrary.Chemical.Components.Stream Stream(SolutionFlow=
            3.3333333333333e-05) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-32,-18})));
      Physiolibrary.Chemical.Components.Stream Stream1(SolutionFlow=
            3.3333333333333e-05) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-74,14})));
    equation
      connect(unlimitedGasStorage1.q_out, Stream.q_in) annotation (Line(
          points={{-8,-20},{-16,-20},{-16,-18},{-22,-18}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Stream.q_out, muscleO2deox1.q_out) annotation (Line(
          points={{-42,-18},{-58,-18},{-58,-16},{-74,-16}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleO2deox1.q_out, Stream1.q_in) annotation (Line(
          points={{-74,-16},{-74,4}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Stream1.q_out, muscleO2deox2.q_out) annotation (Line(
          points={{-74,24},{-78,24},{-78,44},{-80,44}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),        graphics));
    end TestCardioInflow52;

    model TestCardioInflow53

      Physiolibrary.Chemical.Sources.UnlimitedGasStorage unlimitedGasStorage1(
          usePartialPressureInput=true, PartialPressure=13865.52829116)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=180,
            origin={2,-20})));
      Physiolibrary.Chemical.Components.Substance muscleO2deox2
        annotation (Placement(transformation(extent={{-62,54},{-42,74}})));
      Physiolibrary.Chemical.Components.Stream Stream(SolutionFlow=
            3.3333333333333e-05) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-32,-18})));
      Parts.Tube tube annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,14})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate1(k=
            8.3333333333333e-05)
        annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={-88,70})));
      Physiolibrary.Types.Constants.PressureConst pressure(k=13865.52829116)
        annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={66,-26})));
      Physiolibrary.Chemical.Components.Substance muscleO2deox1
        annotation (Placement(transformation(extent={{-72,-26},{-52,-6}})));
      Physiolibrary.Chemical.Components.Stream Stream1(SolutionFlow=
            3.3333333333333e-05) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-86,-16})));
    equation
      connect(unlimitedGasStorage1.q_out, Stream.q_in) annotation (Line(
          points={{-8,-20},{-16,-20},{-16,-18},{-22,-18}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(volumeFlowRate1.y, tube.SolventFlowRate) annotation (Line(
          points={{-93,70},{-96,70},{-96,12.6},{-86.2,12.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscleO2deox2.q_out, tube.port_out) annotation (Line(
          points={{-52,64},{-66,64},{-66,24},{-79.8,24}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(pressure.y, unlimitedGasStorage1.partialPressure) annotation (
          Line(
          points={{61,-26},{38,-26},{38,-20},{12,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Stream.q_out, muscleO2deox1.q_out) annotation (Line(
          points={{-42,-18},{-52,-18},{-52,-16},{-62,-16}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(muscleO2deox1.q_out, Stream1.q_in) annotation (Line(
          points={{-62,-16},{-76,-16}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Stream1.q_out, tube.port_in) annotation (Line(
          points={{-96,-16},{-88,-16},{-88,4},{-80,4}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),        graphics));
    end TestCardioInflow53;

    model CardioPulmonarySoluteInFlow
      extends Physiolibrary.Icons.Lungs;
      extends Parts.AbstractSolute;

      Physiolibrary.Types.RealIO.MolarFlowRateOutput soluteflowrate annotation (
          Placement(transformation(extent={{-82,22},{-42,62}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-62,42})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput solventflowrate annotation (
          Placement(transformation(extent={{-26,24},{14,64}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,42})));

        Physiolibrary.Types.RealIO.ConcentrationInput outflowSoluteConcentration annotation (Placement(transformation(extent={{52,30},{92,70}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={52,42})));
    equation
      //port_in.q + port_out.q + soluteflowrate = 0;
      port_out.q+soluteflowrate = 0; //expects that difusion is 100% and independent to inflow of molar flow rate
      //port_out.q = soluteflowrate;
      outflowSoluteConcentration = port_out.conc;
      soluteflowrate/port_out.conc = solventflowrate;
      //soluteflowrate/port_in.conc = solventflowrate;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={Rectangle(
              extent={{-94,6},{-64,-6}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid),
                                       Rectangle(
              extent={{36,6},{90,-6}},
              lineColor={0,0,255},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end CardioPulmonarySoluteInFlow;

    model PerfusionDeterminationFromCO

      Physiolibrary.Types.RealIO.VolumeFlowRateInput CO annotation (Placement(
            transformation(extent={{-38,36},{2,76}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-30,40})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput Qmusc annotation (
          Placement(transformation(extent={{-22,-52},{-2,-32}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-30,-32})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput Qremout annotation (Placement(
            transformation(extent={{-22,-52},{-2,-32}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={56,-32})));

      parameter Physiolibrary.Types.VolumeFlowRate Qrem;
    equation
      Qmusc= CO - Qrem;
      Qremout = Qrem;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Polygon(
              points={{-60,0},{-78,22},{82,22},{64,-2},{78,-20},{-78,-20},{-76,-20},
                  {-60,0}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}));
    end PerfusionDeterminationFromCO;

    model SkeletalVO2Kinetics

      Parts.Tube tube(
        TubeVolume(displayUnit="l") = 0.002,
        port_in(q(start=1.6666666666667e-05)),
        SolventFlowRate(start=8.3333333333333e-05, fixed=true)) annotation (
          Placement(transformation(
            extent={{-11,-12},{11,12}},
            rotation=90,
            origin={-36,13})));
      Test.PerfusionDeterminationFromCO perfusionDeterminationFromCO(Qrem(
            displayUnit="l/min") = 3.3333333333333e-05) annotation (Placement(
            transformation(
            extent={{15,-10},{-15,10}},
            rotation=180,
            origin={35,-36})));
      Parts.SoluteElimination soluteElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-2,26})));
      Parts.SoluteElimination soluteElimination1 annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={0,0})));
      Parts.Mixing mixing(port_b(q(start=8.3333333333333e-05))) annotation (
          Placement(transformation(
            extent={{-13,-31},{13,31}},
            rotation=90,
            origin={-33,49})));
      Test.CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow(port_in(conc(
              start=9.8)))
        annotation (Placement(transformation(extent={{-12,50},{8,70}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate(k=0.00035)
        annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={16,-18})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=
            0.00016666666666667) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={22,20})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-94,58},{-76,74}})));
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
        annotation (Placement(transformation(extent={{-92,84},{-74,96}})));
    equation
      connect(cardioPulmonarySoluteInFlow.port_out, soluteElimination.port_in)
        annotation (Line(
          points={{8,59.8},{34,59.8},{34,26},{8,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(soluteElimination1.port_in, soluteElimination.port_in)
        annotation (Line(
          points={{10,0},{34,0},{34,26},{8,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(soluteElimination1.port_out, tube.port_in) annotation (Line(
          points={{-10,0.2},{-24,0.2},{-24,2},{-36,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(tube.port_out, mixing.port_a) annotation (Line(
          points={{-36,23.78},{-48.5,23.78},{-48.5,36.26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(soluteElimination.port_out, mixing.port_a1) annotation (Line(
          points={{-12,26.2},{-20,26.2},{-20,26},{-17.5,26},{-17.5,36.26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(molarFlowRate.y, soluteElimination1.SoluteEliminationRate)
        annotation (Line(
          points={{11,-18},{3.8,-18},{3.8,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(molarFlowRate1.y, soluteElimination.SoluteEliminationRate)
        annotation (Line(
          points={{17,20},{10,20},{10,22},{1.8,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate.y, mixing.solventflowrate) annotation (Line(
          points={{-73.75,66},{-62,66},{-62,49},{-55.94,49}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate.y, perfusionDeterminationFromCO.CO) annotation (
          Line(
          points={{-73.75,66},{-62,66},{-62,-60},{32,-60},{32,-40},{30.5,-40}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(volumeFlowRate.y, cardioPulmonarySoluteInFlow.solventflowrate)
        annotation (Line(
          points={{-73.75,66},{-62,66},{-62,80},{-2,80},{-2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(concentration.y, cardioPulmonarySoluteInFlow.outflowSoluteConcentration)
        annotation (Line(
          points={{-71.75,90},{3.2,90},{3.2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(perfusionDeterminationFromCO.Qremout, soluteElimination.SolventFlowRate)
        annotation (Line(
          points={{43.4,-32.8},{43.4,8},{-6.2,8},{-6.2,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(perfusionDeterminationFromCO.Qmusc, soluteElimination1.SolventFlowRate)
        annotation (Line(
          points={{30.5,-32.8},{30.5,-28},{-4.2,-28},{-4.2,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(tube.SolventFlowRate, soluteElimination1.SolventFlowRate)
        annotation (Line(
          points={{-43.44,11.46},{-54,11.46},{-54,-28},{-4.2,-28},{-4.2,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mixing.port_b, cardioPulmonarySoluteInFlow.port_in) annotation (
          Line(
          points={{-33.62,61.74},{-22.81,61.74},{-22.81,60},{-12,60}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Ellipse(
              extent={{-36,38},{38,-34}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics),
        experiment(
          Tolerance=0.1,
          __Dymola_fixedstepsize=1,
          __Dymola_Algorithm="Dassl"),
        __Dymola_experimentSetupOutput);
    end SkeletalVO2Kinetics;

    model SoluteElimination_old

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a port_in annotation (
          Placement(transformation(extent={{-114,-10},{-94,10}}),
            iconTransformation(extent={{-114,-10},{-94,10}})));
      Physiolibrary.Chemical.Interfaces.ChemicalPort_b port_out(conc(start=1e-6)) annotation (
          Placement(transformation(extent={{90,-12},{110,8}}), iconTransformation(
              extent={{90,-12},{110,8}})));
      Physiolibrary.Types.RealIO.MolarFlowRateInput SoluteEliminationRate
        annotation (Placement(transformation(extent={{-20,2},{20,42}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-38,40})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput SolventFlowRate
        annotation (Placement(transformation(extent={{-20,2},{20,42}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={42,40})));
    equation
      -port_out.q = max(0,port_in.q - SoluteEliminationRate); //cannot eliminate more than it comes in
      port_out.conc = -port_out.q/SolventFlowRate; //concentration is positive
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Rectangle(
              extent={{-98,20},{100,-20}},
              lineColor={0,0,255},
              fillColor={0,255,255},
              fillPattern=FillPattern.Solid)}));
    end SoluteElimination_old;

    model CardioPulmonarySoluteInFlow_old

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a port_in annotation (
          Placement(transformation(extent={{-114,-10},{-94,10}}),
            iconTransformation(extent={{-114,-10},{-94,10}})));

      Physiolibrary.Chemical.Interfaces.ChemicalPort_b port_out(conc(start=1e-6)) annotation (
          Placement(transformation(extent={{90,-12},{110,8}}), iconTransformation(
              extent={{90,-12},{110,8}})));

      Physiolibrary.Types.RealIO.MolarFlowRateOutput soluteflowrate annotation (
          Placement(transformation(extent={{-82,22},{-42,62}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-62,42})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput solventflowrate annotation (
          Placement(transformation(extent={{-26,24},{14,64}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,42})));

        Physiolibrary.Types.RealIO.ConcentrationInput outflowSoluteConcentration annotation (Placement(transformation(extent={{52,30},{92,70}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={52,42})));
    equation
      //port_in.q + port_out.q + soluteflowrate = 0;
      port_out.q+soluteflowrate = 0; //expects that difusion is 100% and independent to inflow of molar flow rate
      //port_out.q = soluteflowrate;
      outflowSoluteConcentration = port_out.conc;
      soluteflowrate/port_out.conc = solventflowrate;
      //soluteflowrate/port_in.conc = solventflowrate;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={Rectangle(
              extent={{-98,20},{98,-20}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end CardioPulmonarySoluteInFlow_old;

    model MuscleElimination
      extends Parts.SoluteElimination;
      extends Physiolibrary.Icons.SkeletalMuscle;
    end MuscleElimination;

    model SoluteElimination_old2
      extends Parts.AbstractSolute;

      Physiolibrary.Types.RealIO.MolarFlowRateInput SoluteEliminationRate
        annotation (Placement(transformation(extent={{-20,2},{20,42}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-38,40})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput SolventFlowRate
        annotation (Placement(transformation(extent={{-20,2},{20,42}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={42,40})));

    equation
     port_out.q =-max(0, port_in.q - SoluteEliminationRate);//cannot eliminate more than it comes in
     port_out.conc  = -port_out.q/SolventFlowRate; //concentration is positive
    //  port_in.conc = port_in.q/SolventFlowRate;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Rectangle(
              extent={{-98,20},{100,-20}},
              lineColor={0,0,255},
              fillColor={0,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-62,10},{-58,6}},
              lineColor={0,0,255},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-18,20},{-14,16}},
              lineColor={0,0,255},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-58,20},{-54,16}},
              lineColor={0,0,255},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{42,12},{46,8}},
              lineColor={0,0,255},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-18,26},{-14,22}},
              lineColor={0,0,255},
              fillColor={170,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-58,28},{-54,24}},
              lineColor={0,0,255},
              fillColor={170,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{36,6},{40,2}},
              lineColor={0,0,255},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{46,4},{50,0}},
              lineColor={0,0,255},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{70,52},{84,38},{70,26},{70,38},{54,38},{54,42},{70,42},{70,52}},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None)}));
    end SoluteElimination_old2;

    model Mixing_old

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a port_a0 annotation (
          Placement(transformation(extent={{-108,4},{-88,24}}), iconTransformation(
              extent={{-108,40},{-88,60}})));
      Physiolibrary.Chemical.Interfaces.ChemicalPort_a port_a1 annotation (
          Placement(transformation(extent={{-108,-24},{-88,-4}}),
            iconTransformation(extent={{-108,-60},{-88,-40}})));
      Physiolibrary.Chemical.Interfaces.ChemicalPort_b port_b               annotation (Placement(
            transformation(extent={{88,-8},{108,12}}), iconTransformation(extent={{88,
                -8},{108,12}})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput solventflowrate annotation (
          Placement(transformation(extent={{-24,22},{16,62}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,74})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput q0 annotation (Placement(
            transformation(extent={{-24,22},{16,62}}), iconTransformation(
            extent={{-11,-11},{11,11}},
            rotation=270,
            origin={-69,59})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput q1 annotation (Placement(
            transformation(extent={{-24,22},{16,62}}), iconTransformation(
            extent={{-11,-11},{11,11}},
            rotation=90,
            origin={-73,-51})));
            Physiolibrary.Types.VolumeFlowRate vq0,vq1;

    equation
    //    port_a0.q = q0*port_a0.conc;
    //    port_a1.q = q1*port_a1.conc;
      if (port_a0.conc>Modelica.Constants.eps) then
        vq0 = (port_a0.q/port_a0.conc);
      else
        vq0 = q0; // numerically instable as conc may go to 0;
      end if;
      if (port_a1.conc>Modelica.Constants.eps) then
        vq1 = (port_a1.q/port_a1.conc);
      else
        vq1 = q1;
      end if;
      //q0+q1=solventflowrate
      port_b.conc = port_a0.conc/solventflowrate*vq0+port_a1.conc/solventflowrate*vq1;
      port_b.q = -port_b.conc*solventflowrate;

      //  port_b.conc = -port_b.q/solventflowrate; //concentration is positive
        port_b.q= -q0*port_a0.conc - q1*port_a1.conc; //?

    //  port_b.conc = -port_b.q/solventflowrate; //concentration is positive
      //port_a.q/port_a.conc + port_a1.q/port_a1.conc = solventflowrate;
    //  port_a0.q*port_a1.conc+port_a1.q*port_a0.conc = solventflowrate*port_a0.conc*port_a1.conc;
      //port_a.conc*solventflowrate+port_a1.conc*solventflowrate = port_b.conc*solventflowrate;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Ellipse(
              extent={{-94,50},{100,-48}},
              fillPattern=FillPattern.Solid,
              fillColor={170,213,255},
              pattern=LinePattern.None),
            Polygon(
              points={{-98,-40},{-86,-58},{-50,0},{-66,10},{-68,10},{-98,-40}},
              pattern=LinePattern.None,
              smooth=Smooth.None,
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-100,40},{-66,18},{-52,36},{-88,60},{-100,40}},
              smooth=Smooth.None,
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Polygon(
              points={{66,16},{80,2},{66,-10},{66,2},{50,2},{50,6},{66,6},{66,16}},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Polygon(
              points={{-42,32},{-34,28},{-30,20},{-32,8},{-36,4},{-36,20},{-38,26},{
                  -42,32}},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Polygon(
              points={{-6,14},{2,10},{6,2},{4,-10},{0,-14},{0,2},{-2,8},{-6,14}},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={-50,4},
              rotation=90,
              pattern=LinePattern.None),
            Polygon(
              points={{-6,14},{2,10},{6,2},{4,-10},{0,-14},{0,2},{-2,8},{-6,14}},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={-36,-10},
              rotation=180,
              pattern=LinePattern.None),
            Polygon(
              points={{-6,14},{2,10},{6,2},{4,-10},{0,-14},{0,2},{-2,8},{-6,14}},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={-22,4},
              rotation=270,
              pattern=LinePattern.None),
            Ellipse(
              extent={{-74,26},{-66,18}},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{-64,36},{-56,28}},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{-82,-18},{-76,-24}},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{-76,40},{-68,32}},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{-72,-8},{-66,-14}},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{-68,-22},{-62,-28}},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{6,4},{12,-2}},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{2,12},{10,4}},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{16,4},{24,-4}},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{24,8},{30,2}},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{32,12},{40,4}},
              fillColor={177,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{42,6},{48,0}},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None)}),Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end Mixing_old;
  end Test;

  package Experiment "Experiments, derived from elementary models and parts."
    model SkeletalVO2Kinetics_Exercise
      "Model derived from basic VO2Kinetics model replacing the basic scenario with exercise scenario."
      extends Model.SkeletalVO2Kinetics(redeclare Exercise_scenario
          skeletalVO2Kinetics_Control);
      annotation (experiment(StopTime=1200, __Dymola_NumberOfIntervals=5000),
          __Dymola_experimentSetupOutput);
    end SkeletalVO2Kinetics_Exercise;

    model Exercise_scenario
      "Excersice scenario, delivers signal during exercise and relax period."

      Physiolibrary.Types.Constants.MolarFlowRateConst nonmuscleEliminationRate(k=0.0001)
        annotation (Placement(transformation(
            extent={{-10,-8},{10,8}},
            rotation=0,
            origin={-24,-84})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst nonmuscleflowrate(k=
            3.3333333333333e-05) annotation (Placement(transformation(
            extent={{-9,-9},{9,9}},
            rotation=0,
            origin={-81,53})));
      Physiolibrary.Types.Constants.MolarFlowRateConst muscleEliminationRate(k=
            0.00018333333333333) annotation (Placement(transformation(
            extent={{-9,-8},{9,8}},
            rotation=0,
            origin={-79,-48})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst muscleflowrate(k=5e-05)
        annotation (Placement(transformation(
            extent={{-8,-9},{8,9}},
            rotation=0,
            origin={-78,13})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput muscleflowrate_o
        annotation (Placement(transformation(rotation=0, extent={{10,8},{30,28}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={20,-36})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput nonmuscleflowrate_o
        annotation (Placement(transformation(rotation=0, extent={{10,48},{30,68}}),
            iconTransformation(extent={{10,32},{30,52}})));
      Physiolibrary.Types.RealIO.MolarFlowRateOutput nonmuscleeliminationrate_o
        annotation (Placement(transformation(rotation=0, extent={{64,-86},{84,
                -66}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={42,0})));
      Physiolibrary.Types.RealIO.MolarFlowRateOutput muscleeliminationrate_o
        annotation (Placement(transformation(rotation=0, extent={{8,-58},{28,
                -38}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={42,-76})));
      Modelica.Blocks.Sources.Trapezoid trapezoid(
        amplitude=1,
        rising=10,
        falling=10,
        offset=1,
        width=100,
        startTime=240,
        period=360)
        annotation (Placement(transformation(extent={{-90,-32},{-70,-12}})));
      Modelica.Blocks.Math.Product product
        annotation (Placement(transformation(extent={{-44,-8},{-24,12}})));
      Modelica.Blocks.Math.Product product1
        annotation (Placement(transformation(extent={{-40,-48},{-20,-28}})));
    equation
      connect(nonmuscleeliminationrate_o, nonmuscleEliminationRate.y)
        annotation (Line(points={{74,-76},{74,-84},{-11.5,-84}}, color={0,0,127}));
      connect(nonmuscleflowrate_o, nonmuscleflowrate.y) annotation (Line(points=
             {{20,58},{20,53},{-69.75,53}}, color={0,0,127}));
      connect(trapezoid.y, product1.u1) annotation (Line(
          points={{-69,-22},{-56,-22},{-56,-32},{-42,-32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(trapezoid.y, product.u2) annotation (Line(
          points={{-69,-22},{-58,-22},{-58,-4},{-46,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscleflowrate.y, product.u1) annotation (Line(
          points={{-68,13},{-58,13},{-58,8},{-46,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y, muscleflowrate_o) annotation (Line(
          points={{-23,2},{-2,2},{-2,18},{20,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(muscleEliminationRate.y, product1.u2) annotation (Line(
          points={{-67.75,-48},{-55.875,-48},{-55.875,-44},{-42,-44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, muscleeliminationrate_o) annotation (Line(
          points={{-19,-38},{-4,-38},{-4,-48},{18,-48}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Rectangle(
              extent={{-98,82},{10,-96}},
              lineColor={0,0,127},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid), Text(
              extent={{-50,48},{2,40}},
              lineColor={0,0,127},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="From 120s exercise
From 240s relax ...
")}),                Diagram(coordinateSystem(preserveAspectRatio=false, extent=
               {{-100,-100},{100,100}}), graphics));
    end Exercise_scenario;
  end Experiment;
  annotation (uses(                                Modelica(version="3.2.1"),
        Physiolibrary(version="2.2.0")),
    version="1",
    conversion(from(version="", script="ConvertFromSkeletalVO2Kinetics_.mos")));
end SkeletalVO2Kinetics;
