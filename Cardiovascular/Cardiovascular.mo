within ;
package Cardiovascular
  model System

    replaceable Interfaces.Heart heart
      annotation (Placement(transformation(extent={{-10,-8},{6,8}})));
    replaceable Interfaces.Systemic systemicCirculation
      annotation (Placement(transformation(extent={{-10,-36},{10,-16}})));
    replaceable Interfaces.Pulmonary pulmonaryCirculation
      annotation (Placement(transformation(extent={{-10,12},{10,32}})));




  equation
    connect(systemicCirculation.q_out, heart.rightHeartInflow) annotation (Line(
        points={{-10,-26},{-14,-26},{-14,-1.6},{-9.84,-1.6}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(systemicCirculation.q_in, heart.leftHeartOutflow) annotation (Line(
        points={{10,-26},{12,-26},{12,-1.44},{6,-1.44}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(heart.leftHeartInflow, pulmonaryCirculation.q_out) annotation (Line(
        points={{6,1.6},{12,1.6},{12,21.4},{9.8,21.4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(heart.rightHeartOutflow, pulmonaryCirculation.q_in) annotation (
        Line(
        points={{-10,1.6},{-10,2},{-14,2},{-14,21.8},{-9.8,21.8}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-20,-40},{20,
              40}}), graphics),
      Icon(coordinateSystem(extent={{-20,-40},{20,40}}, preserveAspectRatio=
              false), graphics={Bitmap(extent={{-40,-40},{40,40}}, fileName=
                "modelica://Cardiovascular/Resources/Icons/cvsconcept.png")}),
      Documentation(info="<html>
<p>Architectural model of cardiovascular subsystems. The partial subsystems are meant to be redeclared by the implemented submodels.</p>
</html>"));
  end System;

  package UsersGuide "User's Guide"
    extends Modelica.Icons.Information;
  class Overview "Overview of Physiolibrary"
    extends Modelica.Icons.Information;
   annotation (Documentation(info="<html>
<p>The Cardiovascular library consists of the following main sub-libraries: </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Library Components</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>Interfaces</p></td>
<td valign=\"middle\"><p>Contains abstract representation (partial models) of pure cardiovascular system which should be implemented by the concrete instances of cardiovascular system.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>ControlInterfaces</p></td>
<td valign=\"middle\"><p>Contains controlled extension to the Interfaces. </p></td>
</tr>
<tr>
<td valign=\"top\"><p>Model</p></td>
<td valign=\"middle\"><p>Contains exemplar model implementation of cardiovascular system based on published work.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Examples</p></td>
<td valign=\"middle\"><p>Contains examples which are already part of other packages and libraries (Physiolibrary)</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Hydraulic</p></td>
<td valign=\"middle\"><p>Contains extension components of Physiolibrary.Hydraulic domain</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Osmotic</p></td>
<td valign=\"middle\"><p>Contains extension components of Physiolibrary.Osmotic domain</p></td>
</tr>
</table>
</html>"));
  end Overview;

    class ModelicaLicense2 "Modelica License 2"
      annotation (Documentation(info="<html>
<p>All files in the directory Cardiovascular) and in all subdirectories, especially all files that build package &quot;Cardiovascular&quot; are licensed by the authors of the article Lumped Models of the Cardiovascular System of Various Complexity under the <u><b>Modelica License 2 </b></u>(with exception of files &quot;Resources/*&quot;). </p>
<p><br>email to corresponding author: filip.jezek@fel.cvut.cz</p>
<h4>Copyright notices of the files:</h4>
<p>Copyright &copy; 2008-2017, Filip Jezek, Tomas Kulhanek, Karel Kaleck&yacute;, Jiř&iacute; Kofr&aacute;nek, Charles University in Prague, First Faculty of Medicine, Institute of Pathological Physiology</p>
<p><br>This package with all of its subpackages is released under the &ldquo;Modelica License 2&rdquo; (if not explicitly noted otherwise). </p>
<p><br><a href=\"#The_Modelica_License_2-outline\">The Modelica License 2</a></p>
<p><br><a href=\"#How_to_Apply_the_Modelica_License_2-outline\">How to Apply the Modelica License 2</a></p>
<p><br><a href=\"#Frequently_Asked_Questions-outline\">Frequently Asked Questions</a></p>
<p><br><b><span style=\"color: #008000;\">The Modelica License 2</span></b> </p>
<p><b><span style=\"font-size: 10pt;\">Preamble.</span></b> The goal of this license is that Modelica related model libraries, software, images, documents, data files etc. can be used freely in the original or a modified form, in open source and in commercial environments (as long as the license conditions below are fulfilled, in particular sections 2c) and 2d). The Original Work is provided free of charge and the use is completely at your own risk. Developers of free Modelica packages are encouraged to utilize this license for their work. </p>
<p>The Modelica License applies to any Original Work that contains the following licensing notice adjacent to the copyright notice(s) for this Original Work: </p>
<p><b>Licensed by Tomas Kulhanek under the Modelica License 2</b> </p>
<h4>1. Definitions.</h4>
<p>&ldquo;License&rdquo; is this Modelica License. </p>
<p>&ldquo;Original Work&rdquo; is any work of authorship, including software, images, documents, data files, that contains the above licensing notice or that is packed together with a licensing notice referencing it. </p>
<p>&ldquo;Licensor&rdquo; is the provider of the Original Work who has placed this licensing notice adjacent to the copyright notice(s) for the Original Work. The Original Work is either directly provided by the owner of the Original Work, or by a licensee of the owner. </p>
<p>&ldquo;Derivative Work&rdquo; is any modification of the Original Work which represents, as a whole, an original work of authorship. For the matter of clarity and as examples: </p>
<p>Derivative Work shall not include work that remains separable from the Original Work, as well as merely extracting a part of the Original Work without modifying it. </p>
<p>Derivative Work shall not include (a) fixing of errors and/or (b) adding vendor specific Modelica annotations and/or (c) using a subset of the classes of a Modelica package, and/or (d) using a different representation, e.g., a binary representation. </p>
<p>Derivative Work shall include classes that are copied from the Original Work where declarations, equations or the documentation are modified. </p>
<p>Derivative Work shall include executables to simulate the models that are generated by a Modelica translator based on the Original Work (of a Modelica package). </p>
<p>&ldquo;Modified Work&rdquo; is any modification of the Original Work with the following exceptions: (a) fixing of errors and/or (b) adding vendor specific Modelica annotations and/or (c) using a subset of the classes of a Modelica package, and/or (d) using a different representation, e.g., a binary representation. </p>
<p>&quot;Source Code&quot; means the preferred form of the Original Work for making modifications to it and all available documentation describing how to modify the Original Work. </p>
<p>&ldquo;You&rdquo; means an individual or a legal entity exercising rights under, and complying with all of the terms of, this License. </p>
<p>&ldquo;Modelica package&rdquo; means any Modelica library that is defined with the &ldquo;<b>package</b>&nbsp;&lt;Name&gt;&nbsp;...&nbsp;end&nbsp;&lt;Name&gt;;&rdquo; Modelica language element. </p>
<p><b>2. Grant of Copyright License.</b> Licensor grants You a worldwide, royalty-free, non-exclusive, sublicensable license, for the duration of the copyright, to do the following: </p>
<p>To reproduce the Original Work in copies, either alone or as part of a collection. </p>
<p>To create Derivative Works according to Section 1d) of this License. </p>
<p>To distribute or communicate to the public copies of the <u>Original Work</u> or a <u>Derivative Work</u> under <u>this License</u>. No fee, neither as a copyright-license fee, nor as a selling fee for the copy as such may be charged under this License. Furthermore, a verbatim copy of this License must be included in any copy of the Original Work or a Derivative Work under this License.</p>
<p>For the matter of clarity, it is permitted A) to distribute or communicate such copies as part of a (possible commercial) collection where other parts are provided under different licenses and a license fee is charged for the other parts only and B) to charge for mere printing and shipping costs. </p>
<p>To distribute or communicate to the public copies of a <u>Derivative Work</u>, alternatively to Section 2c), under <u>any other license</u> of your choice, especially also under a license for commercial/proprietary software, as long as You comply with Sections 3, 4 and 8 below. </p>
<p>For the matter of clarity, no restrictions regarding fees, either as to a copyright-license fee or as to a selling fee for the copy as such apply. </p>
<p>To perform the Original Work publicly. </p>
<p>To display the Original Work publicly. </p>
<p><b>3. Acceptance.</b> Any use of the Original Work or a Derivative Work, or any action according to either Section 2a) to 2f) above constitutes Your acceptance of this License. </p>
<p><b>4. Designation of Derivative Works and of Modified Works. </b>The identifying designation of Derivative Work and of Modified Work must be different to the corresponding identifying designation of the Original Work. This means especially that the (root-level) name of a Modelica package under this license must be changed if the package is modified (besides fixing of errors, adding vendor specific Modelica annotations, using a subset of the classes of a Modelica package, or using another representation, e.g. a binary representation). </p>
<p><b>5. Grant of Patent License.</b> Licensor grants You a worldwide, royalty-free, non-exclusive, sublicensable license, under patent claims owned by the Licensor or licensed to the Licensor by the owners of the Original Work that are embodied in the Original Work as furnished by the Licensor, for the duration of the patents, to make, use, sell, offer for sale, have made, and import the Original Work and Derivative Works under the conditions as given in Section 2. For the matter of clarity, the license regarding Derivative Works covers patent claims to the extent as they are embodied in the Original Work only. </p>
<p><b>6. Provision of Source Code.</b> Licensor agrees to provide You with a copy of the Source Code of the Original Work but reserves the right to decide freely on the manner of how the Original Work is provided.</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For the matter of clarity, Licensor might provide only a binary representation of the Original Work. In that case, You may (a) either reproduce the Source Code from the binary representation if this is possible (e.g., by performing a copy of an encrypted Modelica package, if encryption allows the copy operation) or (b) request the Source Code from the Licensor who will provide it to You. </p>
<p><b>7. Exclusions from License Grant.</b> Neither the names of Licensor, nor the names of any contributors to the Original Work, nor any of their trademarks or service marks, may be used to endorse or promote products derived from this Original Work without express prior permission of the Licensor. Except as otherwise expressly stated in this License and in particular in Sections 2 and 5, nothing in this License grants any license to Licensor&rsquo;s trademarks, copyrights, patents, trade secrets or any other intellectual property, and no patent license is granted to make, use, sell, offer for sale, have made, or import embodiments of any patent claims.</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No license is granted to the trademarks of Licensor even if such trademarks are included in the Original Work, except as expressly stated in this License. Nothing in this License shall be interpreted to prohibit Licensor from licensing under terms different from this License any Original Work that Licensor otherwise would have a right to license. </p>
<p><b>8. Attribution Rights.</b> You must retain in the Source Code of the Original Work and of any Derivative Works that You create, all author, copyright, patent, or trademark notices, as well as any descriptive text identified therein as an &quot;Attribution Notice&quot;. The same applies to the licensing notice of this License in the Original Work. For the matter of clarity, &ldquo;author notice&rdquo; means the notice that identifies the original author(s). </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You must cause the Source Code for any Derivative Works that You create to carry a prominent Attribution Notice reasonably calculated to inform recipients that You have modified the Original Work. </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In case the Original Work or Derivative Work is not provided in Source Code, the Attribution Notices shall be appropriately displayed, e.g., in the documentation of the Derivative Work. </p>
<h4>9. Disclaimer of Warranty. </h4>
<p><u>The Original Work is provided under this License on an &quot;as is&quot; basis and without warranty, either express or implied, including, without limitation, the warranties of non-infringement, merchantability or fitness for a particular purpose. The entire risk as to the quality of the Original Work is with You.</u> This disclaimer of warranty constitutes an essential part of this License. No license to the Original Work is granted by this License except under this disclaimer. </p>
<p><b>10. Limitation of Liability.</b> Under no circumstances and under no legal theory, whether in tort (including negligence), contract, or otherwise, shall the Licensor, the owner or a licensee of the Original Work be liable to anyone for any direct, indirect, general, special, incidental, or consequential damages of any character arising as a result of this License or the use of the Original Work including, without limitation, damages for loss of goodwill, work stoppage, computer failure or malfunction, or any and all other commercial damages or losses. This limitation of liability shall not apply to the extent applicable law prohibits such limitation. </p>
<p><b>11. Termination.</b> This License conditions your rights to undertake the activities listed in Section 2 and 5, including your right to create Derivative Works based upon the Original Work, and doing so without observing these terms and conditions is prohibited by copyright law and international treaty. Nothing in this License is intended to affect copyright exceptions and limitations. This License shall terminate immediately and You may no longer exercise any of the rights granted to You by this License upon your failure to observe the conditions of this license. </p>
<p><b>12. Termination for Patent Action.</b> This License shall terminate automatically and You may no longer exercise any of the rights granted to You by this License as of the date You commence an action, including a cross-claim or counterclaim, against Licensor, any owners of the Original Work or any licensee alleging that the Original Work infringes a patent. This termination provision shall not apply for an action alleging patent infringement through combinations of the Original Work under combination with other software or hardware. </p>
<p><b>13. Jurisdiction.</b> Any action or suit relating to this License may be brought only in the courts of a jurisdiction wherein the Licensor resides and under the laws of that jurisdiction excluding its conflict-of-law provisions. The application of the United Nations Convention on Contracts for the International Sale of Goods is expressly excluded. Any use of the Original Work outside the scope of this License or after its termination shall be subject to the requirements and penalties of copyright or patent law in the appropriate jurisdiction. This section shall survive the termination of this License. </p>
<p><b>14. Attorneys&rsquo; Fees.</b> In any action to enforce the terms of this License or seeking damages relating thereto, the prevailing party shall be entitled to recover its costs and expenses, including, without limitation, reasonable attorneys&apos; fees and costs incurred in connection with such action, including any appeal of such action. This section shall survive the termination of this License. </p>
<p><b>15. Miscellaneous.</b> </p>
<p>If any provision of this License is held to be unenforceable, such provision shall be reformed only to the extent necessary to make it enforceable. </p>
<p>No verbal ancillary agreements have been made. Changes and additions to this License must appear in writing to be valid. This also applies to changing the clause pertaining to written form. </p>
<p>You may use the Original Work in all ways not otherwise restricted or conditioned by this License or by law, and Licensor promises not to interfere with or be responsible for such uses by You. </p>
<p><br><b><span style=\"color: #008000;\">How to Apply the Modelica License 2</span></b> </p>
<p><span style=\"font-size: 10pt;\">At the top level of your Modelica package and at every important subpackage, add the following notices in the info layer of the package: </span></p>
<p>Licensed by &lt;Licensor&gt; under the Modelica License 2</p>
<p>Copyright &copy; &lt;year1&gt;-&lt;year2&gt;, &lt;name of copyright holder(s)&gt;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
<p>Include a copy of the Modelica License 2 under <b>&lt;library&gt;.UsersGuide.ModelicaLicense2</b> (use <a href=\"http://www.modelica.org/licenses/ModelicaLicense2.mo\">http://www.modelica.org/licenses/ModelicaLicense2.mo</a>). Furthermore, add the list of authors and contributors under <b>&lt;library&gt;.UsersGuide.Contributors</b> or <b>&lt;library&gt;.UsersGuide.Contact</b>. </p>
<p>For example, sublibrary Modelica.Blocks of the Modelica Standard Library may have the following notices: </p>
<p>Licensed by Modelica Association under the Modelica License 2</p>
<p>Copyright &copy; 1998-2008, Modelica Association. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
<p>For C-source code and documents, add similar notices in the corresponding file. </p>
<p>For images, add a &ldquo;readme.txt&rdquo; file to the directories where the images are stored and include a similar notice in this file. </p>
<p>In these cases, save a copy of the Modelica License 2 in one directory of the distribution, e.g., <a href=\"http://www.modelica.org/licenses/ModelicaLicense2.html\">http://www.modelica.org/licenses/ModelicaLicense2.html</a> in directory <b>&lt;library&gt;/Resources/Documentation/ModelicaLicense2.html</b>. </p>
<p><br><b><span style=\"font-size: 6pt; color: #008000;\">Frequently Asked Questions</span></b></p>
<p><span style=\"font-size: 10pt;\">This section contains questions/answer to users and/or distributors of Modelica packages and/or documents under Modelica License 2. Note, the answers to the questions below are not a legal interpretation of the Modelica License 2. In case of a conflict, the language of the license shall prevail. </span></p>
<p><b><span style=\"color: #008000;\">Using or Distributing a Modelica <u>Package</u> under the Modelica License 2</span></b> </p>
<p><b><span style=\"font-size: 10pt;\">What are the main differences to the previous version of the Modelica License?</span></b></p>
<ol>
<li>Modelica License 1 is unclear whether the licensed Modelica package can be distributed under a different license. Version 2 explicitly allows that &ldquo;Derivative Work&rdquo; can be distributed under any license of Your choice, see examples in Section 1d) as to what qualifies as Derivative Work (so, version 2 is clearer). </li>
<li>If You modify a Modelica package under Modelica License 2 (besides fixing of errors, adding vendor specific Modelica annotations, using a subset of the classes of a Modelica package, or using another representation, e.g., a binary representation), you must rename the root-level name of the package for your distribution. In version 1 you could keep the name (so, version 2 is more restrictive). The reason of this restriction is to reduce the risk that Modelica packages are available that have identical names, but different functionality. </li>
<li>Modelica License 1 states that &ldquo;It is not allowed to charge a fee for the original version or a modified version of the software, besides a reasonable fee for distribution and support&rdquo;. Version 2 has a similar intention for all Original Work under <u>Modelica License 2</u> (to remain free of charge and open source) but states this more clearly as &ldquo;No fee, neither as a copyright-license fee, nor as a selling fee for the copy as such may be charged&rdquo;. Contrary to version 1, Modelica License 2 has no restrictions on fees for Derivative Work that is provided under a different license (so, version 2 is clearer and has fewer restrictions). </li>
<li>Modelica License 2 introduces several useful provisions for the licensee (articles 5, 6, 12), and for the licensor (articles 7, 12, 13, 14) that have no counter part in version 1. </li>
<li>Modelica License 2 can be applied to all type of work, including documents, images and data files, contrary to version 1 that was dedicated for software only (so, version 2 is more general). </li>
</ol>
<h4>Can I distribute a Modelica package (under Modelica License 2) as part of my commercial Modelica modeling and simulation environment?</h4>
<p>Yes, according to Section 2c). However, you are not allowed to charge a fee for this part of your environment. Of course, you can charge for your part of the environment. </p>
<h4>Can I distribute a Modelica package (under Modelica License 2) under a different license?</h4>
<p>No. The license of an unmodified Modelica package cannot be changed according to Sections 2c) and 2d). This means that you cannot <u>sell</u> copies of it, any distribution has to be free of charge. </p>
<h4>Can I distribute a Modelica package (under Modelica License 2) under a different license when I first encrypt the package?</h4>
<p>No. Merely encrypting a package does not qualify for Derivative Work and therefore the encrypted package has to stay under Modelica License 2. </p>
<h4>Can I distribute a Modelica package (under Modelica License 2) under a different license when I first add classes to the package?</h4>
<p>No. The package itself remains unmodified, i.e., it is Original Work, and therefore the license for this part must remain under Modelica License 2. The newly added classes can be, however, under a different license. </p>
<p><b>Can I copy a class out of a Modelica package (under Modelica License 2) and include it <u>unmodified</u> in a Modelica package under a <u>commercial/proprietary license</u>?</b></p>
<p>No, according to article 2c). However, you can include model, block, function, package, record and connector classes in your Modelica package under <u>Modelica License 2</u>. This means that your Modelica package could be under a commercial/proprietary license, but one or more classes of it are under Modelica License 2.</p>
<p>Note, a &ldquo;type&rdquo; class (e.g., type Angle = Real(unit=&rdquo;rad&rdquo;)) can be copied and included unmodified under a commercial/proprietary license (for details, see the next question). </p>
<p><b>Can I copy a type class or <u>part</u> of a model, block, function, record, connector class, out of a Modelica package (under Modelica License 2) and include it modified or unmodified in a Modelica package under a <u>commercial/proprietary</u> license</b></p>
<p>Yes, according to article 2d), since this will in the end usually qualify as Derivative Work. The reasoning is the following: A type class or part of another class (e.g., an equation, a declaration, part of a class description) cannot be utilized &ldquo;by its own&rdquo;. In order to make this &ldquo;usable&rdquo;, you have to add additional code in order that the class can be utilized. This is therefore usually Derivative Work and Derivative Work can be provided under a different license. Note, this only holds, if the additional code introduced is sufficient to qualify for Derivative Work. Merely, just copying a class and changing, say, one character in the documentation of this class would be no Derivative Work and therefore the copied code would have to stay under Modelica License 2. </p>
<p><b>Can I copy a class out of a Modelica package (under Modelica License 2) and include it in <u>modified </u>form in a <u>commercial/proprietary</u> Modelica package?</b></p>
<p>Yes. If the modification can be seen as a &ldquo;Derivative Work&rdquo;, you can place it under your commercial/proprietary license. If the modification does not qualify as &ldquo;Derivative Work&rdquo; (e.g., bug fixes, vendor specific annotations), it must remain under Modelica License 2. This means that your Modelica package could be under a commercial/proprietary license, but one or more parts of it are under Modelica License 2. </p>
<h4>Can I distribute a &ldquo;save total model&rdquo; under my commercial/proprietary license, even if classes under Modelica License 2 are included?</h4>
<p>Your classes of the &ldquo;save total model&rdquo; can be distributed under your commercial/proprietary license, but the classes under Modelica License 2 must remain under Modelica License 2. This means you can distribute a &ldquo;save total model&rdquo;, but some parts might be under Modelica License 2. </p>
<h4>Can I distribute a Modelica package (under Modelica License 2) in encrypted form?</h4>
<p>Yes. Note, if the encryption does not allow &ldquo;copying&rdquo; of classes (in to unencrypted Modelica source code), you have to send the Modelica source code of this package to your customer, if he/she wishes it, according to article&nbsp;6. </p>
<h4>Can I distribute an executable under my commercial/proprietary license, if the model from which the executable is generated uses models from a Modelica package under Modelica License 2?</h4>
<p>Yes, according to article 2d), since this is seen as Derivative Work. The reasoning is the following: An executable allows the simulation of a concrete model, whereas models from a Modelica package (without pre-processing, translation, tool run-time library) are not able to be simulated without tool support. By the processing of the tool and by its run-time libraries, significant new functionality is added (a model can be simulated whereas previously it could not be simulated) and functionality available in the package is removed (e.g., to build up a new model by dragging components of the package is no longer possible with the executable). </p>
<h4>Is my modification to a Modelica package (under Modelica License 2) a Derivative Work?</h4>
<p>It is not possible to give a general answer to it. To be regarded as &quot;an original work of authorship&quot;, a derivative work must be different enough from the original or must contain a substantial amount of new material. Making minor changes or additions of little substance to a preexisting work will not qualify the work as a new version for such purposes. </p>
<p><b><span style=\"color: #008000;\">Using or Distributing a Modelica <u>Document</u> under the Modelica License 2</span></b> </p>
<p><span style=\"font-size: 10pt;\">This section is devoted especially for the following applications:</span></p>
<p>A Modelica tool extracts information out of a Modelica package and presents the result in form of a &ldquo;manual&rdquo; for this package in, e.g., html, doc, or pdf format. </p>
<p>The Modelica language specification is a document defining the Modelica language. It will be licensed under Modelica License 2. </p>
<p>Someone writes a book about the Modelica language and/or Modelica packages and uses information which is available in the Modelica language specification and/or the corresponding Modelica package. </p>
<h4>Can I sell a manual that was basically derived by extracting information automatically from a Modelica package under Modelica License 2 (e.g., a &ldquo;reference guide&rdquo; of the Modelica Standard Library):</h4>
<p>Yes. Extracting information from a Modelica package, and providing it in a human readable, suitable format, like html, doc or pdf format, where the content is significantly modified (e.g. tables with interface information are constructed from the declarations of the public variables) qualifies as Derivative Work and there are no restrictions to charge a fee for Derivative Work under alternative 2d). </p>
<p><b>Can I copy a text passage out of a Modelica document (under Modelica License 2) and use it <u>unmodified</u> in my document (e.g. the Modelica syntax description in the Modelica Specification)?</b></p>
<p>Yes. In case you distribute your document, the copied parts are still under Modelica License 2 and you are not allowed to charge a license fee for this part. You can, of course, charge a fee for the rest of your document. </p>
<p><b>Can I copy a text passage out of a Modelica document (under Modelica License 2) and use it in <u>modified</u> form in my document?</b></p>
<p>Yes, the creation of Derivative Works is allowed. In case the content is significantly modified this qualifies as Derivative Work and there are no restrictions to charge a fee for Derivative Work under alternative 2d). </p>
<h4>Can I sell a printed version of a Modelica document (under Modelica License 2), e.g., the Modelica Language Specification?</h4>
<p>No, if you are not the copyright-holder, since article 2c) does not allow a selling fee for a (in this case physical) copy. However, mere printing and shipping costs may be recovered.</p>
</html>"));
    end ModelicaLicense2;

  package ReleaseNotes "Release notes"
    extends Modelica.Icons.ReleaseNotes;
  class Version_1_0 "Version 1.0.0 (Jul 01, 2015)"
    extends Modelica.Icons.ReleaseNotes;
  annotation (Documentation(info="<html>
<p><ul>
<li>migration to GITHub https://github.com/TomasKulhanek/Physiolibrary.models/Cardiovascular</li>
<li><font style=\"color: #333333; \">The library uses the Modelica Standard Library (MSL) version 3.2. and Physiolibrary version 3.2</font></li>
<li><font style=\"color: #333333; \">Contains nice cardiovascular icons.</font></li>
</ul></p>
</html>"));
  end Version_1_0;

  class Version_2_0 "Version 2.0.0 (Aug 01, 2017)"
    extends Modelica.Icons.ReleaseNotes;
   annotation (Documentation(info="<html>
<ul>
<li>added the Complex model</li>
<li>Complex model is compatible with other simple models</li>
<li>Change and unification of icons</li>
</ul>
</html>"));
  end Version_2_0;
   annotation (Documentation(info="<html>
<p>This section summarizes the changes that have been performed on the Cardiovascular. </p>
</html>"));
  end ReleaseNotes;

  class NewRealease "Publishing new release"
    extends Modelica.Icons.Information;
   annotation (Documentation(info="<html>
<p><br>New release must be numbered by Semantic Versioning 2.0, see <a href=\"http://semver.org/\">semver.org</a>. </p>
<p><br>If minor version, then the conversion script must be written and connected with package Physiolibrary using &QUOT;annotation(conversion(from(version=..)))&QUOT;! </p>
<p><br>To clean the code from dummy annotations try to use script <a href=\"https://github.com/dietmarw/trimtrailingwhitespaces\">ttws</a>. </p>
<p><br>Update version number to &QUOT;X.Y.Z&QUOT;: </p>
<ul>
<li>At package Physiolibrary annotation: (version=&QUOT;X.Y.Z&QUOT;) together with &QUOT;versionBuild&QUOT;, &QUOT;versionDate&QUOT; and &QUOT;dateModified&QUOT; attribute </li>
<li>At head of package Physiolibrary &QUOT;Physiological domains library (version X.Y.Z)&QUOT; </li>
<li>At file &QUOT;./Physiolibrary/libraryinfo.mos&QUOT; </li>
</ul>
<p><br>Update release notes: </p>
<ul>
<li>At UsersGuide.ReleaseNotes</li>
<li>At file &QUOT;./README.md&QUOT;, together with update of &QUOT;Current release&QUOT; section.</li>
</ul>
<p><br>Publish release in GitHub: </p>
<ul>
<li>Prepare release in &QUOT;master&QUOT; branch</li>
<li>Install, Check, Test, Test, Test (stop-time of examples).. </li>
<li>Delete branch &QUOT;release&QUOT; </li>
<li>Create new branch &QUOT;release&QUOT; from &QUOT;master&QUOT; branch </li>
<li>Rename directory &QUOT;Physiolibrary&QUOT; in release branch to directory &QUOT;Physiolibrary X.Y.Z&QUOT; </li>
<li>Commint and Push </li>
<li>Draft a new release from &QUOT;release&QUOT; branch with number &QUOT;vX.Y.Z&QUOT; and with release notes. </li>
</ul>
</html>"));
  end NewRealease;

  class Contact "Contact"
    extends Modelica.Icons.Contact;
   annotation (Documentation(info="<html>
<p>Tomas Kulhanek</p>
<p>email: tomas.kulhanek@matfyz.cz</p>
</html>"));
  end Contact;
  annotation (__Dymola_DocumentationClass=true, Documentation(info="<html>
<p>Package Cardiovascular is a modelica package for <b>Human Physiology</b> that provides constants, types, connectors, partial models and model components fitted for physiological models of cardiovascular system and some control mechanism. </p>
<p>It contains complementar models to the cardiovascular system in complex parametric model of human physiology Physiomodel.</p>
<p>Up-to-date version could be found at https://github.com/filip-jezek/Physiolibrary.models</p>
</html>"));
  end UsersGuide;

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

  package Model
    extends Modelica.Icons.ExamplesPackage;
    package Meurs
        extends Modelica.Icons.ExamplesPackage;
      model HemodynamicsMeurs_shallow
        extends Cardiovascular.Icons.Runnable_Shallow;

        Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryArteries(
          useV0Input=false,
          useComplianceInput=false,
          volume_start=0.000106,
          ZeroPressureVolume=5e-05,
          Compliance=3.2185142219537e-08,
          useExternalPressureInput=true,
          ExternalPressure=-533.28954966)
          annotation (Placement(transformation(extent={{-94,84},{-68,110}})));
        Physiolibrary.Hydraulic.Components.Conductor
          PulmonaryArteriesResistance(useConductanceInput=false, Conductance(
              displayUnit="ml/(mmHg.s)") = 6.818059724437e-08)
          annotation (Placement(transformation(extent={{-56,85},{-22,111}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryVeins(
          useV0Input=false,
          useComplianceInput=false,
          volume_start=0.000518,
          ZeroPressureVolume=0.00035,
          Compliance=1.6486353437088e-07,
          useExternalPressureInput=true,
          ExternalPressure=-533.28954966)
          annotation (Placement(transformation(extent={{-10,86},{14,110}})));
        Physiolibrary.Hydraulic.Components.Conductor PulmonaryVeinResistance(
            useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
               2.4999552322936e-06)
          annotation (Placement(transformation(extent={{26,86},{56,110}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel LeftAtrium(
          useComplianceInput=true,
          useV0Input=false,
          volume_start=9.31e-05,
          ZeroPressureVolume=3e-05,
          useExternalPressureInput=true,
          ExternalPressure=-533.28954966)
          annotation (Placement(transformation(extent={{74,50},{102,78}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel LeftVentricle(
          useComplianceInput=true,
          useV0Input=false,
          volume_start=0.000144,
          ZeroPressureVolume=6e-05,
          useExternalPressureInput=true,
          ExternalPressure=-533.28954966)
          annotation (Placement(transformation(extent={{148,48},{178,78}})));
        Physiolibrary.Hydraulic.Components.IdealValve ventricleArteryValve(
          _Gon(displayUnit="ml/(mmHg.s)") = 9.3757696980707e-07,
          _Goff(displayUnit="ml/(mmHg.s)") = 0,
          useLimitationInputs=false)
          annotation (Placement(transformation(extent={{184,76},{208,52}})));
        Parts.AtrialElastance atrialElastance(EMIN=15998686.4898, EMAX=
              37330268.4762)
          annotation (Placement(transformation(extent={{80,94},{118,126}})));
        Parts.VentricularElastance ventricularElastance(EMIN=11999014.86735,
            EMAX=533289549.66)
          annotation (Placement(transformation(extent={{164,92},{200,124}})));
        Physiolibrary.Hydraulic.Components.IdealValve atrioVentricleValve(
          _Gon(displayUnit="ml/(mmHg.s)") = 2.4999552322936e-06,
          useLimitationInputs=false,
          _Goff(displayUnit="ml/(mmHg.s)") = 0) annotation (Placement(visible=
                true, transformation(
              origin={127,64},
              extent={{-13,12},{13,-12}},
              rotation=0)));
        Physiolibrary.Hydraulic.Components.ElasticVessel IntraThoracicArteries(
          useV0Input=false,
          useComplianceInput=false,
          useExternalPressureInput=true,
          volume_start=0.000204,
          ZeroPressureVolume=0.00014,
          Compliance=5.2429304151611e-09,
          ExternalPressure=-533.28954966)
          annotation (Placement(transformation(extent={{168,6},{190,28}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel ExtrathoracicArteries(
          volume_start(displayUnit="ml") = 0.000526,
          useV0Input=false,
          useExternalPressureInput=false,
          useComplianceInput=false,
          ZeroPressureVolume=0.00037,
          Compliance=1.3493607749463e-08)
          annotation (Placement(transformation(extent={{58,6},{84,32}})));
        Physiolibrary.Hydraulic.Components.Inertia inertia(I(displayUnit=
                "mmHg.s2/ml") = 93325.6711905, volumeFlow_start(displayUnit=
                "ml/min") = 2.1666666666667e-05) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={134,18})));
        Physiolibrary.Hydraulic.Components.Conductor ArteryResistance(
            useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
               1.2526028316622e-07)
          annotation (Placement(transformation(extent={{94,8},{114,28}})));
        Physiolibrary.Hydraulic.Components.Conductor
          SystemicArterioralConductance(useConductanceInput=false, Conductance(
              displayUnit="ml/(mmHg.s)") = 9.3757696980707e-09) annotation (
            Placement(transformation(
              extent={{11,-9},{-11,9}},
              rotation=0,
              origin={23,17})));
        Physiolibrary.Hydraulic.Components.Conductor SmallVenuleConductance(
            useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
               3.7503078792283e-08) annotation (Placement(transformation(
              extent={{14,-9},{-14,9}},
              rotation=0,
              origin={-60,17})));
        Physiolibrary.Hydraulic.Components.ElasticVessel PeripheralVessels(
          useV0Input=false,
          useExternalPressureInput=false,
          useComplianceInput=false,
          volume_start=0.000283,
          ZeroPressureVolume=0.000185,
          Compliance=2.8652352197304e-08)
          annotation (Placement(transformation(extent={{-26,10},{-6,30}})));
        Physiolibrary.Hydraulic.Components.Conductor VeinsResistance(
            useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
               8.3256834918868e-08)
          annotation (Placement(transformation(extent={{-120,6},{-148,28}})));
        Physiolibrary.Hydraulic.Components.Conductor CentralVenousResistance(
            useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
               2.4999552322936e-06)
          annotation (Placement(transformation(extent={{-208,8},{-232,28}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel IntraThoracicVeins(
          useV0Input=false,
          useComplianceInput=false,
          useExternalPressureInput=true,
          volume_start=0.00148,
          ZeroPressureVolume=0.00119,
          Compliance=4.1178380513927e-07,
          ExternalPressure=-533.28954966)
          annotation (Placement(transformation(extent={{-192,4},{-164,32}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel ExtrathoracicVeins(
          useV0Input=false,
          useExternalPressureInput=false,
          useComplianceInput=false,
          volume_start=0.00153,
          ZeroPressureVolume=0.001,
          Compliance=4.4403645290063e-07)
          annotation (Placement(transformation(extent={{-116,4},{-90,30}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel RightAtrium(
          useComplianceInput=true,
          useV0Input=false,
          volume_start=0.000135,
          ZeroPressureVolume=3e-05,
          useExternalPressureInput=true,
          ExternalPressure=-533.28954966)
          annotation (Placement(transformation(extent={{-242,44},{-214,72}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle(
          useComplianceInput=true,
          useV0Input=false,
          volume_start=0.000131,
          ZeroPressureVolume=4e-05,
          useExternalPressureInput=true,
          ExternalPressure=-533.28954966)
          annotation (Placement(transformation(extent={{-168,42},{-138,72}})));
        Physiolibrary.Hydraulic.Components.IdealValve ventricleArteryValve1(
          _Goff(displayUnit="ml/(mmHg.s)") = 0,
          useLimitationInputs=false,
          _Gon(displayUnit="ml/(mmHg.s)") = 2.4999552322936e-06)
          annotation (Placement(transformation(extent={{-132,70},{-108,46}})));
        Parts.AtrialElastance atrialElastance1(EMIN=6666119.37075, EMAX=
              19998358.11225)
          annotation (Placement(transformation(extent={{-244,86},{-206,118}})));
        Parts.VentricularElastance ventricularElastance1(EMIN=7599376.082655,
            EMAX=65327969.83335)
          annotation (Placement(transformation(extent={{-180,88},{-150,122}})));
        Physiolibrary.Hydraulic.Components.IdealValve atrioVentricleValve1(
          _Gon(displayUnit="ml/(mmHg.s)") = 2.497705047566e-06,
          _Goff=0,
          useLimitationInputs=false) annotation (Placement(visible=true,
              transformation(
              origin={-189,58},
              extent={{-13,12},{13,-12}},
              rotation=0)));
        replaceable Physiolibrary.Types.Constants.FrequencyConst HeartRate(k(
              displayUnit="1/min") = 1.2) annotation (Placement(visible=true,
              transformation(
              origin={-243,128.5},
              extent={{-11,-6.5},{11,6.5}},
              rotation=0)));
        Physiolibrary.Types.Constants.PressureConst IntraThoracicPressure(k=-533.28954966)
          annotation (Placement(transformation(
              extent={{-9,-6},{9,6}},
              rotation=0,
              origin={-123,118})));
      equation
        connect(PulmonaryArteries.q_in, PulmonaryArteriesResistance.q_in)
          annotation (Line(
            points={{-81,97},{-68.5,97},{-68.5,98},{-56,98}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(PulmonaryArteriesResistance.q_out, PulmonaryVeins.q_in)
          annotation (Line(
            points={{-22,98},{2,98}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(PulmonaryVeins.q_in, PulmonaryVeinResistance.q_in) annotation (
            Line(
            points={{2,98},{26,98}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(LeftAtrium.q_in, atrioVentricleValve.q_in) annotation (Line(
            points={{88,64},{114,64}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(LeftVentricle.q_in, atrioVentricleValve.q_out) annotation (Line(
            points={{163,63},{151.5,63},{151.5,64},{140,64}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(LeftVentricle.q_in, ventricleArteryValve.q_in) annotation (Line(
            points={{163,63},{173.5,63},{173.5,64},{184,64}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(LeftVentricle.compliance, ventricularElastance.Ct) annotation (
            Line(
            points={{163,75},{163,82},{212,82},{212,111.68},{203.42,111.68}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PulmonaryVeinResistance.q_out, LeftAtrium.q_in) annotation (
            Line(
            points={{56,98},{74,98},{74,64},{88,64}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(ArteryResistance.q_in, ExtrathoracicArteries.q_in) annotation (
            Line(
            points={{94,18},{80,18},{80,19},{71,19}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(ArteryResistance.q_out, inertia.q_out) annotation (Line(
            points={{114,18},{124,18}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(inertia.q_in, IntraThoracicArteries.q_in) annotation (Line(
            points={{144,18},{162,18},{162,17},{179,17}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(IntraThoracicArteries.q_in, ventricleArteryValve.q_out)
          annotation (Line(
            points={{179,17},{216,17},{216,64},{208,64}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(SystemicArterioralConductance.q_out, PeripheralVessels.q_in)
          annotation (Line(
            points={{12,17},{-2,17},{-2,20},{-16,20}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(PeripheralVessels.q_in, SmallVenuleConductance.q_in)
          annotation (Line(
            points={{-16,20},{-32,20},{-32,17},{-46,17}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(SystemicArterioralConductance.q_in, ExtrathoracicArteries.q_in)
          annotation (Line(
            points={{34,17},{71,17},{71,19}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(CentralVenousResistance.q_in, IntraThoracicVeins.q_in)
          annotation (Line(
            points={{-208,18},{-178,18}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(IntraThoracicVeins.q_in, VeinsResistance.q_out) annotation (
            Line(
            points={{-178,18},{-164,18},{-164,17},{-148,17}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(VeinsResistance.q_in, ExtrathoracicVeins.q_in) annotation (Line(
            points={{-120,17},{-103,17}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(ExtrathoracicVeins.q_in, SmallVenuleConductance.q_out)
          annotation (Line(
            points={{-103,17},{-74,17}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(RightAtrium.q_in, atrioVentricleValve1.q_in) annotation (Line(
            points={{-228,58},{-202,58}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(rightVentricle.q_in, atrioVentricleValve1.q_out) annotation (
            Line(
            points={{-153,57},{-164.5,57},{-164.5,58},{-176,58}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(rightVentricle.q_in, ventricleArteryValve1.q_in) annotation (
            Line(
            points={{-153,57},{-142.5,57},{-142.5,58},{-132,58}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(CentralVenousResistance.q_out, RightAtrium.q_in) annotation (
            Line(
            points={{-232,18},{-250,18},{-250,58},{-228,58}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(RightAtrium.compliance, atrialElastance1.Ct) annotation (Line(
            points={{-228,69.2},{-228,92},{-202.39,92},{-202.39,101.84}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(ventricleArteryValve1.q_out, PulmonaryArteries.q_in)
          annotation (Line(
            points={{-108,58},{-92,58},{-92,97},{-81,97}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(rightVentricle.compliance, ventricularElastance1.Ct)
          annotation (Line(
            points={{-153,69},{-153,80},{-126,80},{-126,108.91},{-147.15,108.91}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(LeftAtrium.compliance, atrialElastance.Ct) annotation (Line(
            points={{88,75.2},{88,86},{122,86},{122,96},{121.61,96},{121.61,
                109.84}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(HeartRate.y, atrialElastance1.HR) annotation (Line(
            points={{-229.25,128.5},{-225,128.5},{-225,114.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(ventricularElastance1.HR, HeartRate.y) annotation (Line(
            points={{-165,118.6},{-165,128.5},{-229.25,128.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(atrialElastance.HR, HeartRate.y) annotation (Line(
            points={{99,122.8},{99,128.5},{-229.25,128.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(ventricularElastance.HR, HeartRate.y) annotation (Line(
            points={{182,120.8},{182,128.5},{-229.25,128.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(IntraThoracicPressure.y, PulmonaryArteries.externalPressure)
          annotation (Line(
            points={{-111.75,118},{-70.6,118},{-70.6,107.4}},
            color={0,190,190},
            smooth=Smooth.None));
        connect(IntraThoracicPressure.y, PulmonaryVeins.externalPressure)
          annotation (Line(
            points={{-111.75,118},{11.6,118},{11.6,107.6}},
            color={0,190,190},
            smooth=Smooth.None));
        connect(LeftAtrium.externalPressure, LeftVentricle.externalPressure)
          annotation (Line(
            points={{99.2,75.2},{99.2,84},{175,84},{175,75}},
            color={0,190,190},
            smooth=Smooth.None));
        connect(LeftAtrium.externalPressure, PulmonaryVeins.externalPressure)
          annotation (Line(
            points={{99.2,75.2},{99.2,84},{76,84},{76,120},{11.6,120},{11.6,
                107.6}},
            color={0,190,190},
            smooth=Smooth.None));
        connect(IntraThoracicPressure.y, rightVentricle.externalPressure)
          annotation (Line(
            points={{-111.75,118},{-104,118},{-104,76},{-141,76},{-141,69}},
            color={0,190,190},
            smooth=Smooth.None));
        connect(RightAtrium.externalPressure, rightVentricle.externalPressure)
          annotation (Line(
            points={{-216.8,69.2},{-216.8,78},{-141,78},{-141,69}},
            color={0,190,190},
            smooth=Smooth.None));
        connect(IntraThoracicVeins.externalPressure, rightVentricle.externalPressure)
          annotation (Line(
            points={{-166.8,29.2},{-166.8,78},{-141,78},{-141,69}},
            color={0,190,190},
            smooth=Smooth.None));
        connect(IntraThoracicArteries.externalPressure, LeftVentricle.externalPressure)
          annotation (Line(
            points={{187.8,25.8},{187.8,84},{175,84},{175,75}},
            color={0,190,190},
            smooth=Smooth.None));
        annotation (
          Diagram(coordinateSystem(extent={{-280,-140},{280,180}},
                preserveAspectRatio=false), graphics),
          Icon(coordinateSystem(extent={{-280,-140},{280,180}},
                preserveAspectRatio=false), graphics),
          experiment(StopTime=5, __Dymola_NumberOfIntervals=5000),
          Documentation(info="<html>
<p>Cardiovascular model implemented per description of Meurs et al.</p>
<p>[9] J. A. Goodwin, W. L. van Meurs, C. D. S a Couto, J. E. W. Beneken, S. A. Graves, A Model for Educational Simulation of Infant Cardiovascular Physiology, Anesthesia &AMP; Analgesia 99 (6) (2004) 1655&ndash;1664. doi:10.1213/01.ANE.0000134797.52793.AF.</p>
<p>[10] C. D. S a Couto, W. L. van Meurs, J. A. Goodwin, P. Andriessen, A Model for Educational Simulation of Neonatal Cardiovascular Pathophysiology, Simulation in Healthcare 1 (Inaugural) (2006) 4&ndash;12.</p>
<p>[11] W. van Meurs, Modeling and Simulation in Biomedical Engineering: Applications in Cardiorespiratory Physiology, McGraw-Hill Professional, 2011.</p>
</html>"));
      end HemodynamicsMeurs_shallow;

      model HemodynamicsMeurs
        extends Cardiovascular.System(
          redeclare Parts.Pulmonary pulmonaryCirculation,
          redeclare Parts.Heart heart,
          redeclare Parts.Systemic systemicCirculation);
          extends Cardiovascular.Icons.Runnable_System;

        annotation (experiment(StopTime=5, __Dymola_NumberOfIntervals=5000),
            Documentation(info="<html>
<p>Cardiovascular model implemented per description of Meurs et al.</p>
<p>[9] J. A. Goodwin, W. L. van Meurs, C. D. S a Couto, J. E. W. Beneken, S. A. Graves, A Model for Educational Simulation of Infant Cardiovascular Physiology, Anesthesia &AMP; Analgesia 99 (6) (2004) 1655&ndash;1664. doi:10.1213/01.ANE.0000134797.52793.AF.</p>
<p>[10] C. D. S a Couto, W. L. van Meurs, J. A. Goodwin, P. Andriessen, A Model for Educational Simulation of Neonatal Cardiovascular Pathophysiology, Simulation in Healthcare 1 (Inaugural) (2006) 4&ndash;12.</p>
<p>[11] W. van Meurs, Modeling and Simulation in Biomedical Engineering: Applications in Cardiorespiratory Physiology, McGraw-Hill Professional, 2011.</p>
</html>"));
      end HemodynamicsMeurs;

      package Parts
        extends Modelica.Icons.UtilitiesPackage;
        model Pulmonary
          extends Cardiovascular.Interfaces.Pulmonary;
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance
            PulmonaryArteries(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.000106,
            ZeroPressureVolume=5e-05,
            ExternalPressure=-533.28954966,
            Elastance=31064116.267695)
            annotation (Placement(transformation(extent={{-82,-12},{-58,12}})));
          Physiolibrary.Hydraulic.Components.Resistor
            PulmonaryArteriesResistance(useConductanceInput=false, Resistance(
                displayUnit="(mmHg.s)/ml") = 14665462.61565)
            annotation (Placement(transformation(extent={{-38,-14},{-10,14}})));
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance
            PulmonaryVeins(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.000518,
            ZeroPressureVolume=0.00035,
            ExternalPressure=-533.28954966,
            Elastance=6066168.6273825)
            annotation (Placement(transformation(extent={{8,-12},{32,12}})));
          Physiolibrary.Hydraulic.Components.Resistor PulmonaryVeinResistance(
              useConductanceInput=false, Resistance(displayUnit="(mmHg.s)/ml")=
                 399967.162245)
            annotation (Placement(transformation(extent={{46,-12},{70,12}})));
        equation
          connect(q_in, PulmonaryArteries.q_in) annotation (Line(
              points={{-100,0},{-84,0},{-84,2.22045e-16},{-70,2.22045e-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(PulmonaryArteries.q_in, PulmonaryArteriesResistance.q_in)
            annotation (Line(
              points={{-70,0},{-38,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(PulmonaryArteriesResistance.q_out, PulmonaryVeins.q_in)
            annotation (Line(
              points={{-10,0},{4,0},{4,2.22045e-16},{20,2.22045e-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(PulmonaryVeins.q_in, PulmonaryVeinResistance.q_in)
            annotation (Line(
              points={{20,0},{46,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(PulmonaryVeinResistance.q_out, q_out) annotation (Line(
              points={{70,0},{100,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(
                coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}}), graphics={Text(
                  extent={{-100,60},{100,100}},
                  lineColor={0,0,0},
                  textString="Meurs")}));
        end Pulmonary;

        model Systemic
          extends Cardiovascular.Interfaces.Systemic;
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance
            IntraThoracicArteries(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.000204,
            ZeroPressureVolume=0.00014,
            ExternalPressure=-533.28954966,
            Elastance=190651014.00345)
            annotation (Placement(transformation(extent={{78,-6},{92,8}})));
          Physiolibrary.Hydraulic.Components.Inertia inertia(I(displayUnit=
                  "mmHg.s2/ml") = 93325.6711905, volumeFlow_start(displayUnit=
                  "ml/min") = 2.1666666666667e-05) annotation (Placement(
                transformation(
                extent={{-6,-5},{6,5}},
                rotation=180,
                origin={70,1})));
          Physiolibrary.Hydraulic.Components.Resistor  ArteryResistance(
              useConductanceInput=false, Resistance(displayUnit="(mmHg.s)/ml")=
                 7999343.2449) annotation (Placement(transformation(
                extent={{7,-7},{-7,7}},
                rotation=0,
                origin={55,1})));
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance
            ExtrathoracicArteries(
            volume_start(displayUnit="ml") = 0.000526,
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            ZeroPressureVolume=0.00037,
            Elastance=74127247.40274)
            annotation (Placement(transformation(extent={{38,-22},{54,-6}})));
          Physiolibrary.Hydraulic.Components.Resistor
            SystemicArterioralResistance(useConductanceInput=false, Resistance(
                displayUnit="(mmHg.s)/ml") = 106657909.932) annotation (
              Placement(transformation(
                extent={{9,-8},{-9,8}},
                rotation=0,
                origin={27,-14})));
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance
            PeripheralVessels(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.000283,
            ZeroPressureVolume=0.000185,
            Elastance=34930465.50273)
            annotation (Placement(transformation(extent={{2,-36},{16,-22}})));
          Physiolibrary.Hydraulic.Components.Resistor  SmallVenuleResistance(
              useConductanceInput=false, Resistance(displayUnit="(mmHg.s)/ml")=
                 26664477.483) annotation (Placement(transformation(
                extent={{7,-7},{-7,7}},
                rotation=0,
                origin={-7,-29})));
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance
            ExtrathoracicVeins(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.00153,
            ZeroPressureVolume=0.001,
            Elastance=2253148.3473135)
            annotation (Placement(transformation(extent={{-32,-22},{-14,-6}})));
          Physiolibrary.Hydraulic.Components.Resistor  VeinsResistance(
              useConductanceInput=false, Resistance(displayUnit="(mmHg.s)/ml")=
                 11999014.86735)
            annotation (Placement(transformation(extent={{-32,-22},{-48,-6}})));
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance
            IntraThoracicVeins(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.00148,
            ZeroPressureVolume=0.00119,
            ExternalPressure=-533.28954966,
            Elastance=2426467.450953)
            annotation (Placement(transformation(extent={{-66,-8},{-48,8}})));
          Physiolibrary.Hydraulic.Components.Resistor  CentralVenousResistance(
              useConductanceInput=false, Resistance(displayUnit="(mmHg.s)/ml")=
                 399967.162245)
            annotation (Placement(transformation(extent={{-74,-8},{-90,8}})));
        equation
          connect(VeinsResistance.q_in, ExtrathoracicVeins.q_in) annotation (
              Line(
              points={{-32,-14},{-23,-14}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(inertia.q_in, IntraThoracicArteries.q_in) annotation (Line(
              points={{76,1},{85,1}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(ArteryResistance.q_in, inertia.q_out) annotation (Line(
              points={{62,1},{64,1}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(ExtrathoracicArteries.q_in, SystemicArterioralResistance.q_in)
            annotation (Line(
              points={{46,-14},{36,-14}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(q_out, CentralVenousResistance.q_out) annotation (Line(
              points={{-100,0},{-90,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(CentralVenousResistance.q_in, IntraThoracicVeins.q_in)
            annotation (Line(
              points={{-74,0},{-57,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(IntraThoracicVeins.q_in, VeinsResistance.q_out) annotation (
              Line(
              points={{-57,0},{-48,0},{-48,-14}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(q_in, q_in) annotation (Line(
              points={{100,0},{95,0},{95,0},{100,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(q_in, IntraThoracicArteries.q_in) annotation (Line(
              points={{100,0},{92,0},{92,1},{85,1}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(SmallVenuleResistance.q_out, ExtrathoracicVeins.q_in)
            annotation (Line(
              points={{-14,-29},{-14,-14},{-23,-14}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(ExtrathoracicArteries.q_in, ArteryResistance.q_out)
            annotation (Line(
              points={{46,-14},{46,1},{48,1}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(SmallVenuleResistance.q_in, PeripheralVessels.q_in)
            annotation (Line(
              points={{0,-29},{9,-29}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(PeripheralVessels.q_in, SystemicArterioralResistance.q_out)
            annotation (Line(
              points={{9,-29},{9,-14},{18,-14}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(graphics={
                  Text(   extent={{-100,60},{100,100}},
                  lineColor={0,0,0},
                  textString="Meurs")}));
        end Systemic;

        model Heart
          extends Cardiovascular.Interfaces.Heart;
          Physiolibrary.Hydraulic.Components.ElasticVessel rightAtrium(
            useComplianceInput=true,
            useV0Input=false,
            useExternalPressureInput=false,
            volume_start=0.000135,
            ZeroPressureVolume=3e-05,
            ExternalPressure=-533.28954966)
            annotation (Placement(transformation(extent={{-68,8},{-40,36}})));
          Physiolibrary.Hydraulic.Components.IdealValveResistance
            atrioVentricleValve1(
            _Goff=0,
            useLimitationInputs=false,
            _Ron(displayUnit="(mmHg.s)/ml") = 399967.162245) annotation (
              Placement(visible=true, transformation(
                origin={-14,22},
                extent={{-12,12},{12,-12}},
                rotation=0)));
          Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle(
            useComplianceInput=true,
            useV0Input=false,
            useExternalPressureInput=false,
            volume_start=0.000131,
            ZeroPressureVolume=4e-05,
            ExternalPressure=-533.28954966)
            annotation (Placement(transformation(extent={{8,8},{36,36}})));
          Physiolibrary.Hydraulic.Components.IdealValveResistance
            ventricleArteryValve1(
            _Goff(displayUnit="ml/(mmHg.s)") = 0,
            useLimitationInputs=false,
            _Ron(displayUnit="(mmHg.s)/ml") = 399967.162245)
            annotation (Placement(transformation(extent={{42,34},{66,10}})));
          VentricularElastance ventricularElastance1(EMIN=7599376.082655, EMAX=
                65327969.83335)
            annotation (Placement(transformation(extent={{-20,54},{10,88}})));
          AtrialElastance atrialElastance1(EMIN=6666119.37075, EMAX=
                19998358.11225)
            annotation (Placement(transformation(extent={{-94,54},{-56,86}})));
          replaceable Physiolibrary.Types.Constants.FrequencyConst HeartRate(k(
                displayUnit="1/min") = 1.2) annotation (Placement(visible=true,
                transformation(
                origin={59,92},
                extent={{-7,-6},{7,6}},
                rotation=180)));
          Physiolibrary.Hydraulic.Components.ElasticVessel leftAtrium(
            useComplianceInput=true,
            useV0Input=false,
            useExternalPressureInput=false,
            volume_start=9.31e-05,
            ZeroPressureVolume=3e-05,
            ExternalPressure=-533.28954966)
            annotation (Placement(transformation(extent={{50,-86},{78,-58}})));
          AtrialElastance atrialElastance(EMIN=15998686.4898, EMAX=
                37330268.4762)
            annotation (Placement(transformation(extent={{8,-50},{46,-18}})));
          Physiolibrary.Hydraulic.Components.IdealValveResistance
            atrioVentricleValve(
            useLimitationInputs=false,
            _Goff(displayUnit="ml/(mmHg.s)") = 0,
            _Ron(displayUnit="(mmHg.s)/ml") = 399967.162245) annotation (
              Placement(visible=true, transformation(
                origin={24,-72},
                extent={{-12,12},{12,-12}},
                rotation=180)));
          Physiolibrary.Hydraulic.Components.ElasticVessel leftVentricle(
            useComplianceInput=true,
            useV0Input=false,
            useExternalPressureInput=false,
            volume_start=0.000144,
            ZeroPressureVolume=6e-05,
            ExternalPressure=-533.28954966)
            annotation (Placement(transformation(extent={{-30,-86},{-2,-58}})));
          VentricularElastance ventricularElastance(EMIN=11999014.86735, EMAX=
                533289549.66) annotation (Placement(transformation(extent={{-66,
                    -46},{-30,-14}})));
          Physiolibrary.Hydraulic.Components.IdealValveResistance
            ventricleArteryValve(
            _Goff(displayUnit="ml/(mmHg.s)") = 0,
            useLimitationInputs=false,
            _Ron(displayUnit="(mmHg.s)/ml") = 1066579.09932) annotation (
              Placement(transformation(
                extent={{-12,12},{12,-12}},
                rotation=180,
                origin={-58,-72})));
        equation
          connect(rightHeartInflow, rightAtrium.q_in) annotation (Line(
              points={{-100,40},{-70,40},{-70,22},{-54,22}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(rightAtrium.q_in, atrioVentricleValve1.q_in) annotation (Line(
              points={{-54,22},{-26,22}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(atrioVentricleValve1.q_out, rightVentricle.q_in) annotation (
              Line(
              points={{-2,22},{22,22}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(rightVentricle.q_in, ventricleArteryValve1.q_in) annotation (
              Line(
              points={{22,22},{42,22}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(ventricleArteryValve1.q_out, rightHeartOutflow) annotation (
              Line(
              points={{66,22},{82,22},{82,40},{100,40}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(leftHeartInflow, leftAtrium.q_in) annotation (Line(
              points={{100,-20},{82,-20},{82,-72},{64,-72}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(leftAtrium.q_in, atrioVentricleValve.q_in) annotation (Line(
              points={{64,-72},{36,-72}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(atrioVentricleValve.q_out, leftVentricle.q_in) annotation (
              Line(
              points={{12,-72},{-16,-72}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(leftVentricle.q_in, ventricleArteryValve.q_in) annotation (
              Line(
              points={{-16,-72},{-46,-72}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(ventricleArteryValve.q_out, leftHeartOutflow) annotation (
              Line(
              points={{-70,-72},{-84,-72},{-84,-20},{-100,-20}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(atrialElastance1.Ct, rightAtrium.compliance) annotation (Line(
              points={{-52.39,69.84},{-52.39,48.92},{-54,48.92},{-54,33.2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(ventricularElastance1.Ct, rightVentricle.compliance)
            annotation (Line(
              points={{12.85,74.91},{22,74.91},{22,33.2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(atrialElastance1.HR, HeartRate.y) annotation (Line(
              points={{-75,82.8},{-75,92},{50.25,92}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(ventricularElastance1.HR, HeartRate.y) annotation (Line(
              points={{-5,84.6},{-5,92},{50.25,92}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(ventricularElastance.HR, HeartRate.y) annotation (Line(
              points={{-48,-17.2},{-48,-12},{36,-12},{36,92},{50.25,92}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(atrialElastance.HR, HeartRate.y) annotation (Line(
              points={{27,-21.2},{27,-12},{36,-12},{36,92},{50.25,92}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(atrialElastance.Ct, leftAtrium.compliance) annotation (Line(
              points={{49.61,-34.16},{64,-34.16},{64,-60.8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(ventricularElastance.Ct, leftVentricle.compliance)
            annotation (Line(
              points={{-26.58,-26.32},{-16,-26.32},{-16,-60.8}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(graphics={
                  Text(   extent={{-100,60},{100,100}},
                  lineColor={0,0,0},
                  textString="Meurs")}));
        end Heart;

        model AtrialElastance
          extends HeartIntervals;
          Physiolibrary.Types.RealIO.HydraulicComplianceOutput Ct "compliance"
            annotation (Placement(transformation(extent={{100,-10},{120,10}}),
                iconTransformation(extent={{100,-20},{138,18}})));
          Physiolibrary.Types.HydraulicElastance Et "elasticity";
          parameter Physiolibrary.Types.HydraulicElastance EMIN
            "Diastolic elastance";
          parameter Boolean useEs_extInput=false
            "=true, if external elastance/compliance value is used" annotation (
            Evaluate=true,
            HideResult=true,
            choices(__Dymola_checkBox=true),
            Dialog(group="External inputs/outputs"));
          parameter Physiolibrary.Types.HydraulicElastance EMAX
            "Maximum systolic elastance"
            annotation (Dialog(enable=not useEs_extInput));
          Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/
                Ees) = 1/es_int if useEs_extInput annotation (Placement(
                transformation(extent={{60,60},{100,100}}), iconTransformation(
                extent={{-20,-20},{20,20}},
                rotation=0,
                origin={-80,80})));
        protected
          Physiolibrary.Types.HydraulicElastance es_int;
        equation
          if not useEs_extInput then
            es_int = EMAX;
          end if;
          if time - T0 < Tas then
            Et = EMIN + (es_int - EMIN)*sin(Modelica.Constants.pi*(time - T0)/
              Tas);
          else
            Et = EMIN;
          end if;
          Ct = 1/Et "reciprocal value of elastance";
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                    {-100,-100},{100,100}}), graphics={Rectangle(
                          extent={{-100,82},{100,-100}},
                          pattern=LinePattern.None,
                          lineThickness=1,
                          fillColor={255,255,170},
                          fillPattern=FillPattern.Solid,
                          lineColor={0,0,255}),Text(
                          extent={{-98,82},{98,24}},
                          lineColor={0,0,255},
                          lineThickness=1,
                          fillColor={255,255,170},
                          fillPattern=FillPattern.Solid,
                          textString="Atrial elastance"),Line(
                          points={{-78,-34},{-76,-26},{-70,-14},{-58,6},{-36,36},
                    {-14,14},{-6,-10},{0,-32},{6,-34},{88,-34},{94,-34}},
                          color={0,0,255},
                          smooth=Smooth.Bezier),Text(
                          extent={{-220,-102},{200,-120}},
                          lineColor={0,0,255},
                          lineThickness=1,
                          fillColor={255,255,170},
                          fillPattern=FillPattern.Solid,
                          textString="%name"),Text(
                          extent={{72,4},{102,-8}},
                          lineColor={0,0,255},
                          fillColor={255,255,170},
                          fillPattern=FillPattern.Solid,
                          textString="Ct")}), Diagram(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                graphics));
        end AtrialElastance;

        model VentricularElastance
          extends HeartIntervals;
          Physiolibrary.Types.RealIO.HydraulicComplianceOutput Ct
            "ventricular elasticity" annotation (Placement(transformation(
                  extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                    4},{138,42}})));
          Modelica.Blocks.Interfaces.RealOutput Et0
            "normalized ventricular elasticity (0..1)" annotation (Placement(
                transformation(extent={{100,-24},{120,-4}}), iconTransformation(
                  extent={{100,-40},{138,-2}})));
          Physiolibrary.Types.RealIO.TimeOutput HeartInterval "eapsed time"
            annotation (Placement(transformation(extent={{102,-42},{122,-22}}),
                iconTransformation(extent={{100,-98},{138,-60}})));
          Physiolibrary.Types.HydraulicElastance Et;
          parameter Physiolibrary.Types.HydraulicElastance EMIN
            "Diastolic elastance ";
          constant Real Kn=0.57923032735652;
          //Kn is always = 0.5792303273565197
          //... the t * sin(pi*t) has its maximum at t = 0.645773676543406 and = 0.5792303273565197
          //Equation to calculate normalized elastance ET0 was:
          //Et0=EMIN+(EMAX-EMIN)*((time-T0)-(Tas+Tav))/Tvs)*sin(Modelica.Constants.pi*(((time-T0)-(Tas+Tav))/Tvs));
          parameter Boolean useEs_extInput=false
            "=true, if external elastance/compliance value is used" annotation (
            Evaluate=true,
            HideResult=true,
            choices(__Dymola_checkBox=true),
            Dialog(group="External inputs/outputs"));
          parameter Physiolibrary.Types.HydraulicElastance EMAX
            "Maximum systolic elastance"
            annotation (Dialog(enable=not useEs_extInput));
          Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/
                EMAX) = 1/es_int if useEs_extInput annotation (Placement(
                transformation(extent={{60,60},{100,100}}), iconTransformation(
                extent={{-20,-20},{20,20}},
                rotation=0,
                origin={-80,80})));
        protected
          Physiolibrary.Types.HydraulicElastance es_int;
        equation
          if not useEs_extInput then
            es_int = EMAX;
          end if;
          HeartInterval = time - T0;
          Et = EMIN + (es_int - EMIN)*Et0;
          if HeartInterval >= Tas + Tav and HeartInterval < Tas + Tav + Tvs then
            Et0 = (HeartInterval - (Tas + Tav))/Tvs*sin(Modelica.Constants.pi*(
              HeartInterval - (Tas + Tav))/Tvs)/Kn;
          else
            Et0 = 0;
          end if;
          Ct = 1/Et "reciprocal value of elastance";
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                    {-100,-100},{100,100}}), graphics={Rectangle(
                          extent={{-98,82},{100,-100}},
                          pattern=LinePattern.None,
                          lineThickness=1,
                          fillColor={255,255,170},
                          fillPattern=FillPattern.Solid,
                          lineColor={0,0,255}),Text(
                          extent={{-82,82},{80,24}},
                          lineColor={0,0,255},
                          lineThickness=1,
                          fillColor={255,255,170},
                          fillPattern=FillPattern.Solid,
                          textString="Ventricular elastance"),Line(
                          points={{-72,-34},{-62,-34},{-52,-34},{-44,8},{-18,38},
                    {-12,14},{-6,-10},{0,-32},{6,-34},{88,-34},{94,-34}},
                          color={0,0,255},
                          smooth=Smooth.Bezier),Text(
                          extent={{-220,-102},{200,-120}},
                          lineColor={0,0,255},
                          lineThickness=1,
                          fillColor={255,255,170},
                          fillPattern=FillPattern.Solid,
                          textString="%name"),Text(
                          extent={{96,-32},{68,-8}},
                          lineColor={0,0,255},
                          fillColor={255,255,170},
                          fillPattern=FillPattern.Solid,
                          textString="Et0"),Text(
                          extent={{42,-72},{88,-84}},
                          lineColor={0,0,255},
                          fillColor={255,255,170},
                          fillPattern=FillPattern.Solid,
                          textString="Heart interval"),Text(
                          extent={{62,30},{96,8}},
                          lineColor={0,0,255},
                          lineThickness=1,
                          fillColor={255,255,170},
                          fillPattern=FillPattern.Solid,
                          textString="Ct")}), Diagram(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                graphics));
        end VentricularElastance;

        model HeartIntervals
          discrete Physiolibrary.Types.Time Tas;
          discrete Physiolibrary.Types.Time T0;
          discrete Physiolibrary.Types.Time Tvs;
          parameter Physiolibrary.Types.Time Tav(displayUnit="s") = 0.01
            "atrioventricular delay";
          discrete Modelica.SIunits.Time HP(start=0) "heart period";
          Boolean b(start=false);
          Physiolibrary.Types.RealIO.FrequencyInput HR "heart rate" annotation (
             Placement(transformation(extent={{-12,68},{28,108}}),
                iconTransformation(
                extent={{-20,-20},{20,20}},
                rotation=270,
                origin={0,80})));
        equation
          b = time - pre(T0) >= pre(HP) "true if new pulse occurs";
          when {initial(),b} then
            T0 = time "start time of cardiac cycle";
            HP = 1/HR "update heart period per heart rate";
            Tas = 0.03 + 0.09*HP "duration of atrial systole";
            Tvs = 0.16 + 0.2*HP "duration of ventricular systole";
          end when;
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                    {-100,-100},{100,100}}), graphics={Text(
                          extent={{-64,102},{-6,78}},
                          lineColor={0,0,255},
                          textString="HR")}));
        end HeartIntervals;
      end Parts;

      model HemodynamicsMeursBVControl
        extends Cardiovascular.Interfaces.Controlled.System(
          redeclare replaceable ControlledParts.PulmonaryControl
            pulmonaryCirculation,
          redeclare replaceable ControlledParts.HeartControl heart,
          redeclare replaceable ControlledParts.SystemicControl
            systemicCirculation,
          redeclare replaceable ControlledParts.Baroreflex shortTermControl,
          redeclare replaceable Cardiovascular.Model.Control.BloodVolumeControl
            longTermControl);
      /*    redeclare CardiovascularDevel.Model.Meurs.Variants.Parts.Stenosis
      stenosisControl(aorticstenosis(InitialResistance(displayUnit="(mmHg.s)/ml")=
             1066579.09932, FinalResistance(displayUnit="(mmHg.s)/ml") = 1066579.09932),
        AVBackFlowConductance(k=1.2501026264094e-15)),*/
          extends Cardiovascular.Icons.Runnable_System;
        annotation (experiment(StopTime=5, __Dymola_NumberOfIntervals=5000),
            Documentation(info="<html>
<p>Cardiovascular model implemented per description of Meurs et al.</p>
<p>[9] J. A. Goodwin, W. L. van Meurs, C. D. S a Couto, J. E. W. Beneken, S. A. Graves, A Model for Educational Simulation of Infant Cardiovascular Physiology, Anesthesia &AMP; Analgesia 99 (6) (2004) 1655&ndash;1664. doi:10.1213/01.ANE.0000134797.52793.AF.</p>
<p>[10] C. D. S a Couto, W. L. van Meurs, J. A. Goodwin, P. Andriessen, A Model for Educational Simulation of Neonatal Cardiovascular Pathophysiology, Simulation in Healthcare 1 (Inaugural) (2006) 4&ndash;12.</p>
<p>[11] W. van Meurs, Modeling and Simulation in Biomedical Engineering: Applications in Cardiorespiratory Physiology, McGraw-Hill Professional, 2011.</p>
</html>"));
      end HemodynamicsMeursBVControl;

      package ControlledParts
        extends Modelica.Icons.UtilitiesPackage;
        model PulmonaryControl
          extends Parts.Pulmonary;
          extends Interfaces.Controlled.Pulmonary;
          Modelica.Blocks.Math.Add add annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={-26,26})));
        equation
          connect(PulmonaryArteries.volume, add.u1) annotation (Line(
              points={{-62.8,-12},{-62,-12},{-62,-26},{-6,-26},{-6,20},{-14,20}},
              color={0,0,127},
              smooth=Smooth.None));

          connect(PulmonaryVeins.volume, add.u2) annotation (Line(
              points={{27.2,-12},{28,-12},{28,-24},{34,-24},{34,32},{-14,32}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(add.y, busConnector.pulmonaryBloodVolume) annotation (Line(
              points={{-37,26},{-58,26},{-58,34},{-80,34}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics));
        end PulmonaryControl;

        model SystemicControl
          extends Parts.Systemic(
            SmallVenuleResistance(useConductanceInput=true),
            IntraThoracicArteries(
              useV0Input=false,
              useExternalPressureInput=false,
              useComplianceInput=false),
            IntraThoracicVeins(useComplianceInput=true));
          extends Interfaces.Controlled.Systemic;
          Modelica.Blocks.Math.Sum sum1(nin=5) annotation (Placement(
                transformation(
                extent={{-5,-5},{5,5}},
                rotation=180,
                origin={-61,-39})));
          Cardiovascular.Model.Control.MeanAortaPressureMeasurement
            aortaPressureMeasurement
            annotation (Placement(transformation(extent={{70,10},{90,30}})));
        equation
          connect(IntraThoracicVeins.volume, sum1.u[1]) annotation (Line(
              points={{-51.6,-8},{-55,-8},{-55,-38.2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(sum1.y, busConnector.systemicBloodVolume) annotation (Line(
              points={{-66.5,-39},{-68,-39},{-68,34},{-80,34}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(aortaPressureMeasurement.q_in, inertia.q_in) annotation (Line(
              points={{76,14},{76,1}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(ExtrathoracicVeins.volume, sum1.u[2]) annotation (Line(
              points={{-17.6,-22},{-16,-22},{-16,-38.6},{-55,-38.6}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(PeripheralVessels.volume, sum1.u[3]) annotation (Line(
              points={{13.2,-36},{14,-36},{14,-39},{-55,-39}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(ExtrathoracicArteries.volume, sum1.u[4]) annotation (Line(
              points={{50.8,-22},{52,-22},{52,-39.4},{-55,-39.4}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(IntraThoracicArteries.volume, sum1.u[5]) annotation (Line(
              points={{89.2,-6},{88,-6},{88,-40},{-55,-40},{-55,-39.8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(SmallVenuleResistance.cond, busConnector.peripheralconductance)
            annotation (Line(
              points={{-7,-24.8},{-7,34},{-80,34}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(IntraThoracicVeins.compliance, busConnector.venacavacompliance)
            annotation (Line(
              points={{-57,6.4},{-57,34},{-80,34}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(aortaPressureMeasurement.Pmean, busConnector.aortameanpressure)
            annotation (Line(
              points={{87,23},{96,23},{96,34},{-80,34}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics));
        end SystemicControl;

        model HeartControl
          extends Parts.Heart(
            ventricularElastance1(useEs_extInput=true),
            ventricularElastance(useEs_extInput=true),
            redeclare Types.Constants.FrequencyControl HeartRate,
            ventricleArteryValve(useLimitationInputs=false));
          extends Interfaces.Controlled.Heart;
          Modelica.Blocks.Math.Sum sum1(nin=4)
            annotation (Placement(transformation(extent={{-80,-8},{-94,6}})));
        equation
          connect(rightAtrium.volume, sum1.u[1]) annotation (Line(
              points={{-45.6,8},{-64,8},{-64,-2.05},{-78.6,-2.05}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(rightVentricle.volume, sum1.u[2]) annotation (Line(
              points={{30.4,8},{32,8},{32,-1.35},{-78.6,-1.35}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(leftVentricle.volume, sum1.u[3]) annotation (Line(
              points={{-7.6,-86},{-6,-86},{-6,-0.65},{-78.6,-0.65}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(leftAtrium.volume, sum1.u[4]) annotation (Line(
              points={{72.4,-86},{72,-86},{72,0.05},{-78.6,0.05}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(sum1.y, busConnector.heartBloodVolume) annotation (Line(
              points={{-94.7,-1},{-98,-1},{-98,86}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(ventricularElastance1.Es_ext, busConnector.rvcompliance)
            annotation (Line(
              points={{-17,84.6},{-68,84.6},{-68,88},{-98,88},{-98,86},{-98,86}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));

          connect(ventricularElastance.Es_ext, busConnector.lvcompliance)
            annotation (Line(
              points={{-62.4,-17.2},{-62.4,-14},{-62,-14},{-62,-10},{-98,-10},{
                  -98,86}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(HeartRate.c, busConnector.heartrate) annotation (Line(
              points={{62.5,92},{74,92},{74,102},{-98,102},{-98,86}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics));
        end HeartControl;

        model Baroreflex
          extends Model.Control.Baroreflex(baroreceptor(
              activationDelay=1,
              PAOmedia=12974.201470097,
              HR0Param=1.2,
              EV0right=65327969.83335,
              EV0left=533289549.66,
              EV0venacava=4.1215883592719e-07,
              RS0=26664477.483));
        end Baroreflex;

        model AorticValveStenosisScenario
          extends Model.Scenario.StenosisControl(
            venacavastenosis(InitialElastance=2426467.450953, FinalElastance=
                  2426467.450953),
            aorticstenosis(InitialResistance(displayUnit="(mmHg.s)/ml")=
                1066579.09932, FinalResistance(displayUnit="(mmHg.s)/ml")=
                1066579.09932),
            mitralvalvestenosis(InitialResistance=399967.162245,
                FinalResistance=399967.162245));

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics));
        end AorticValveStenosisScenario;

        model AorticValveHeartControl
          extends HeartControl(ventricleArteryValve(useLimitationInputs=true));
        equation
          connect(ventricleArteryValve.Gon, busConnector.avoutflowresistance)
            annotation (Line(
              points={{-50.8,-60},{-50.8,-54},{-98,-54},{-98,86}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(ventricleArteryValve.Goff, busConnector.avbackflowconductance)
            annotation (Line(
              points={{-65.2,-60},{-65.2,-54},{-98,-54},{-98,86}},
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
        extends HemodynamicsMeursBVControl(redeclare
            ControlledParts.AorticValveStenosisScenario scenarioControl(
              aorticstenosis(FinalResistance(displayUnit="(mmHg.s)/ml")=
                10665790.9932)), redeclare
            ControlledParts.AorticValveHeartControl heart);
          extends Cardiovascular.Icons.Runnable_System;
        annotation (experiment(StopTime=120, __Dymola_NumberOfIntervals=5000));
      end StenosisAorticValve;

      model Bleeding
        extends HemodynamicsMeursBVControl(redeclare
            Scenario.BleedingTransfusionScenario scenarioControl(
            BloodTrans=0,
            Tbd=300,
            BloodLoss=0.0005,
            Tts=1200,
            Ttd=600), longTermControl(redeclare
              Control.BloodVolume.PlasmaBleeding plasma(hemorrhage(
                  useSolutionFlowInput=true)), redeclare
              Control.BloodVolume.RBCBleeding redBloodCells));
        annotation (experiment(StopTime=3600, __Dymola_NumberOfIntervals=5000));
      end Bleeding;
      annotation (Documentation(info="<html>
<p>Model as presented in [1], reimplemented an extended.</p>
<p>[1]	van Meurs W. Modeling and Simulation in Biomedical Engineering: Applications in Cardiorespiratory Physiology. 1 edition. McGraw-Hill Education; 2011.</p>
</html>"));
    end Meurs;

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
          Cardiovascular.Model.Control.MeanAortaPressureMeasurement
            aortaPressureMeasurement
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

    package Smith2004
        extends Modelica.Icons.ExamplesPackage;
      model HemodynamicsSmith_shallow
            extends Cardiovascular.Icons.Runnable_Shallow;
        import Physiolibrary.Hydraulic.Components.*;
      ElasticVesselElastance aorta(
          ZeroPressureVolume=0,
          volume_start=0.0001241,
          Elastance=92165766.41999) annotation (Placement(transformation(extent=
                 {{-130,-30},{-110,-10}})));
      ElasticVesselElastance venaCava(
          ZeroPressureVolume=0,
          volume_start=0.0002952,
          Elastance(displayUnit="Pa/m3") = 786602.0857485)
          annotation (Placement(transformation(extent={{-130,24},{-110,44}})));
        IdealValveResistance aorticValve(Pknee=0, _Ron(displayUnit=
                "(mmHg.s)/ml") = 2399802.97347)
          annotation (Placement(transformation(extent={{-68,-30},{-88,-10}})));
        Resistor Rsys(Resistance(displayUnit="(mmHg.s)/ml") = 145054757.50752)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-120,6})));
        IdealValveResistance tricuspidValve(Pknee=0, _Ron(displayUnit=
                "(mmHg.s)/ml") = 3159740.5817355)
          annotation (Placement(transformation(extent={{-62,24},{-42,44}})));
        Inertia Lav(I(displayUnit="mmHg.s2/ml") = 16250.665802014,
            volumeFlow_start(displayUnit="m3/s") = -1.4e-8) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-44,-20})));
        Inertia Lpv(I(displayUnit="mmHg.s2/ml") = 19822.372560862,
            volumeFlow_start(displayUnit="m3/s") = -1.9e-9)
          annotation (Placement(transformation(extent={{32,24},{52,44}})));
        IdealValveResistance pulmonaryValve(Pknee=0, _Ron(displayUnit=
                "(mmHg.s)/ml") = 733273.1307825)
          annotation (Placement(transformation(extent={{62,24},{82,44}})));
          ElasticVesselElastance pulmonaryArteries(
          ZeroPressureVolume=0,
          useExternalPressureInput=true,
          volume_start=3.904e-05,
          Elastance(displayUnit="Pa/m3") = 49195960.956135)
          annotation (Placement(transformation(extent={{102,24},{122,44}})));
        Resistor Rpul(Resistance(displayUnit="(mmHg.s)/ml") = 20691634.526808)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={114,4})));
      ElasticVesselElastance pulmonaryVeins(
          ZeroPressureVolume=0,
          useExternalPressureInput=true,
          volume_start=0.0008269,
          Elastance(displayUnit="Pa/m3") = 973253.4281295)
          annotation (Placement(transformation(extent={{104,-30},{124,-10}})));
        IdealValveResistance mitralValve(Pknee=0, _Ron(displayUnit=
                "(mmHg.s)/ml") = 2106493.721157)
          annotation (Placement(transformation(extent={{52,-30},{32,-10}})));
        Inertia Ltc(I(displayUnit="mmHg.s2/ml") = 10678.18997523,
            volumeFlow_start(displayUnit="m3/s") = 0.0001372)
          annotation (Placement(transformation(extent={{-88,24},{-68,44}})));
        Inertia Lmt(I(displayUnit="mmHg.s2/ml") = 10261.557514558,
            volumeFlow_start(displayUnit="m3/s") = 0.0001141) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={70,-20})));
        Physiolibrary.Types.Constants.FrequencyConst HR(k=1.2)
          annotation (Placement(transformation(extent={{-44,0},{-28,14}})));
        Physiolibrary.Types.Constants.PressureConst IntraThoracicPressure(k=-533.28954966)
          annotation (Placement(transformation(extent={{38,12},{50,20}})));
      Parts.VentricularInteraction_flat ventricularInteraction_flat(
          lambdalv=33000,
          lambdaperi=30000,
          lambdas(displayUnit="1/m3") = 435000,
          lambdarv(displayUnit="1/m3") = 23000,
          Essept(displayUnit="mmHg/ml") = 6499999676.0309,
          V0peri=0.0002,
          Pi0sept=148.00118226939,
          Pi0rv=28.757638965416,
          Pi0lv=16.038683206025,
          Pi0peri=66.701190423724,
          Esrv=77993596.637775,
          Eslv=383941811.27772)
          annotation (Placement(transformation(extent={{-18,-12},{20,28}})));
      equation
        connect(aorta.q_in, Rsys.q_in) annotation (Line(
            points={{-120,-20},{-120,-4}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(Rsys.q_out, venaCava.q_in) annotation (Line(
            points={{-120,16},{-120,34}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pulmonaryValve.q_out, pulmonaryArteries.q_in) annotation (Line(
            points={{82,34},{112,34}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pulmonaryArteries.q_in, Rpul.q_in) annotation (Line(
            points={{112,34},{114,34},{114,14}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(Rpul.q_out, pulmonaryVeins.q_in) annotation (Line(
            points={{114,-6},{114,-20}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(aorticValve.q_out, aorta.q_in) annotation (Line(
            points={{-88,-20},{-120,-20}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(venaCava.q_in, Ltc.q_in) annotation (Line(
            points={{-120,34},{-88,34}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pulmonaryVeins.q_in, Lmt.q_in) annotation (Line(
            points={{114,-20},{80,-20}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(Lav.q_out, aorticValve.q_in) annotation (Line(
            points={{-54,-20},{-68,-20}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(Ltc.q_out, tricuspidValve.q_in) annotation (Line(
            points={{-68,34},{-62,34}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(Lpv.q_out, pulmonaryValve.q_in) annotation (Line(
            points={{52,34},{62,34}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(mitralValve.q_in, Lmt.q_out) annotation (Line(
            points={{52,-20},{60,-20}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(tricuspidValve.q_out, ventricularInteraction_flat.rvflow)
          annotation (Line(
            points={{-42,34},{0.62,34},{0.62,28}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(Lpv.q_in, ventricularInteraction_flat.rvflow) annotation (Line(
            points={{32,34},{0.62,34},{0.62,28}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(ventricularInteraction_flat.lvflow, Lav.q_in) annotation (Line(
            points={{1,-12},{2,-12},{2,-20},{-34,-20}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(mitralValve.q_out, Lav.q_in) annotation (Line(
            points={{32,-20},{-34,-20}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(HR.y, ventricularInteraction_flat.HR) annotation (Line(
            points={{-26,7},{-22,7},{-22,8},{-14.2,8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(IntraThoracicPressure.y, ventricularInteraction_flat.Pth)
          annotation (Line(
            points={{51.5,16},{58,16},{58,8},{16.58,8}},
            color={0,190,190},
            smooth=Smooth.None));
        connect(pulmonaryArteries.externalPressure, IntraThoracicPressure.y)
          annotation (Line(
            points={{120,42},{120,46},{86,46},{86,16},{51.5,16}},
            color={0,190,190},
            smooth=Smooth.None));
        connect(pulmonaryVeins.externalPressure, IntraThoracicPressure.y)
          annotation (Line(
            points={{122,-12},{122,16},{51.5,16}},
            color={0,190,190},
            smooth=Smooth.None));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-100},
                  {160,100}}), graphics={Rectangle(extent={{-158,62},{-82,-34}},
                lineColor={28,108,200}),Rectangle(extent={{-84,54},{92,-46}},
                lineColor={28,108,200})}),
          Icon(coordinateSystem(extent={{-160,-100},{160,100}})),
          Documentation(info="<html>
<p>Cardiovascular model implemented per description of Smith et al.</p>
<p>[12] B. W. Smith, J. G. Chase, R. I. Nokes, G. M. Shaw, G. Wake, Minimal Haemodynamic System Model Including Ventricular Interaction and Valve Dynamics., Medical Engineering &AMP; Physics 26 (2) (2004) 131&ndash;139. doi:10.1016/j.medengphy.2003.10.001.</p>
<p>[13] CellML implementation at URL:  http://models.cellml.org/exposure/9d046663ba5cac5c8a61ac146183614b/smith_chase_nokes_shaw_wake_2004.cellml/view</p>
</html>"),experiment(StopTime=5));
      end HemodynamicsSmith_shallow;

      model HemodynamicsSmith
        extends Cardiovascular.System(
          redeclare Parts.Pulmonary pulmonaryCirculation,
          redeclare Parts.Heart heart,
          redeclare Parts.Systemic systemicCirculation);

          extends Cardiovascular.Icons.Runnable_System;
        annotation (experiment(StopTime=5, __Dymola_NumberOfIntervals=5000));
      end HemodynamicsSmith;

      package Parts
        extends Modelica.Icons.UtilitiesPackage;

        model VentricularInteraction_flat
            import Physiolibrary.Types.*;
          Volume Vsept(start=0.000002), Vrv(start=0.0001042), Vlv(start=
                0.0001042), Vperi;
          parameter Volume V0sept=0.000002, V0peri;
          Pressure Psept, Pperi;
          parameter Pressure Pi0sept, Pi0rv, Pi0lv, Pi0peri
            "peak isovolumic pressure";
          parameter HydraulicElastance Essept, Esrv, Eslv
            "elastance of systole";
          parameter Real A=1, B=80, CC=0.375;
            Time tm;
            discrete Time HP "heart period";
            discrete Time t0 "time of beginning of the cardiac cycle";
            discrete Time ts "duration of systole";
            parameter HydraulicLambda lambdas;
            parameter HydraulicLambda lambdarv;
            parameter HydraulicLambda lambdalv;
            parameter HydraulicLambda lambdaperi;
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rvflow annotation (
             Placement(transformation(extent={{-48,20},{-28,40}}),
                iconTransformation(extent={{-12,90},{8,110}})));
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a lvflow annotation (
             Placement(transformation(extent={{-46,-22},{-26,-2}}),
                iconTransformation(extent={{-10,-110},{10,-90}})));
          RealIO.FrequencyInput HR annotation (Placement(transformation(extent=
                    {{-78,-40},{-38,0}}), iconTransformation(extent={{-100,-20},
                    {-60,20}})));
          RealIO.PressureInput Pth annotation (Placement(transformation(extent=
                    {{-6,24},{14,44}}), iconTransformation(
                extent={{-20,-20},{20,20}},
                rotation=180,
                origin={82,0})));
        equation
          //timing
          tm = time - pre(t0);
          when {initial(),tm >= pre(HP)} then
            HP = 1/HR;
            t0 = time;
            ts = 0.16 + 0.3*HP;
          end when;
          //  septum
          Psept = lvflow.pressure - rvflow.pressure;
          Psept = (Vsept - V0sept)*A*exp(-B*(tm - CC)^2)*Essept + (1 - A*exp(-B
            *(tm - CC)^2))*Pi0sept*(exp(lambdas*Vsept) - 1);
          // rightventricle
          rvflow.pressure - Pperi = (Vrv + Vsept)*A*exp(-B*(tm - CC)^2)*Esrv +
            (1 - A*exp(-B*(tm - CC)^2))*Pi0rv*(exp(lambdarv*(Vrv + Vsept)) - 1);
          der(Vrv) = rvflow.q;
          //leftventricle
          lvflow.pressure - Pperi = (Vlv - Vsept)*A*exp(-B*(tm - CC)^2)*Eslv +
            (1 - A*exp(-B*(tm - CC)^2))*Pi0lv*(exp(lambdalv*(Vlv - Vsept)) - 1);
          der(Vlv) = lvflow.q;
          //pericardium
          Vperi = Vrv + Vlv;
          Pperi = Pth + Pi0peri*(exp(lambdaperi*(Vperi - V0peri)) - 1);
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                    {-100,-100},{100,100}}), graphics={Text(
                  extent={{102,-32},{76,-20}},
                  lineColor={0,0,255},
                  fillColor={255,170,170},
                  fillPattern=FillPattern.Forward,
                          textString="Pth"),Text(
                  extent={{-100,-22},{-74,-34}},
                  lineColor={0,0,255},
                          textString="HR"),Rectangle(
                          extent={{-20,80},{20,-60}},
                          lineColor={0,0,255},
                  fillPattern=FillPattern.Solid,
                          fillColor={0,0,255}),Text(
                  extent={{-100,-60},{100,-80}},
                  lineColor={0,0,255},
                  textString="%name")}));
        end VentricularInteraction_flat;

        model Septum

          Physiolibrary.Hydraulic.Sensors.PressureMeasure rvpressure
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-12,40})));
          Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(
                extent={{-5,-5},{5,5}},
                rotation=0,
                origin={-23,23})));
        TimeVaryingElastance septumdrv(
            lambda=435000,
            Es=6499999676.0309,
            Pi0=148.00118226939) annotation (Placement(transformation(
                extent={{-10,-12},{10,12}},
                rotation=0,
                origin={-58,12})));
          Physiolibrary.Hydraulic.Sensors.PressureMeasure lvpressure
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-20,-14})));
          ElasticWall elasticWall(volume(start=2e-06), V0=2e-06)
            annotation (Placement(transformation(extent={{-28,-8},{18,22}})));
          Physiolibrary.Types.RealIO.VolumeOutput volume(start=2e-06)
            annotation (Placement(transformation(
                rotation=180,
                extent={{-10,-10},{10,10}},
                origin={-84,-10}), iconTransformation(extent={{80,-10},{100,10}})));
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a lvflow annotation (
             Placement(transformation(rotation=0, extent={{-4,-28},{16,-8}}),
                iconTransformation(extent={{-10,-40},{10,-20}})));
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rvflow annotation (
             Placement(transformation(rotation=0, extent={{-4,32},{16,52}}),
                iconTransformation(extent={{-10,6},{10,26}})));
          Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
                transformation(rotation=0, extent={{-94,10},{-74,30}}),
                iconTransformation(extent={{-100,-10},{-80,10}})));
        equation
          connect(elasticWall.compliance, septumdrv.C) annotation (Line(
              points={{-27.08,7.9},{-32,7.9},{-32,13.68},{-47.25,13.68}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(septumdrv.Pi, add1.u2) annotation (Line(
              points={{-47.25,19.92},{-33.625,19.92},{-33.625,20},{-29,20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(add1.y, elasticWall.prv) annotation (Line(
              points={{-17.5,23},{-13.74,23},{-13.74,7.9}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(elasticWall.volume, septumdrv.V) annotation (Line(
              points={{-27.08,-1.4},{-44,-1.4},{-44,7.2},{-48,7.2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(volume, elasticWall.volume) annotation (Line(points={{-84,-10},
                  {-27.08,-10},{-27.08,-1.4}}, color={0,0,127}));
          connect(HR, septumdrv.HR) annotation (Line(points={{-84,20},{-68,20},
                  {-68,19.2}}, color={0,0,127}));
          connect(lvpressure.pressure, elasticWall.plv) annotation (Line(
              points={{-16,-8},{-16,-0.5},{-16.96,-0.5}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(rvpressure.q_in, rvflow) annotation (Line(
              points={{-18,44},{-6,44},{-6,42},{6,42}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(rvpressure.pressure, add1.u1) annotation (Line(
              points={{-16,34},{-34,34},{-34,26},{-29,26}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(lvflow, lvpressure.q_in) annotation (Line(
              points={{6,-18},{-14,-18}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(
                coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}}), graphics={Polygon(
                          points={{-100,-20},{-40,0},{-6,6},{8,6},{40,0},{100,-20},
                    {98,-20},{-100,-20}},
                  lineColor={167,167,255},
                  smooth=Smooth.None,
                  fillPattern=FillPattern.Forward,
                          fillColor={255,170,170}),Text(
                  extent={{-100,-20},{-78,-40}},
                  lineColor={0,0,127},
                  fillPattern=FillPattern.Forward,
                          textString="HR"),Text(
                  extent={{80,-20},{100,-40}},
                  lineColor={0,0,127},
                  fillPattern=FillPattern.Forward,
                          textString="V"),Text(
                  extent={{-80,-20},{76,0}},
                  lineColor={0,0,127},
                  fillPattern=FillPattern.Forward,
                  textString="%name")}));
        end Septum;

        model Ventricle

          TimeVaryingElastance drive(
            lambda=23000,
            useEs_extInput=false,
            Es=77993596.637775,
            Pi0=28.757638965416)
            annotation (Placement(transformation(extent={{-32,-4},{-12,22}})));
        ElasticVesselWithSVandP ventricle(
            useComplianceInput=true,
            useExternalPressureInput=true,
            useV0Input=true,
            volume_start=0.0001042,
            Elastance=133322387.415)
            annotation (Placement(transformation(extent={{16,-22},{36,-2}})));
          Modelica.Blocks.Math.Add add annotation (Placement(transformation(
                extent={{-4,-4},{4,4}},
                rotation=270,
                origin={34,6})));
          Modelica.Blocks.Interfaces.RealInput Pext annotation (Placement(
                transformation(
                rotation=180,
                extent={{-10,-10},{10,10}},
                origin={50,12}), iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={30,30})));
          Modelica.Blocks.Interfaces.RealInput V0 annotation (Placement(
                transformation(
                rotation=0,
                extent={{-10,-10},{10,10}},
                origin={0,-4}),iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-20,-10})));
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a q_in annotation (
              Placement(transformation(rotation=0, extent={{36,-22},{56,-2}}),
                iconTransformation(extent={{-50,-20},{-30,0}})));
          Physiolibrary.Types.RealIO.VolumeOutput stressedVolume annotation (
              Placement(transformation(
                rotation=180,
                extent={{-10,-10},{10,10}},
                origin={-26,-10}), iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={30,-10})));
          Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
                transformation(rotation=0, extent={{-56,6},{-36,26}}),
                iconTransformation(extent={{-40,20},{-20,40}})));
          Physiolibrary.Types.RealIO.VolumeOutput volume annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={-26,-28}), iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={6,-10})));
        equation
          connect(drive.C, ventricle.compliance) annotation (Line(
              points={{-11.25,10.82},{26,10.82},{26,-4}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(ventricle.externalPressure, add.y) annotation (Line(
              points={{34,-4},{34,1.6}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(drive.Pi, add.u2) annotation (Line(
              points={{-11.25,17.58},{10,17.58},{10,18},{32,18},{32,10.8},{31.6,
                  10.8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(HR, drive.HR) annotation (Line(points={{-46,16},{-42,16},{-42,
                  16.8},{-32,16.8}}, color={0,0,127}));
          connect(add.u1, Pext) annotation (Line(
              points={{36.4,10.8},{47.2,10.8},{47.2,12},{50,12}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(V0, ventricle.zeroPressureVolume) annotation (Line(
              points={{0,-4},{18,-4}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(drive.V, stressedVolume) annotation (Line(
              points={{-12,3.8},{-8,3.8},{-8,-10},{-26,-10}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(ventricle.q_in, q_in) annotation (Line(
              points={{26,-12},{46,-12}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(ventricle.volume, volume) annotation (Line(
              points={{32,-22},{32,-28},{-26,-28}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(ventricle.StressedVolume, stressedVolume) annotation (Line(
              points={{21.6,-1.8},{21.6,6},{-6,6},{-6,-10},{-26,-10}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-60,-60},{60,40}})),           Icon(coordinateSystem(
                  preserveAspectRatio=false, extent={{-60,-60},{60,40}}),
                graphics={Bitmap(extent={{-34,-44},{28,24}}, fileName=
                      "modelica://Physiolibrary/Resources/Icons/heartVentricle.png"),
                  Text(   extent={{-40,18},{-20,0}},
                  lineColor={0,0,127},
                  pattern=LinePattern.Dash,
                  fillColor={255,170,170},
                  fillPattern=FillPattern.Forward,
                          textString="HR"),Text(
                  extent={{20,20},{42,0}},
                  lineColor={0,0,127},
                  pattern=LinePattern.Dash,
                  fillColor={255,170,170},
                  fillPattern=FillPattern.Forward,
                          textString="Pext"),Text(
                  extent={{-16,0},{6,-20}},
                  lineColor={0,0,127},
                  pattern=LinePattern.Dash,
                  fillColor={255,170,170},
                  fillPattern=FillPattern.Forward,
                          textString="V0"),Rectangle(extent={{-40,40},{40,-20}},
                  lineColor={0,0,127}),Text(
                  extent={{-60,60},{60,42}},
                  lineColor={0,0,127},
                  fillPattern=FillPattern.Forward,
                  textString="%name")}));
        end Ventricle;

        model VentricularInteraction
        //  Physiolibrary.Types.Pressure Plv,Plvf,Pperi,Prv,Prvf,Ppcd,Pth,Pspt;
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rvflow annotation (
             Placement(transformation(extent={{-48,20},{-28,40}}),
                iconTransformation(extent={{-10,90},{10,110}})));
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a lvflow annotation (
             Placement(transformation(extent={{-46,-22},{-26,-2}}),
                iconTransformation(extent={{-10,-110},{10,-90}})));
          Physiolibrary.Types.RealIO.FrequencyInput frequency annotation (
              Placement(transformation(extent={{-78,-40},{-38,0}}),
                iconTransformation(extent={{-100,-12},{-60,28}})));
        Pericardium pericardium(
            lambda(displayUnit="1/m3") = 30000,
            V0=0.0002,
            P0=66.701190423724) annotation (Placement(transformation(
                extent={{13,26},{-13,-26}},
                rotation=180,
                origin={25,12})));
          Physiolibrary.Types.RealIO.PressureInput Pth annotation (Placement(
                transformation(extent={{-6,24},{14,44}}), iconTransformation(
                extent={{-20,-20},{20,20}},
                rotation=180,
                origin={80,8})));
          replaceable Ventricle rightVentricle(drive(
              lambda=23000,
              Es=77993596.637775,
              Pi0=28.757638965416)) annotation (Placement(transformation(
                  rotation=0, extent={{-20,26},{0,46}})));
          replaceable Ventricle leftVentricle(drive(
              lambda=33000,
              useEs_extInput=false,
              Es=383941811.27772,
              Pi0=16.038683206025)) annotation (Placement(transformation(
                rotation=180,
                extent={{10,-10},{-10,10}},
                origin={-10,-16})));
          Septum septum annotation (Placement(transformation(rotation=0, extent=
                   {{-54,-6},{-14,26}})));
          Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(
                transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-14,22})));
          Physiolibrary.Types.RealIO.VolumeOutput rightVentricleVolume
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={-10,90}), iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-60,90})));
          Physiolibrary.Types.RealIO.VolumeOutput leftVentricleVolume
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={-10,-90}), iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={60,-90})));
        equation
          /*Plv = Plvf+Pperi;
  Plvf=e*Peslvf+(1-e)*Pedlvf;

  Prv=Prvf+Pperi;
  Prvf=e*Pesrvf+(1-e)*Pedrvf;

  Pperi=Ppcd+Pth;

  Pspt=Plv-Prv;

Pspt=e*Pesspt+(1-e)*Pedspt;
*/
          //Pspt = leftVentricle.q_in.pressure - rightVentricle.q_in.pressure;
          connect(frequency, leftVentricle.HR) annotation (Line(
              points={{-58,-20},{-36,-20},{-36,-24},{-15,-24}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(rightVentricle.HR, frequency) annotation (Line(
              points={{-15,44},{-58,44},{-58,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(septum.HR,    frequency) annotation (Line(
              points={{-52,10},{-58,10},{-58,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(rightVentricle.stressedVolume, pericardium.Vrvfw) annotation (
             Line(
              points={{-5,36},{-5,19.54},{14.86,19.54}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(lvflow, leftVentricle.q_in) annotation (Line(
              points={{-36,-12},{-26,-12},{-26,-16},{-16.6667,-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(pericardium.pressure, leftVentricle.Pext) annotation (Line(
              points={{35.4,35.4},{44,35.4},{44,-24},{-5,-24}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(Pth, pericardium.Pth) annotation (Line(
              points={{4,34},{14.86,34},{14.86,35.14}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(pericardium.pressure, rightVentricle.Pext) annotation (Line(
              points={{35.4,35.4},{44,35.4},{44,44},{-5,44}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(leftVentricle.stressedVolume, pericardium.Vlvfw) annotation (
              Line(
              points={{-5,-16},{-4,-16},{-4,3.94},{14.86,3.94}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(septum.volume, leftVentricle.V0) annotation (Line(
              points={{-16,10},{-13.3333,10},{-13.3333,-16}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(septum.volume, gain.u) annotation (Line(
              points={{-16,10},{-14,10},{-14,14.8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(pericardium.Vsept, gain.u) annotation (Line(
              points={{14.86,12.26},{-14,12.26},{-14,14.8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(gain.y, rightVentricle.V0) annotation (Line(
              points={{-14,28.6},{-14,28},{-13.3333,28},{-13.3333,36}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(rightVentricle.q_in, rvflow) annotation (Line(
              points={{-16.6667,36},{-28,36},{-28,30},{-38,30}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(septum.rvflow, rvflow) annotation (Line(
              points={{-34,12.56},{-34,30},{-38,30}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(septum.lvflow, leftVentricle.q_in) annotation (Line(
              points={{-34,5.2},{-34,-16},{-16.6667,-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(leftVentricle.volume, leftVentricleVolume) annotation (Line(
                points={{-9,-16},{-6,-16},{-6,-90},{-10,-90}}, color={0,0,127}));
          connect(rightVentricle.volume, rightVentricleVolume) annotation (Line(
                points={{-9,36},{-10,36},{-10,90}}, color={0,0,127}));
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                    {-100,-100},{100,100}}), graphics={Text(
                  extent={{-102,-20},{-76,-32}},
                  lineColor={0,0,255},
                          textString="HR"),Text(
                  extent={{100,-32},{74,-20}},
                  lineColor={0,0,255},
                  fillColor={255,170,170},
                  fillPattern=FillPattern.Forward,
                          textString="Pth"),Bitmap(extent={{-92,84},{-4,-74}},
                  fileName=
                      "modelica://Physiolibrary/Resources/Icons/srdceprava.png"),
                Bitmap(extent={{-18,-102},{94,72}}, fileName=
                      "modelica://Physiolibrary/Resources/Icons/srdceLeva.png"),
                  Polygon(points={{-18,48},{4,48},{6,30},{14,2},{16,-28},{16,-62},
                    {18,-64},{10,-72},{-6,-70},{-8,-52},{-10,-4},{-14,28},{-18,
                    44},{-18,46},{-18,48}},
                  lineColor={0,0,0},
                  smooth=Smooth.Bezier,
                  fillPattern=FillPattern.Forward,
                          fillColor={255,205,205}),Polygon(
                          points={{-58,0},{-64,0},{-66,0},{-62,-12},{-56,-38},{
                    -38,-60},{-6,-76},{24,-72},{44,-50},{62,-18},{68,2},{60,4},
                    {56,-10},{46,-32},{34,-52},{20,-66},{4,-68},{-12,-64},{-44,
                    -42},{-42,-42},{-58,0}},
                  lineColor={0,0,0},
                  smooth=Smooth.Bezier,
                  fillColor={255,205,205},
                          fillPattern=FillPattern.Forward),Text(
                  extent={{-98,-68},{98,-92}},
                  lineColor={0,0,0},
                  lineThickness=1,
                  fillColor={255,205,205},
                  fillPattern=FillPattern.Forward,
                          textString="%name")}), Diagram(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
        end VentricularInteraction;

        model TimeVaryingElastance
          //parameter Physiolibrary.Types.HydraulicElastance Ed "elastance of diastole";
          parameter Boolean useEs_extInput=false
            "=true, if external elastance/compliance value is used" annotation (
            Evaluate=true,
            HideResult=true,
            choices(__Dymola_checkBox=true),
            Dialog(group="External inputs/outputs"));
          parameter Physiolibrary.Types.HydraulicElastance Es
            "elastance of systole"
            annotation (Dialog(enable=not useEs_extInput));
          parameter Physiolibrary.Types.Pressure Pi0 "peak isovolumic pressure";
          parameter HydraulicLambda lambda;
          Physiolibrary.Types.Time tm
            "relative time from the beginning of cardiac cycle";
          discrete Physiolibrary.Types.Time HP "heart period";
          discrete Physiolibrary.Types.Time t0
            "time of beginning of the cardiac cycle";
          discrete Physiolibrary.Types.Time ts "duration of systole";
          Real et;
          parameter Real A=1, B=80, CC=0.375;
          Physiolibrary.Types.RealIO.HydraulicComplianceOutput C annotation (
              Placement(transformation(extent={{-4,-102},{16,-82}}),
                iconTransformation(
                extent={{-14,-14},{14,14}},
                rotation=0,
                origin={66,14})));
          Physiolibrary.Types.HydraulicElastance E;
          Physiolibrary.Types.RealIO.PressureOutput Pi annotation (Placement(
                transformation(extent={{-72,-100},{-52,-80}}),
                iconTransformation(
                extent={{-14,-14},{14,14}},
                rotation=0,
                origin={66,66})));
          Physiolibrary.Types.RealIO.FrequencyInput HR "heart rate" annotation (
             Placement(transformation(extent={{76,58},{116,98}}),
                iconTransformation(
                extent={{-20,-20},{20,20}},
                rotation=0,
                origin={-100,60})));
          Physiolibrary.Types.RealIO.VolumeInput V annotation (Placement(
                transformation(extent={{82,54},{122,94}}), iconTransformation(
                extent={{-20,-20},{20,20}},
                rotation=180,
                origin={60,-40})));
          Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/Es)=
               1/es_int if useEs_extInput annotation (Placement(transformation(
                  extent={{60,60},{100,100}}), iconTransformation(
                extent={{-20,-20},{20,20}},
                rotation=0,
                origin={-100,20})));
        protected
          Physiolibrary.Types.HydraulicElastance es_int;
        equation
          if not useEs_extInput then
            es_int = Es;
          end if;
          tm = time - pre(t0);
        /*  if tm < pre(ts) then
    a = (1 - cos(2 * Modelica.Constants.pi * tm / pre(ts))) / 2;
  else
    a = 0;
  end if;
  E = Ed + Es * a;
  C = 1 / E;
  //  Pi = Pi0 * a;
  */
          when {initial(),tm >= pre(HP)} then
            HP = 1/HR;
            t0 = time;
            ts = 0.16 + 0.3*HP;
          end when;
          et = A*exp(-B*(tm - CC)^2);
          //(5)
          E = et*es_int;
          //(derived (4)
          C = 1/E;
          Pi = (1 - et)*Pi0*(exp(lambda*V) - 1);
          //derived(4)
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                    {-100,-100},{60,100}}), graphics={Rectangle(
                          extent={{-42,80},{50,-76}},
                          lineColor={0,0,255},
                          fillColor={170,255,255},
                          fillPattern=FillPattern.Solid),Text(
                          extent={{-96,82},{-32,58}},
                          lineColor={0,0,255},
                          textString="HR"),Text(
                          extent={{-16,28},{84,-2}},
                          lineColor={0,0,255},
                          textString="Et"),Text(
                          extent={{8,86},{58,56}},
                          lineColor={0,0,255},
                          textString="P"),Text(
                          extent={{-288,134},{260,78}},
                          lineColor={0,0,255},
                          textString="%name"),Text(
                  extent={{44,-52},{76,-80}},
                  lineColor={0,0,255},
                  lineThickness=0.5,
                  fillColor={255,255,170},
                  fillPattern=FillPattern.Solid,
                          textString="V"),Line(
                          points={{-40,0},{-32,0},{-32,4},{-30,26},{-26,40},{-22,
                    42},{-20,38},{-18,22},{-16,0},{6,0},{8,24},{12,40},{16,42},
                    {18,38},{22,0},{44,0}},
                  color={0,0,255},
                          smooth=Smooth.None)}), Diagram(coordinateSystem(
                  extent={{-100,-100},{60,100}})));
        end TimeVaryingElastance;

        type HydraulicLambda = Real (
            final quantity="HydraulicLambda",
            final unit="1/m3",
            displayUnit="1/ml",
            nominal=(1e-5),
            min=0);
        model Pericardium
          parameter Physiolibrary.Types.Volume V0;
          parameter Physiolibrary.Types.Pressure P0;
          parameter HydraulicLambda lambda;
          Physiolibrary.Types.RealIO.VolumeInput Vsept annotation (Placement(
                transformation(extent={{40,-36},{80,4}}), iconTransformation(
                extent={{-11,-11},{11,11}},
                rotation=0,
                origin={-29,1})));
          Physiolibrary.Types.RealIO.PressureOutput pressure annotation (
              Placement(transformation(extent={{-40,-10},{-20,10}}),
                iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={50,90})));
          Physiolibrary.Types.RealIO.VolumeInput Vrvfw annotation (Placement(
                transformation(extent={{40,-36},{80,4}}), iconTransformation(
                extent={{-11,-11},{11,11}},
                rotation=0,
                origin={-29,29})));
          Physiolibrary.Types.RealIO.VolumeInput Vlvfw annotation (Placement(
                transformation(extent={{40,-36},{80,4}}), iconTransformation(
                extent={{-11,-11},{11,11}},
                rotation=0,
                origin={-29,-31})));
          Physiolibrary.Types.Volume Vperi;
          Physiolibrary.Types.Pressure Pperi;
          Physiolibrary.Types.RealIO.VolumeOutput Vrv annotation (Placement(
                transformation(extent={{40,20},{60,40}}), iconTransformation(
                  extent={{40,20},{60,40}})));
          Physiolibrary.Types.RealIO.VolumeOutput Vlv annotation (Placement(
                transformation(extent={{36,20},{56,40}}), iconTransformation(
                  extent={{40,-40},{60,-20}})));
          Physiolibrary.Types.RealIO.PressureInput Pth annotation (Placement(
                transformation(extent={{-50,60},{-10,100}}), iconTransformation(
                  extent={{-40,78},{-18,100}})));
        equation
          Vperi = Vrvfw + Vlvfw;
          Vrv = Vrvfw + Vsept;
          Vlv = Vlvfw - Vsept;
          Pperi = P0*(exp(lambda*(Vperi - V0)) - 1);
          //orig equation in mmHg and ml
           pressure = Pth + Pperi;
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                    {-40,-100},{60,100}}), graphics={Polygon(
                          points={{-18,90},{-18,-90},{-6,-80},{24,-44},{32,-16},
                    {30,10},{24,32},{0,68},{-18,92},{-18,90}},
                  smooth=Smooth.None,
                  lineColor={167,167,255},
                  fillPattern=FillPattern.Forward,
                          fillColor={227,227,255}),Polygon(
                          points={{30,4},{22,6},{-6,8},{-18,6},{-18,4},{-18,0},
                    {-18,-4},{-16,-4},{-8,-6},{24,-4},{30,-4},{30,4}},
                  lineColor={167,167,255},
                  smooth=Smooth.Bezier,
                  fillColor={255,170,170},
                          fillPattern=FillPattern.Forward),Polygon(
                          points={{-18,102},{20,50},{36,14},{36,-30},{16,-62},{
                    -18,-98},{-20,-88},{12,-54},{28,-30},{28,14},{12,48},{-18,
                    90},{-18,102}},
                  lineColor={0,0,255},
                  smooth=Smooth.Bezier,
                  fillColor={255,170,170},
                          fillPattern=FillPattern.Forward),Text(
                  extent={{22,98},{40,80}},
                  lineColor={0,0,255},
                  fillColor={255,170,170},
                  fillPattern=FillPattern.Forward,
                          textString="p"),Text(
                  extent={{-16,14},{12,-10}},
                  lineColor={0,0,255},
                  fillColor={255,170,170},
                  fillPattern=FillPattern.Forward,
                          textString="Vsept"),Text(
                  extent={{-16,40},{10,14}},
                  lineColor={0,0,255},
                  fillColor={255,170,170},
                  fillPattern=FillPattern.Forward,
                          textString="Vrvfw"),Text(
                  extent={{-18,-18},{8,-44}},
                  lineColor={0,0,255},
                  fillColor={255,170,170},
                  fillPattern=FillPattern.Forward,
                          textString="Vlvfw"),Text(
                  extent={{22,40},{38,22}},
                  lineColor={0,0,255},
                  fillColor={255,170,170},
                  fillPattern=FillPattern.Forward,
                          textString="Vrv"),Text(
                  extent={{20,-22},{40,-36}},
                  lineColor={0,0,255},
                  fillColor={255,170,170},
                  fillPattern=FillPattern.Forward,
                          textString="Vlv"),Text(
                  extent={{-10,98},{12,76}},
                  lineColor={0,0,255},
                  fillColor={170,255,255},
                  fillPattern=FillPattern.Forward,
                          textString="Pth"),Text(
                  extent={{-40,120},{64,100}},
                  lineColor={0,0,127},
                  fillPattern=FillPattern.Forward,
                          textString="%name")}), Diagram(coordinateSystem(
                  extent={{-40,-100},{60,100}}), graphics));
        end Pericardium;

        model Heart
          extends Cardiovascular.Interfaces.Heart;
          Physiolibrary.Hydraulic.Components.Inertia Ltc(I(displayUnit=
                  "mmHg.s2/ml") = 10678.18997523, volumeFlow_start(displayUnit=
                  "m3/s") = 0.0001372)
            annotation (Placement(transformation(extent={{-90,30},{-70,50}})));
          Physiolibrary.Hydraulic.Components.IdealValveResistance
            tricuspidValve(Pknee=0, _Ron(displayUnit="(mmHg.s)/ml")=
              3159740.5817355)
            annotation (Placement(transformation(extent={{-48,30},{-28,50}})));
          Physiolibrary.Hydraulic.Components.Inertia Lpv(I(displayUnit=
                  "mmHg.s2/ml") = 19822.372560862, volumeFlow_start(displayUnit=
                 "m3/s") = -1.9e-9)
            annotation (Placement(transformation(extent={{42,30},{62,50}})));
          Physiolibrary.Hydraulic.Components.IdealValveResistance
            pulmonaryValve(Pknee=0, _Ron(displayUnit="(mmHg.s)/ml")=
              733273.1307825)
            annotation (Placement(transformation(extent={{66,30},{86,50}})));
          Physiolibrary.Hydraulic.Components.Inertia Lmt(I(displayUnit=
                  "mmHg.s2/ml") = 10261.557514558, volumeFlow_start(displayUnit=
                 "m3/s") = 0.0001141) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={78,-14})));
          Physiolibrary.Hydraulic.Components.IdealValveResistance mitralValve(
              Pknee=0, _Ron(displayUnit="(mmHg.s)/ml") = 2106493.721157)
            annotation (Placement(transformation(extent={{60,-24},{40,-4}})));
          Physiolibrary.Hydraulic.Components.Inertia Lav(I(displayUnit=
                  "mmHg.s2/ml") = 16250.665802014, volumeFlow_start(displayUnit=
                 "m3/s") = -1.4e-8) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={-40,-14})));
            Physiolibrary.Hydraulic.Components.IdealValveResistance  aorticValve(
              Pknee=0, _Ron(displayUnit="(mmHg.s)/ml") = 2399802.97347)
            annotation (Placement(transformation(extent={{-58,-24},{-78,-4}})));
          replaceable Physiolibrary.Types.Constants.FrequencyConst HR(k=1.2)
            annotation (Placement(transformation(extent={{-52,8},{-36,22}})));
          Physiolibrary.Types.Constants.PressureConst Pth(k=-533.28954966)
            annotation (Placement(transformation(extent={{52,20},{42,30}})));
        VentricularInteraction_flat       ventricularInteraction_flat(
            lambdalv=33000,
            lambdaperi=30000,
            lambdas(displayUnit="1/m3") = 435000,
            lambdarv(displayUnit="1/m3") = 23000,
            Essept(displayUnit="mmHg/ml") = 6499999676.0309,
            V0peri=0.0002,
            Pi0sept=148.00118226939,
            Pi0rv=28.757638965416,
            Pi0lv=16.038683206025,
            Pi0peri=66.701190423724,
            Esrv=77993596.637775,
            Eslv=383941811.27772)
            annotation (Placement(transformation(extent={{-18,-8},{20,32}})));
        equation
          connect(rightHeartInflow, Ltc.q_in) annotation (Line(
              points={{-100,40},{-90,40}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Ltc.q_out, tricuspidValve.q_in) annotation (Line(
              points={{-70,40},{-48,40}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Lpv.q_out, pulmonaryValve.q_in) annotation (Line(
              points={{62,40},{66,40}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(pulmonaryValve.q_out, rightHeartOutflow) annotation (Line(
              points={{86,40},{100,40}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Lmt.q_in, leftHeartInflow) annotation (Line(
              points={{88,-14},{94,-14},{94,-20},{100,-20}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Lmt.q_out, mitralValve.q_in) annotation (Line(
              points={{68,-14},{60,-14}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(aorticValve.q_in, Lav.q_out) annotation (Line(
              points={{-58,-14},{-50,-14}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(aorticValve.q_out, leftHeartOutflow) annotation (Line(
              points={{-78,-14},{-84,-14},{-84,-20},{-100,-20}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(tricuspidValve.q_out, ventricularInteraction_flat.rvflow)
            annotation (Line(
              points={{-28,40},{0.62,40},{0.62,32}},
              color={0,0,0},
              thickness=1));
          connect(ventricularInteraction_flat.rvflow, Lpv.q_in) annotation (
              Line(
              points={{0.62,32},{0.62,40},{42,40}},
              color={0,0,0},
              thickness=1));
          connect(Lav.q_in, ventricularInteraction_flat.lvflow) annotation (
              Line(
              points={{-30,-14},{2,-14},{2,-8},{1,-8}},
              color={0,0,0},
              thickness=1));
          connect(ventricularInteraction_flat.lvflow, mitralValve.q_out)
            annotation (Line(
              points={{1,-8},{2,-8},{2,-14},{40,-14}},
              color={0,0,0},
              thickness=1));
          connect(ventricularInteraction_flat.lvflow, LVCannula) annotation (
              Line(
              points={{1,-8},{2,-8},{2,-68},{50,-68}},
              color={0,0,0},
              thickness=1));
          connect(HR.y, ventricularInteraction_flat.HR) annotation (Line(points=
                 {{-34,15},{-24,15},{-24,12},{-14.2,12}}, color={0,0,127}));
          connect(ventricularInteraction_flat.Pth, Pth.y) annotation (Line(
                points={{16.58,12},{35.29,12},{35.29,25},{40.75,25}}, color={0,
                  0,127}));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}})),           Icon(graphics={
                  Text(   extent={{-100,60},{100,100}},
                  lineColor={0,0,0},
                  textString="Smith")}));
        end Heart;

        model Pulmonary
          extends Cardiovascular.Interfaces.Pulmonary;
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance
            pulmonaryArteries(
            ZeroPressureVolume=0,
            useExternalPressureInput=true,
            volume_start=3.904e-05,
            Elastance=49195960.956135)
            annotation (Placement(transformation(extent={{-72,-18},{-34,18}})));
          Physiolibrary.Hydraulic.Components.Resistor Rpul(Resistance(
                displayUnit="(mmHg.s)/ml") = 20691634.526808) annotation (
              Placement(transformation(
                extent={{-15,-16},{15,16}},
                rotation=0,
                origin={-5,0})));
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance
            pulmonaryVeins(
            ZeroPressureVolume=0,
            useExternalPressureInput=true,
            volume_start=0.0008269,
            Elastance=973253.4281295)
            annotation (Placement(transformation(extent={{36,-18},{72,18}})));
          Physiolibrary.Types.Constants.PressureConst Pth(k=-533.28954966)
            annotation (Placement(transformation(extent={{-92,8},{-80,20}})));
        equation
          connect(q_in, pulmonaryArteries.q_in) annotation (Line(
              points={{-100,0},{-84,0},{-84,2.22045e-16},{-53,2.22045e-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(pulmonaryArteries.q_in, Rpul.q_in) annotation (Line(
              points={{-53,2.22045e-16},{-42,2.22045e-16},{-42,4.44089e-16},{-20,
                  4.44089e-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Rpul.q_out, pulmonaryVeins.q_in) annotation (Line(
              points={{10,4.44089e-16},{36,4.44089e-16},{36,2.22045e-16},{54,
                  2.22045e-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(pulmonaryVeins.q_in, q_out) annotation (Line(
              points={{54,2.22045e-16},{80,2.22045e-16},{80,0},{100,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Pth.y, pulmonaryArteries.externalPressure) annotation (Line(
              points={{-78.5,14},{-58,14},{-58,14.4},{-37.8,14.4}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(pulmonaryArteries.externalPressure, pulmonaryVeins.externalPressure)
            annotation (Line(
              points={{-37.8,14.4},{16.1,14.4},{16.1,14.4},{68.4,14.4}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(graphics={
                  Text(   extent={{-100,60},{100,100}},
                  lineColor={0,0,0},
                  textString="Smith")}));
        end Pulmonary;

        model Systemic
          extends Cardiovascular.Interfaces.Systemic;
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance aorta(
            ZeroPressureVolume=0,
            volume_start=0.0001241,
            Elastance=92165766.41999)
            annotation (Placement(transformation(extent={{36,-14},{68,18}})));
          Physiolibrary.Hydraulic.Components.Resistor Rsys(Resistance(
                displayUnit="(mmHg.s)/ml") = 145054757.50752) annotation (
              Placement(transformation(
                extent={{-16,-16},{16,16}},
                rotation=180,
                origin={-8,0})));
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance venaCava(
            ZeroPressureVolume=0,
            volume_start=0.0002952,
            Elastance=786602.0857485)
            annotation (Placement(transformation(extent={{-72,-16},{-40,16}})));
        equation
          connect(aorta.q_in, q_in) annotation (Line(
              points={{52,2},{70,2},{70,0},{100,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(aorta.q_in, Rsys.q_in) annotation (Line(
              points={{52,2},{20,2},{20,-2.22045e-15},{8,-2.22045e-15}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Rsys.q_out, venaCava.q_in) annotation (Line(
              points={{-24,1.77636e-15},{-40,1.77636e-15},{-40,2.22045e-16},{-56,
                  2.22045e-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(venaCava.q_in, q_out) annotation (Line(
              points={{-56,2.22045e-16},{-80,2.22045e-16},{-80,0},{-100,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(AortaCannulla, aorta.q_in) annotation (Line(
              points={{70,-90},{52,-90},{52,2}},
              color={0,0,0},
              thickness=1));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}})),           Icon(graphics={
                  Text(   extent={{-100,60},{100,100}},
                  lineColor={0,0,0},
                  textString="Smith")}));
        end Systemic;

        model ElasticWall

          Physiolibrary.Types.RealIO.PressureInput prv annotation (Placement(
                transformation(extent={{-26,32},{14,72}}), iconTransformation(
                extent={{-20,-20},{20,20}},
                rotation=270,
                origin={-38,6})));
          Physiolibrary.Types.RealIO.PressureInput plv annotation (Placement(
                transformation(extent={{-26,-54},{14,-14}}), iconTransformation(
                extent={{-20,-20},{20,20}},
                rotation=90,
                origin={-52,-50})));
          Physiolibrary.Types.RealIO.PressureOutput pressure annotation (
              Placement(transformation(extent={{-2,-94},{18,-74}}),
                iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={110,-46})));
          Physiolibrary.Types.RealIO.VolumeOutput volume annotation (Placement(
                transformation(extent={{-112,-66},{-92,-46}}),
                iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-96,-56})));
          parameter Physiolibrary.Types.Volume V0=0;
          Physiolibrary.Types.RealIO.HydraulicComplianceInput compliance
            annotation (Placement(transformation(extent={{-24,42},{16,82}}),
                iconTransformation(
                extent={{-20,-20},{20,20}},
                rotation=270,
                origin={-96,6})));
        equation
          pressure = plv - prv;
          pressure = (volume - V0)/compliance;
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                    {-100,-100},{100,100}}), graphics={Text(
                  extent={{-30,26},{22,-4}},
                  lineColor={0,0,255},
                  lineThickness=0.5,
                          textString="prv"),Text(
                  extent={{-42,-38},{10,-68}},
                  lineColor={0,0,255},
                  lineThickness=0.5,
                          textString="plv"),Text(
                  extent={{26,-32},{102,-56}},
                  lineColor={0,0,255},
                  lineThickness=0.5,
                          textString="pressure"),Text(
                  extent={{-150,-26},{-70,-46}},
                  lineColor={0,0,255},
                  lineThickness=0.5,
                          textString="Volume"),Polygon(
                          points={{-100,-14},{-40,-34},{-6,-40},{8,-40},{40,-34},
                    {100,-14},{98,-14},{-100,-14}},
                  lineColor={0,0,255},
                  smooth=Smooth.None,
                  fillPattern=FillPattern.Forward,
                          fillColor={255,170,170}),Text(
                  extent={{-128,-10},{-60,-44}},
                  lineColor={0,0,255},
                  fillColor={255,170,170},
                  fillPattern=FillPattern.Forward,
                  textString="compliance
"),             Text(
                  extent={{20,40},{166,-18}},
                  lineColor={0,0,255},
                  horizontalAlignment=TextAlignment.Left,
                  textString="  pressure = plv -prv;
  pressure = (volume-V0) /compliance;")}), Diagram(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                graphics));
        end ElasticWall;

        model ElasticVesselWithSVandP
          "elastic vessel computes aditionally stressed volume and pressure"
          extends Physiolibrary.Hydraulic.Components.ElasticVesselElastance;
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
      end Parts;

      model HemodynamicsSmithControl
        extends Interfaces.Controlled.System(
          redeclare ControlledParts.PulmonaryControl pulmonaryCirculation,
          redeclare replaceable ControlledParts.HeartControl heart,
          redeclare ControlledParts.SystemicControl systemicCirculation(
              venaCava(volume_start=0.0022952, ZeroPressureVolume=0.002), aorta(
                volume_start=0.0008841, ZeroPressureVolume=0.00076)),
          redeclare replaceable Model.Control.BloodVolumeControl
            longTermControl,
          redeclare ControlledParts.Baroreflex shortTermControl);
      /*    redeclare CardiovascularDevel.Model.Control.StenosisControl stenosisControl(
      venacavastenosis(InitialElastance=786602.0857485, FinalElastance=786602.0857485),
      AVBackFlowConductance(k(displayUnit="ml/(mmHg.s)") = 7.5006157584566e-14),
      aorticstenosis(InitialResistance=2399802.97347, FinalResistance=2399802.97347)),*/

          extends Cardiovascular.Icons.Runnable_System;
        annotation (experiment(
            StopTime=5,
            __Dymola_NumberOfIntervals=5000,
            Tolerance=0.001));
      end HemodynamicsSmithControl;

      package ControlledParts
        extends Modelica.Icons.UtilitiesPackage;
        model PulmonaryControl
          extends Parts.Pulmonary(pulmonaryArteries(volume_start=5.904e-05,
                ZeroPressureVolume=2e-05), pulmonaryVeins(volume_start=
                  0.0015269, ZeroPressureVolume=0.0007));
          extends Interfaces.Controlled.Pulmonary;
          Modelica.Blocks.Math.Add add
            annotation (Placement(transformation(extent={{72,-42},{92,-22}})));
        equation
          connect(pulmonaryArteries.volume, add.u2) annotation (Line(
              points={{-41.6,-18},{-40,-18},{-40,-38},{70,-38}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(pulmonaryVeins.volume, add.u1) annotation (Line(
              points={{64.8,-18},{66,-18},{66,-26},{70,-26}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(add.y, busConnector.pulmonaryBloodVolume) annotation (Line(
              points={{93,-32},{92,-32},{92,24},{-80,24},{-80,34}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{-25,58},{-25,58}}));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics));
        end PulmonaryControl;

        model SystemicControl
          extends Parts.Systemic(venaCava(useComplianceInput=true), Rsys(
                useConductanceInput=true));
          extends Interfaces.Controlled.Systemic;
          Model.Control.AortaPressureMeasurement aortaPressureMeasurement
            annotation (Placement(transformation(extent={{4,10},{24,30}})));
          Modelica.Blocks.Math.Add add
            annotation (Placement(transformation(extent={{72,-34},{92,-14}})));
        equation
          connect(venaCava.compliance, busConnector.venacavacompliance)
            annotation (Line(
              points={{-56,12.8},{-56,34},{-80,34}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(Rsys.cond, busConnector.peripheralconductance) annotation (
              Line(
              points={{-8,-9.6},{-4,-9.6},{-4,34},{-80,34}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{5,1},{5,1}}));
          connect(Rsys.q_in, aortaPressureMeasurement.q_in) annotation (Line(
              points={{8,0},{8,8},{10,8},{10,14}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(aortaPressureMeasurement.Pmean, busConnector.aortameanpressure)
            annotation (Line(
              points={{21,23},{26,23},{26,34},{-80,34}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(aorta.volume, add.u1) annotation (Line(
              points={{61.6,-14},{64,-14},{64,-20},{70,-20},{70,-18}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(add.u2, venaCava.volume) annotation (Line(
              points={{70,-30},{-46.4,-30},{-46.4,-16}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(add.y, busConnector.systemicBloodVolume) annotation (Line(
              points={{93,-24},{92,-24},{92,34},{-80,34}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{-25,60},{-25,60}}));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics));
        end SystemicControl;

        model HeartControl

          extends Interfaces.Controlled.Heart;
          extends Parts.Heart(redeclare Types.Constants.FrequencyControl HR,
              aorticValve(useLimitationInputs=false));
        equation
        //  connect(volume, busConnector.heartvolume);
          connect(HR.c, busConnector.heartrate) annotation (Line(
              points={{-48,15},{-54,15},{-54,18},{-66,18},{-66,86},{-98,86}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(ventricularInteraction.busConnector, busConnector)
            annotation (Line(
              points={{-9.6,27.04},{-9.6,86},{-98,86}},
              color={0,0,255},
              thickness=0.5,
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(ventricularInteraction.rightVentricleVolume, busConnector.heartBloodVolume)
            annotation (Line(
              points={{17.4,26.5},{17.4,86},{-98,86}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics));
        end HeartControl;

        model VIVolume
          extends Parts.VentricularInteraction(redeclare VentricleControlled
              rightVentricle(drive(useEs_extInput=true)), redeclare
              VentricleControlled leftVentricle(drive(useEs_extInput=true)));
          Physiolibrary.Types.RealIO.VolumeOutput volume annotation (Placement(
                transformation(extent={{34,-44},{54,-24}}), iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={38,50})));
          Modelica.Blocks.Math.Add add
            annotation (Placement(transformation(extent={{2,-40},{16,-26}})));
          Physiolibrary.Types.BusConnector busConnector annotation (Placement(
                transformation(extent={{-72,32},{-32,72}}), iconTransformation(
                  extent={{-72,32},{-32,72}})));
        equation
          connect(rightVentricle.volume, add.u2) annotation (Line(
              points={{-9,36},{-10,36},{-10,-37.2},{0.6,-37.2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(leftVentricle.volume, add.u1) annotation (Line(
              points={{-9,-12},{-9,-28.8},{0.6,-28.8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(add.y, rightVentricleVolume) annotation (Line(
              points={{16.7,-33},{26.35,-33},{26.35,-34},{44,-34}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(leftVentricle.hydrauliccompliance, busConnector.lvcompliance)
            annotation (Line(
              points={{-15.5,-23.8},{-15.5,-40},{-52,-40},{-52,52}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(rightVentricle.hydrauliccompliance, busConnector.rvcompliance)
            annotation (Line(
              points={{-15.5,47.8},{-15.5,52},{-52,52}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                    {-100,-100},{100,100}}), graphics={Text(
                  extent={{46,60},{98,42}},
                  lineColor={0,0,255},
                          textString="volume")}), Diagram(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                graphics={Text(
                  extent={{-40,56},{24,52}},
                  lineColor={0,0,255},
                          textString=
                    "rvcompliance ->rightVentricle.drive.Es_ext"),Text(
                  extent={{-62,-42},{2,-46}},
                  lineColor={0,0,255},
                          textString=
                    "lvcompliance ->leftVentricle.drive.Es_ext")}));
        end VIVolume;

        model Baroreflex
          extends Model.Control.Baroreflex(baroreceptor(
              PAOmedia=12486.574838127,
              HR0Param=1.2,
              EV0right=77993596.637775,
              EV0left=383835153.36779,
              EV0venacava=1.2713543710584e-06,
              RS0=145054757.50752));
        end Baroreflex;

        model AorticValveStenosisScenario
          extends Model.Scenario.StenosisControl(
            venacavastenosis(InitialElastance=786602.0857485, FinalElastance=
                  786602.0857485),
            aorticstenosis(
              duration=60,
              InitialResistance(displayUnit="(mmHg.s)/ml") = 2399802.97347,
              FinalResistance(displayUnit="(mmHg.s)/ml") = 10665790.9932),
            mitralvalvestenosis(InitialResistance=2106493.721157,
                FinalResistance=2106493.721157),
            AVgon(k(displayUnit="ml/(mmHg.s)") = 1.2000985213531e-12),
            mvgoff(k(displayUnit="ml/(mmHg.s)") = 1.2000985213531e-12));

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics));
        end AorticValveStenosisScenario;

        model AorticValveHeartControl
          extends HeartControl(aorticValve(useLimitationInputs=true));
        equation
          connect(aorticValve.Goff, busConnector.avbackflowconductance)
            annotation (Line(
              points={{-74,-4},{-74,2},{-98,2},{-98,86}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(aorticValve.Gon, busConnector.avoutflowresistance)
            annotation (Line(
              points={{-62,-4},{-62,6},{-98,6},{-98,86}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics));
        end AorticValveHeartControl;

        model VentricleControlled
          extends Parts.Ventricle(drive(useEs_extInput=true));
          Physiolibrary.Types.RealIO.HydraulicComplianceInput
            hydrauliccompliance annotation (Placement(transformation(extent={{-12,
                    18},{28,58}}), iconTransformation(
                extent={{-9,-9},{9,9}},
                rotation=270,
                origin={-33,49})));
        equation
          connect(drive.Es_ext, hydrauliccompliance) annotation (Line(
              points={{-32,11.6},{-56,11.6},{-56,38},{8,38}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                    {-60,-60},{60,40}}), graphics), Diagram(coordinateSystem(
                  preserveAspectRatio=false, extent={{-60,-60},{60,40}}),
                graphics));
        end VentricleControlled;
      end ControlledParts;

      model StenosisAorticValve
        extends HemodynamicsSmithControl(redeclare
            ControlledParts.AorticValveHeartControl heart, redeclare
            ControlledParts.AorticValveStenosisScenario scenarioControl(AVgon(k(
                  displayUnit="ml/(mmHg.s)"))));
        annotation (experiment(StopTime=120, __Dymola_NumberOfIntervals=5000));
      end StenosisAorticValve;

      model Bleeding
        extends HemodynamicsSmithControl(redeclare
            Scenario.BleedingTransfusionScenario scenarioControl(
            Tbd=300,
            BloodLoss=0.0005,
            Tts=600,
            Ttd=600,
            BloodTrans=0), longTermControl(redeclare
              Control.BloodVolume.RBCBleeding redBloodCells, redeclare
              Control.BloodVolume.PlasmaBleeding plasma));
        annotation (experiment(StopTime=3600, __Dymola_NumberOfIntervals=5000));
      end Bleeding;
      annotation (Documentation(info="<html>
<p>Model as presented in [1], reimplemented an extended.</p>
<p><br>[1] 	Smith BW, Chase JG, Nokes RI, Shaw GM, Wake G. Minimal haemodynamic system model including ventricular interaction and valve dynamics. Med Eng Phys 2004;26:131&ndash;9.</p>
</html>"));
    end Smith2004;

    package Fernandez
      extends Modelica.Icons.ExamplesPackage;
      model Hemodynamics_shallow
            extends Cardiovascular.Icons.Runnable_Shallow;

        Physiolibrary.Hydraulic.Components.Inertia Ltc(I(displayUnit=
                "mmHg.s2/ml") = 10678.18997523, volumeFlow_start(displayUnit=
                "m3/s") = 0.0001372)
          annotation (Placement(transformation(extent={{-94,42},{-74,62}})));
        Physiolibrary.Hydraulic.Components.IdealValveResistance tricuspidValve(
            Pknee=0, _Ron(displayUnit="(mmHg.s)/ml") = 3159740.5817355)
          annotation (Placement(transformation(extent={{-52,42},{-32,62}})));
        Physiolibrary.Hydraulic.Components.Inertia Lpv(I(displayUnit=
                "mmHg.s2/ml") = 19822.372560862, volumeFlow_start(displayUnit=
                "m3/s") = -1.9e-9)
          annotation (Placement(transformation(extent={{38,42},{58,62}})));
        Physiolibrary.Hydraulic.Components.IdealValveResistance pulmonaryValve(
            Pknee=0, _Ron(displayUnit="(mmHg.s)/ml") = 733273.1307825)
          annotation (Placement(transformation(extent={{62,42},{82,62}})));
        Physiolibrary.Hydraulic.Components.Inertia Lmt(I(displayUnit=
                "mmHg.s2/ml") = 10261.557514558, volumeFlow_start(displayUnit=
                "m3/s") = 0.0001141) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={74,-22})));
        Physiolibrary.Hydraulic.Components.IdealValveResistance mitralValve(
            Pknee=0, _Ron(displayUnit="(mmHg.s)/ml") = 2106493.721157)
          annotation (Placement(transformation(extent={{56,-32},{36,-12}})));
        Physiolibrary.Hydraulic.Components.Inertia Lav(I(displayUnit=
                "mmHg.s2/ml") = 16250.665802014, volumeFlow_start(displayUnit=
                "m3/s") = -1.4e-8) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-44,-22})));
          Physiolibrary.Hydraulic.Components.IdealValveResistance  aorticValve(
            Pknee=0, _Ron(displayUnit="(mmHg.s)/ml") = 2399802.97347)
          annotation (Placement(transformation(extent={{-62,-32},{-82,-12}})));
        replaceable Physiolibrary.Types.Constants.FrequencyConst HR(k=1.2)
          annotation (Placement(transformation(extent={{-56,20},{-40,34}})));
        replaceable Smith2004.Parts.VentricularInteraction
                                 ventricularInteraction
          annotation (Placement(transformation(extent={{-28,-14},{32,40}})));
        Physiolibrary.Types.Constants.PressureConst Pth(k=-533.28954966)
          annotation (Placement(transformation(extent={{38,32},{48,42}})));
        Physiolibrary.Hydraulic.Components.ElasticVesselElastance
          pulmonaryArteries(
          ZeroPressureVolume=0,
          useExternalPressureInput=true,
          volume_start=3.904e-05,
          Elastance=49195960.956135) annotation (Placement(transformation(
              extent={{-19,-18},{19,18}},
              rotation=0,
              origin={-175,-30})));
        Physiolibrary.Hydraulic.Components.Resistor Rpul(Resistance(displayUnit=
               "(mmHg.s)/ml") = 20691634.526808) annotation (Placement(
              transformation(
              extent={{-15,-16},{15,16}},
              rotation=90,
              origin={-177,10})));
        Physiolibrary.Hydraulic.Components.ElasticVesselElastance
          pulmonaryVeins(
          ZeroPressureVolume=0,
          useExternalPressureInput=true,
          volume_start=0.0008269,
          Elastance=973253.4281295) annotation (Placement(transformation(
              extent={{-18,-18},{18,18}},
              rotation=0,
              origin={-178,50})));
        Physiolibrary.Types.Constants.PressureConst Pth1(k=-533.28954966)
          annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=0,
              origin={-226,44})));
        Physiolibrary.Hydraulic.Components.ElasticVesselElastance aorta(
          ZeroPressureVolume=0,
          volume_start=0.0001241,
          Elastance=92165766.41999)
          annotation (Placement(transformation(extent={{186,34},{218,66}})));
        Physiolibrary.Hydraulic.Components.Resistor Rsys(Resistance(displayUnit=
               "(mmHg.s)/ml") = 145054757.50752) annotation (Placement(
              transformation(
              extent={{-16,-16},{16,16}},
              rotation=270,
              origin={202,6})));
        Physiolibrary.Hydraulic.Components.ElasticVesselElastance venaCava(
          ZeroPressureVolume=0,
          volume_start=0.0002952,
          Elastance=786602.0857485)
          annotation (Placement(transformation(extent={{186,-44},{218,-12}})));
      equation
        connect(Ltc.q_out, tricuspidValve.q_in) annotation (Line(
            points={{-74,52},{-52,52}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(tricuspidValve.q_out, ventricularInteraction.rvflow)
          annotation (Line(
            points={{-32,52},{4,52},{4,40},{2,40}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(ventricularInteraction.rvflow, Lpv.q_in) annotation (Line(
            points={{2,40},{20,40},{20,52},{38,52}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(Lpv.q_out, pulmonaryValve.q_in) annotation (Line(
            points={{58,52},{62,52}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(Pth.y, ventricularInteraction.Pth) annotation (Line(
            points={{49.25,37},{52,37},{52,15.16},{26,15.16}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(ventricularInteraction.frequency, HR.y) annotation (Line(
            points={{-22,15.16},{-30,15.16},{-30,27},{-38,27}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Lmt.q_out, mitralValve.q_in) annotation (Line(
            points={{64,-22},{56,-22}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(mitralValve.q_out, ventricularInteraction.lvflow) annotation (
           Line(
            points={{36,-22},{2,-22},{2,-14}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(Lav.q_in, ventricularInteraction.lvflow) annotation (Line(
            points={{-34,-22},{0,-22},{0,-14},{2,-14}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(aorticValve.q_in, Lav.q_out) annotation (Line(
            points={{-62,-22},{-54,-22}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pulmonaryArteries.q_in, Rpul.q_in) annotation (Line(
            points={{-175,-30},{-176,-30},{-176,-5},{-177,-5}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(Rpul.q_out, pulmonaryVeins.q_in) annotation (Line(
            points={{-177,25},{-176,25},{-176,50},{-178,50}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(Pth1.y, pulmonaryArteries.externalPressure) annotation (Line(
            points={{-218.5,44},{-198,44},{-198,-15.6},{-159.8,-15.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pulmonaryArteries.externalPressure, pulmonaryVeins.externalPressure)
          annotation (Line(
            points={{-159.8,-15.6},{-198,-15.6},{-198,64.4},{-163.6,64.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(aorta.q_in, Rsys.q_in) annotation (Line(
            points={{202,50},{202,22}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(Rsys.q_out, venaCava.q_in) annotation (Line(
            points={{202,-10},{202,-28}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pulmonaryVeins.q_in, Ltc.q_in) annotation (Line(
            points={{-178,50},{-136,50},{-136,52},{-94,52}},
            color={0,0,0},
            thickness=1));
        connect(pulmonaryArteries.q_in, aorticValve.q_out) annotation (Line(
            points={{-175,-30},{-128,-30},{-128,-22},{-82,-22}},
            color={0,0,0},
            thickness=1));
        connect(Lmt.q_in, venaCava.q_in) annotation (Line(
            points={{84,-22},{144,-22},{144,-28},{202,-28}},
            color={0,0,0},
            thickness=1));
        connect(aorta.q_in, pulmonaryValve.q_out) annotation (Line(
            points={{202,50},{142,50},{142,52},{82,52}},
            color={0,0,0},
            thickness=1));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-340,-80},
                  {360,80}})),
          Icon(coordinateSystem(extent={{-340,-80},{360,80}},
                preserveAspectRatio=false)),
          experiment(
            StartTime=0,
            StopTime=100,
            Tolerance=1e-006,
            Interval=0.2));
      end Hemodynamics_shallow;

      model HemodynamicsFernandez
        extends Cardiovascular.System(
          redeclare Parts.PulmonaryCirculation pulmonaryCirculation,
          redeclare Parts.Heart heart,
          redeclare Parts.SystemicCirculation systemicCirculation);
          extends Cardiovascular.Icons.Runnable_System;
        annotation (experiment(StopTime=5, __Dymola_NumberOfIntervals=5000),
            Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-20,-40},
                  {20,40}})));
      end HemodynamicsFernandez;

      package Parts
        extends Modelica.Icons.UtilitiesPackage;
          connector HydraulicElastanceInput = input
            Physiolibrary.Types.HydraulicElastance
          "input HydraulicElastance as connector" annotation (
          defaultComponentName="hydraulicelastance",
          Icon(graphics={Polygon(
                        points={{-100,100},{100,0},{-100,-100},{-100,100}},
                        lineColor={0,0,127},
                        fillColor={0,0,127},
                        fillPattern=FillPattern.Solid)}, coordinateSystem(
              extent={{-100,-100},{100,100}},
              preserveAspectRatio=true,
              initialScale=0.2)),
          Diagram(coordinateSystem(
              preserveAspectRatio=true,
              initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                        points={{0,50},{100,0},{0,-50},{0,50}},
                        lineColor={0,0,127},
                        fillColor={0,0,127},
                        fillPattern=FillPattern.Solid),Text(
                        extent={{-10,85},{-10,60}},
                        lineColor={0,0,127},
                        textString="%name")}),
          Documentation(info="<html>
             <p>
             Connector with one input signal of type HydraulicElastance.
             </p>
             </html>"));
        connector HydraulicElastanceOutput = output
            Physiolibrary.Types.HydraulicElastance
          "output HydraulicElastance as connector" annotation (
          defaultComponentName="hydraulicelastance",
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                        points={{-100,100},{100,0},{-100,-100},{-100,100}},
                        lineColor={0,0,127},
                        fillColor={255,255,255},
                        fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                        points={{-100,50},{0,0},{-100,-50},{-100,50}},
                        lineColor={0,0,127},
                        fillColor={255,255,255},
                        fillPattern=FillPattern.Solid),Text(
                        extent={{30,110},{30,60}},
                        lineColor={0,0,127},
                        textString="%name")}),
          Documentation(info="<html>
           <p>
           Connector with one output signal of type HydraulicElastance.
           </p>
           </html>"));
        connector HydraulicResistanceInput = input
            Physiolibrary.Types.HydraulicResistance
          "input HydraulicResistance as connector" annotation (
          defaultComponentName="hydraulicresistance",
          Icon(graphics={Polygon(
                        points={{-100,100},{100,0},{-100,-100},{-100,100}},
                        lineColor={0,0,127},
                        fillColor={0,0,127},
                        fillPattern=FillPattern.Solid)}, coordinateSystem(
              extent={{-100,-100},{100,100}},
              preserveAspectRatio=true,
              initialScale=0.2)),
          Diagram(coordinateSystem(
              preserveAspectRatio=true,
              initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                        points={{0,50},{100,0},{0,-50},{0,50}},
                        lineColor={0,0,127},
                        fillColor={0,0,127},
                        fillPattern=FillPattern.Solid),Text(
                        extent={{-10,85},{-10,60}},
                        lineColor={0,0,127},
                        textString="%name")}),
          Documentation(info="<html>
             <p>
             Connector with one input signal of type HydraulicResistance.
             </p>
             </html>"));
        connector HydraulicResistanceOutput = output
            Physiolibrary.Types.HydraulicResistance
          "output HydraulicResistance as connector" annotation (
          defaultComponentName="hydraulicresistance",
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                        points={{-100,100},{100,0},{-100,-100},{-100,100}},
                        lineColor={0,0,127},
                        fillColor={255,255,255},
                        fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                        points={{-100,50},{0,0},{-100,-50},{-100,50}},
                        lineColor={0,0,127},
                        fillColor={255,255,255},
                        fillPattern=FillPattern.Solid),Text(
                        extent={{30,110},{30,60}},
                        lineColor={0,0,127},
                        textString="%name")}),
          Documentation(info="<html>
           <p>
           Connector with one output signal of type HydraulicResistance.
           </p>
           </html>"));

        model pulsos "generates relative position in heart period from 0 to 1"
          discrete Physiolibrary.Types.Time HP(start=0)
            "heart period - duration of cardiac cycle";
          Boolean b(start=false);
          Physiolibrary.Types.RealIO.TimeOutput T0
            "start time of cardiac cycle";
          Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
                transformation(extent={{-158,20},{-118,60}}),
                iconTransformation(extent={{-88,-32},{-48,8}})));
          Modelica.Blocks.Interfaces.RealOutput heartphase annotation (
              Placement(transformation(extent={{-162,64},{-142,84}}),
                iconTransformation(extent={{72,-24},{92,-4}})));
        equation
          b = time - pre(T0) >= pre(HP);
          when {initial(),b} then
            T0 = time;
            HP = 1/HR;
          end when;
          heartphase = (time - pre(T0))/pre(HP);
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                    {-100,-100},{100,100}}), graphics={Ellipse(
                          extent={{-46,52},{68,-78}},
                          lineColor={0,0,255},
                          fillPattern=FillPattern.Solid,
                          fillColor={255,170,170})}), Diagram(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                graphics));
        end pulsos;

        model VariableElasticityGenerator

          pulsos pulsos1(HP(displayUnit="s", start=1))
            annotation (Placement(transformation(extent={{-62,42},{-42,62}})));
          Modelica.Blocks.Math.Product product1 annotation (Placement(
                transformation(
                extent={{-5,-5},{5,5}},
                rotation=270,
                origin={11,23})));
          Modelica.Blocks.Sources.Constant const(k=0.87) annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={30,56})));
          Modelica.Blocks.Math.Product product2 annotation (Placement(
                transformation(
                extent={{-5,-5},{5,5}},
                rotation=0,
                origin={-9,31})));
          Physiolibrary.Types.RealIO.HydraulicComplianceInput maxelastance
            annotation (Placement(transformation(extent={{-104,2},{-64,42}}),
                iconTransformation(
                extent={{-14,-14},{14,14}},
                rotation=270,
                origin={-4,76})));
          Physiolibrary.Types.RealIO.FrequencyInput heartRate annotation (
              Placement(transformation(extent={{-106,32},{-66,72}}),
                iconTransformation(
                extent={{-13,-13},{13,13}},
                rotation=270,
                origin={-37,77})));
          Physiolibrary.Types.RealIO.HydraulicComplianceOutput
            hydrauliccompliance annotation (Placement(transformation(extent={{
                    30,4},{50,24}}), iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-14,-14})));
          Curve curve(
            x={0,0.0625,0.125,0.1875,0.25,0.3125,0.375,0.4375,1},
            y={0.0066,0.16,0.32,0.45,0.625,0.78,0.27,0.0066,0.0066},
            slope={0,0,2.32,2.44,2.64,-2.84,-6.1872,0,0})
            annotation (Placement(transformation(extent={{-30,48},{-10,68}})));
          HydraulicElastanceToCompliance hydrauliccompliance1
            annotation (Placement(transformation(extent={{0,54},{8,62}})));
        equation
          connect(heartRate, pulsos1.HR) annotation (Line(
              points={{-86,52},{-76,52},{-76,50.8},{-58.8,50.8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(maxelastance, product2.u2) annotation (Line(
              points={{-84,22},{-48,22},{-48,28},{-15,28}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(product2.y, product1.u2) annotation (Line(
              points={{-3.5,31},{0.25,31},{0.25,29},{8,29}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(product1.y, hydrauliccompliance) annotation (Line(
              points={{11,17.5},{11,14},{40,14}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(const.y, product1.u1) annotation (Line(
              points={{41,56},{42,56},{42,29},{14,29}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(pulsos1.heartphase, curve.u) annotation (Line(
              points={{-43.8,50.6},{-36.9,50.6},{-36.9,58},{-30,58}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(product2.u1, hydrauliccompliance1.y) annotation (Line(
              points={{-15,34},{-20,34},{-20,42},{14,42},{14,58},{9,58}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(curve.val, hydrauliccompliance1.hydraulicelastance)
            annotation (Line(
              points={{-10,58},{-6,58},{-6,57.9},{-0.1,57.9}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                    {-100,-100},{100,100}}), graphics={Rectangle(
                          extent={{-58,62},{20,0}},
                          lineColor={0,0,255},
                          fillColor={255,240,234},
                          fillPattern=FillPattern.Solid),Text(
                          extent={{-56,64},{-20,46}},
                          lineColor={0,0,255},
                          fillColor={0,0,255},
                          fillPattern=FillPattern.Solid,
                          textString="HR"),Text(
                          extent={{-26,64},{26,46}},
                          lineColor={0,0,255},
                          fillColor={0,0,255},
                          fillPattern=FillPattern.Solid,
                          textString="Emax"),Line(
                          points={{-52,4},{-44,22},{-36,48},{-30,48},{-28,36},{
                    -26,6},{-20,6},{0,6}},
                          color={0,0,255},
                          smooth=Smooth.Bezier)}), Diagram(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                graphics));
        end VariableElasticityGenerator;

        model Heart
          extends Cardiovascular.Interfaces.Heart;
          //  extends Physiolibrary.Icons.RightHeart;
          replaceable
            Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
            ERMAX(k=103991462.1837)
            annotation (Placement(transformation(extent={{-16,38},{-34,52}})));
          replaceable
            Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
            ELMAX(k=106657909.932)
            annotation (Placement(transformation(extent={{96,44},{80,60}})));
          replaceable Physiolibrary.Types.Constants.FrequencyConst heartRate(k=
                1.3333333333333)
            annotation (Placement(transformation(extent={{-86,48},{-68,62}})));
          Physiolibrary.Hydraulic.Components.IdealValve tricuspidValve(
              useLimitationInputs=true) annotation (Placement(transformation(
                  extent={{-74,-42},{-54,-22}})));
          Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle(
            useComplianceInput=true,
            ZeroPressureVolume=0,
            volume_start=0.00015)
            annotation (Placement(transformation(extent={{-52,-12},{-32,8}})));
          Physiolibrary.Types.Constants.HydraulicConductanceConst
            backflowConductance(k=0)
            annotation (Placement(transformation(extent={{-78,2},{-60,16}})));
          Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
            RRV(k(displayUnit="(mmHg.s)/ml") = 1706526.558912)
            annotation (Placement(transformation(extent={{-88,-20},{-72,-4}})));
          Physiolibrary.Hydraulic.Components.IdealValve mitralValve(
              useLimitationInputs=true)
            annotation (Placement(transformation(extent={{40,-38},{60,-18}})));
          Physiolibrary.Hydraulic.Components.ElasticVessel leftVentricle(
            useComplianceInput=true,
            ZeroPressureVolume=0,
            volume_start=0.00015)
            annotation (Placement(transformation(extent={{68,-10},{88,10}})));
          Physiolibrary.Types.Constants.HydraulicConductanceConst
            backflowConductance1(k=0)
            annotation (Placement(transformation(extent={{36,8},{54,22}})));
          Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
            RLV(k(displayUnit="(mmHg.s)/ml") = 7839356.380002)
            annotation (Placement(transformation(extent={{24,-12},{40,4}})));
          VariableElasticityGenerator variableElasticityGenerator(const(k=0.87))
            annotation (Placement(transformation(extent={{-70,4},{-22,46}})));
          VariableElasticityGenerator variableElasticityGenerator1(const(k=0.8),
              curve(y={0.0033,0.41,0.63,0.73,0.8,0.76,0.25,0.0033,0.0033},
                slope={0,5.0136,2.56,1.36,0.24,-4.4,-6.0536,0,0}))
            annotation (Placement(transformation(extent={{48,2},{96,44}})));
          Physiolibrary.Hydraulic.Components.IdealValve aorticValve annotation (
             Placement(transformation(
                extent={{10,-11},{-10,11}},
                rotation=180,
                origin={98,1})));
          Physiolibrary.Hydraulic.Components.IdealValve pulmonaryValve
            annotation (Placement(transformation(extent={{-28,4},{-8,24}})));
        equation
          connect(variableElasticityGenerator.hydrauliccompliance,
            rightVentricle.compliance) annotation (Line(
              points={{-49.36,22.06},{-49.36,15.45},{-42,15.45},{-42,6}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(heartRate.y, variableElasticityGenerator.heartRate)
            annotation (Line(
              points={{-65.75,55},{-55.875,55},{-55.875,41.17},{-54.88,41.17}},
              color={0,0,127},
              smooth=Smooth.Bezier));

          connect(ERMAX.y, variableElasticityGenerator.maxelastance)
            annotation (Line(
              points={{-36.25,45},{-46.96,45},{-46.96,40.96}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(variableElasticityGenerator1.hydrauliccompliance,
            leftVentricle.compliance) annotation (Line(
              points={{68.64,20.06},{68.64,15.45},{78,15.45},{78,8}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(heartRate.y, variableElasticityGenerator1.heartRate)
            annotation (Line(
              points={{-65.75,55},{63.12,55},{63.12,39.17}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(ELMAX.y, variableElasticityGenerator1.maxelastance)
            annotation (Line(
              points={{78,52},{78,52.5},{71.04000000000001,52.5},{
                  71.04000000000001,38.96}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(RRV.y, tricuspidValve.Gon) annotation (Line(
              points={{-70,-12},{-70,-22}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(backflowConductance.y, tricuspidValve.Goff) annotation (Line(
              points={{-57.75,9},{-57.75,-6.5},{-58,-6.5},{-58,-22}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(RLV.y, mitralValve.Gon) annotation (Line(
              points={{42,-4},{44,-4},{44,-18},{44,-18}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(backflowConductance1.y, mitralValve.Goff) annotation (Line(
              points={{56.25,15},{56.25,-1.5},{56,-1.5},{56,-18}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(tricuspidValve.q_out, rightVentricle.q_in) annotation (Line(
              points={{-54,-32},{-52,-32},{-52,-2},{-42,-2}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(rightVentricle.q_in, pulmonaryValve.q_in) annotation (Line(
              points={{-42,-2},{-28,-2},{-28,14}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(mitralValve.q_out, leftVentricle.q_in) annotation (Line(
              points={{60,-28},{68,-28},{68,0},{78,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(leftVentricle.q_in, aorticValve.q_in) annotation (Line(
              points={{78,0},{84,0},{84,1},{88,1}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(pulmonaryValve.q_out, rightHeartOutflow) annotation (Line(
              points={{-8,14},{12,14},{12,76},{100,76},{100,40}},
              color={0,0,0},
              thickness=1));
          connect(leftHeartInflow, mitralValve.q_in) annotation (Line(
              points={{100,-20},{100,-20},{100,-46},{36,-46},{36,-28},{40,-28}},
              color={0,0,0},
              thickness=1));

          connect(aorticValve.q_out, leftHeartOutflow) annotation (Line(
              points={{108,1},{112,1},{112,0},{112,-54},{-112,-54},{-112,-20},{
                  -100,-20}},
              color={0,0,0},
              thickness=1));
          connect(rightHeartInflow, tricuspidValve.q_in) annotation (Line(
              points={{-100,40},{-100,40},{-100,4},{-100,0},{-90,0},{-90,-32},{
                  -74,-32}},
              color={0,0,0},
              thickness=1));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-120,-60},{120,80}})), Icon(coordinateSystem(
                  preserveAspectRatio=false, extent={{-120,-60},{120,80}}),
                graphics={Text(
                  extent={{-98,48},{102,88}},
                  lineColor={0,0,0},
                  textString="Fernandez")}));
        end Heart;

        model SystemicCirculation
          extends Cardiovascular.Interfaces.Systemic;
          Physiolibrary.Hydraulic.Components.ElasticVessel aorta(
            useComplianceInput=true,
            ZeroPressureVolume=0,
            volume_start=0.0001)
            annotation (Placement(transformation(extent={{44,-10},{64,10}})));
          Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EAO(
              k=106657909.932)
            annotation (Placement(transformation(extent={{32,14},{48,28}})));
          Physiolibrary.Hydraulic.Components.Conductor peripheralResistance(
              useConductanceInput=true)
            annotation (Placement(transformation(extent={{18,-12},{-2,12}})));
          Physiolibrary.Hydraulic.Components.ElasticVessel peripheralVessels(
              useComplianceInput=true, volume_start=0.00334)
            annotation (Placement(transformation(extent={{-32,-12},{-12,8}})));
          replaceable
            Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
            RPS(k(displayUnit="(mmHg.s)/ml") = 81793284.679103)
            annotation (Placement(transformation(extent={{-10,16},{8,34}})));
          Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPS(
              k=2039832.5274495)
            annotation (Placement(transformation(extent={{-38,18},{-22,32}})));
          Physiolibrary.Hydraulic.Components.Conductor venacavaResistance(
              useConductanceInput=true)
            annotation (Placement(transformation(extent={{-40,-14},{-60,10}})));
          Physiolibrary.Hydraulic.Components.ElasticVessel venacava(
              useComplianceInput=true, volume_start=0.0005)
            annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
          replaceable
            Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
            ECV(k(displayUnit="mmHg/ml") = 533289.54966)
            annotation (Placement(transformation(extent={{-100,22},{-84,36}})));
          Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
            RCV(k(displayUnit="(mmHg.s)/ml") = 80793366.77349)
            annotation (Placement(transformation(extent={{-70,18},{-52,36}})));
          AortaFlowMeasurement bloodFlowMeasurement
            annotation (Placement(transformation(extent={{44,-12},{24,8}})));
          Physiolibrary.Hydraulic.Components.Conductor aortaResistance(
              useConductanceInput=true)
            annotation (Placement(transformation(extent={{90,-12},{70,12}})));
          Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
            RAO(k(displayUnit="(mmHg.s)/ml") = 1666529.8426875)
            annotation (Placement(transformation(extent={{60,18},{78,36}})));
        equation
          connect(EAO.y, aorta.compliance) annotation (Line(
              points={{50,21},{50,8},{54,8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(peripheralVessels.q_in, peripheralResistance.q_out)
            annotation (Line(
              points={{-22,-2},{-12,-2},{-12,0},{-2,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(RPS.y, peripheralResistance.cond) annotation (Line(
              points={{10.25,25},{10.25,25.5},{8,25.5},{8,7.2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(EPS.y, peripheralVessels.compliance) annotation (Line(
              points={{-20,25},{-20,6},{-22,6}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(peripheralVessels.q_in, venacavaResistance.q_in) annotation (
              Line(
              points={{-22,-2},{-40,-2}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(venacavaResistance.q_out, venacava.q_in) annotation (Line(
              points={{-60,-2},{-72,-2},{-72,0},{-82,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(ECV.y, venacava.compliance) annotation (Line(
              points={{-82,29},{-82,8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(RCV.y, venacavaResistance.cond) annotation (Line(
              points={{-49.75,27},{-49.75,17.5},{-50,17.5},{-50,5.2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(peripheralResistance.q_in, bloodFlowMeasurement.q_out)
            annotation (Line(
              points={{18,0},{22,0},{22,-2},{24,-2}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(bloodFlowMeasurement.q_in, aorta.q_in) annotation (Line(
              points={{44,-2},{50,-2},{50,0},{54,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(aorta.q_in, aortaResistance.q_out) annotation (Line(
              points={{54,0},{70,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(RAO.y, aortaResistance.cond) annotation (Line(
              points={{80.25,27},{80.25,26.5},{80,26.5},{80,7.2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(venacava.q_in, q_out) annotation (Line(
              points={{-82,0},{-91,0},{-100,0}},
              color={0,0,0},
              thickness=1));
          connect(q_in, aortaResistance.q_in) annotation (Line(
              points={{100,0},{95,0},{90,0}},
              color={0,0,0},
              thickness=1));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-120,-60},{120,60}})), Icon(coordinateSystem(
                  preserveAspectRatio=false, extent={{-120,-60},{120,60}}),
                graphics={Text(
                  extent={{-106,34},{94,74}},
                  lineColor={0,0,0},
                  textString="Fernandez")}));
        end SystemicCirculation;

        model PulmonaryCirculation
          extends Cardiovascular.Interfaces.Pulmonary;
          Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArteries(
            useComplianceInput=true,
            ZeroPressureVolume=0,
            volume_start=0.00012)
            annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
          Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPA(
              k=17771874.242419)
            annotation (Placement(transformation(extent={{-28,18},{-12,32}})));
          Physiolibrary.Hydraulic.Components.Conductor pulmonaryResistance(
              useConductanceInput=true)
            annotation (Placement(transformation(extent={{18,-10},{38,10}})));
          Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins(
              useComplianceInput=true, volume_start=0.00024)
            annotation (Placement(transformation(extent={{52,-10},{72,10}})));
          Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPV(
              k=4399638.784695)
            annotation (Placement(transformation(extent={{42,18},{60,32}})));
          Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
            RPV(k(displayUnit="(mmHg.s)/ml") = 19051769.161603)
            annotation (Placement(transformation(extent={{10,18},{24,30}})));
          Physiolibrary.Hydraulic.Components.Conductor arteryResistance(
              useConductanceInput=true)
            annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
          Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
            RPA(k(displayUnit="(mmHg.s)/ml") = 1479878.5003065)
            annotation (Placement(transformation(extent={{-66,18},{-52,30}})));
        equation
          connect(EPA.y, pulmonaryArteries.compliance) annotation (Line(
              points={{-10,25},{-10,8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(EPV.y, pulmonaryVeins.compliance) annotation (Line(
              points={{62.25,25},{62.25,25.5},{62,25.5},{62,8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(pulmonaryVeins.q_in, pulmonaryResistance.q_out) annotation (
              Line(
              points={{62,0},{38,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(pulmonaryArteries.q_in, pulmonaryResistance.q_in) annotation (
             Line(
              points={{-10,0},{18,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(RPV.y, pulmonaryResistance.cond) annotation (Line(
              points={{25.75,24},{26,24},{26,6},{28,6}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(arteryResistance.q_out, pulmonaryArteries.q_in) annotation (
              Line(
              points={{-40,0},{-10,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(RPA.y, arteryResistance.cond) annotation (Line(
              points={{-50.25,24},{-48,24},{-48,6},{-50,6}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(q_out, pulmonaryVeins.q_in) annotation (Line(
              points={{100,0},{82,0},{62,0}},
              color={0,0,0},
              thickness=1));
          connect(arteryResistance.q_in, q_in) annotation (Line(
              points={{-60,0},{-100,0},{-100,0}},
              color={0,0,0},
              thickness=1));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-40},{100,40}})), Icon(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-40},{100,40}}),
                graphics={Text(
                  extent={{-98,10},{102,50}},
                  lineColor={0,0,0},
                  textString="Fernandez")}));
        end PulmonaryCirculation;

      model Curve
          "2D natural cubic interpolation spline defined with (x,y,slope) points"
        //workaround for openmodelica error: Cyclically dependent constants or parameters found in scope Physiolibrary.Blocks.Interpolation.Curve: {data,x}, {data,y}, {data,slope}.
        //Error: Error occurred while flattening model Physiolibrary.Blocks.Interpolation.Curve
        parameter Real x[:] "x coordinations of interpolating points";
        parameter Real y[:] "y coordinations of interpolating points";
        parameter Real slope[:] "slopes at interpolating points";
          Modelica.Blocks.Interfaces.RealInput u annotation (Placement(
                transformation(extent={{-120,-20},{-80,20}})));
          Modelica.Blocks.Interfaces.RealOutput val
            annotation (Placement(transformation(extent={{80,-20},{120,20}})));
        protected
          parameter Real a[:, :]=
              Physiolibrary.Blocks.Interpolation.SplineCoefficients(
                      x,
                      y,
                      slope)
            "cubic polynom coefficients of curve segments between interpolating points";
      equation
          val = Physiolibrary.Blocks.Interpolation.Spline(
                    x,
                    a,
                    u);
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(
                coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}}), graphics={Rectangle(
                          extent={{-100,100},{100,-100}},
                          lineColor={0,0,127},
                          fillColor={255,255,255},
                          fillPattern=FillPattern.Solid),Line(
                          points={{-70,-76},{-20,-48},{0,12},{34,62},{76,72}},
                          color={0,0,127},
                          smooth=Smooth.Bezier),Line(
                          points={{-48,-82},{-48,90},{-48,90}},
                          color={0,0,127},
                          smooth=Smooth.Bezier,
                          arrow={Arrow.None,Arrow.Filled}),Line(
                          points={{-72,-74},{68,-74},{68,-74}},
                          color={0,0,127},
                          smooth=Smooth.Bezier,
                          arrow={Arrow.None,Arrow.Filled})}));
      end Curve;

        block HydraulicElastanceToCompliance
          "Reciprocal value of hydraulic compliance"

          Physiolibrary.Types.RealIO.HydraulicComplianceOutput y
            "HydraulicCompliance output" annotation (Placement(transformation(
                  extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},
                    {60,10}})));
          HydraulicElastanceInput hydraulicelastance "HydraulicElastance input"
            annotation (Placement(transformation(extent={{-68,-28},{-28,12}}),
                iconTransformation(extent={{-54,-14},{-28,12}})));
        equation
          y = 1/hydraulicelastance;
          annotation (
            defaultComponentName="hydrauliccompliance",
            Diagram(coordinateSystem(extent={{-40,-40},{40,40}},
                  preserveAspectRatio=false), graphics),
            Icon(coordinateSystem(extent={{-40,-40},{40,40}},
                  preserveAspectRatio=false), graphics={Rectangle(
                          extent={{-40,40},{40,-40}},
                          lineColor={0,0,0},
                          radius=10,
                          fillColor={236,236,236},
                          fillPattern=FillPattern.Solid),Rectangle(
                          extent={{-28,3},{20,-4}},
                          lineThickness=1,
                          fillColor={0,0,255},
                          fillPattern=FillPattern.Solid,
                          pattern=LinePattern.None),Polygon(
                          points={{24,10},{24,-10},{36,0},{36,0},{24,10}},
                          lineThickness=1,
                          smooth=Smooth.None,
                          fillColor={0,0,255},
                          fillPattern=FillPattern.Solid,
                          pattern=LinePattern.None),Text(
                          extent={{-16,30},{12,2}},
                          lineColor={0,0,255},
                          fillColor={255,240,234},
                          fillPattern=FillPattern.Solid,
                          textString="1"),Text(
                          extent={{-22,-10},{16,-32}},
                          lineColor={0,0,255},
                          fillColor={255,240,234},
                          fillPattern=FillPattern.Solid,
                          textString="E")}));
        end HydraulicElastanceToCompliance;

        model AortaFlowMeasurement
          "measures flow, diastolic, systolic and mean pressure"
          extends Physiolibrary.Hydraulic.Sensors.FlowMeasure;
          import Physiolibrary.Types.RealIO.*;
          import Physiolibrary.Types.*;
          PressureOutput Ps "Systolic pressure during heart cycle" annotation (
              Placement(transformation(extent={{-72,-42},{-52,-22}}),
                iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-80,-30})));
          PressureOutput Pd "Diastolic pressure during heart cycle" annotation (
             Placement(transformation(extent={{-50,-40},{-30,-20}}),
                iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-60,-30})));
          PressureOutput Pmean "Mean pressure during heart cycle" annotation (
              Placement(transformation(extent={{-10,-36},{10,-16}}),
                iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-38,-30})));
          Real SumPressure(start=0) "sum of pressure of cardiac cycle";
          Pressure Pmin(start=13300);
          Pressure Pmax;
          discrete Boolean b(start=false) "beat signal";
          Time T0(start=0) "start of cardiac cycle ";
          discrete Time HP(start=1) "length of cardiac cycle";
        initial algorithm
          Ps := q_in.pressure;
          Pd := q_in.pressure;
        equation
          Pmax = max(Pmax, q_in.pressure);
          Pmin = min(Pmin, q_in.pressure);
          b = der(q_in.pressure) > 0;
          when {b and not pre(b)} then
            T0 = time "initial time of current cardiac cycle";
            HP = if (pre(T0) > 0) then time - pre(T0) else 1;
            Pmean = SumPressure/pre(HP) "mean pressure";
            Ps = Pmax
              "systolic pressure = maximum pressure during cardiac cycle";
            Pd = Pmin
              "diastolic pressure=minimal pressure during cardiac cycle";
            reinit(SumPressure, 0) "reinitialisation of sum pressure";
            reinit(Pmax, q_in.pressure) "reinitialisation of maximal pressure";
            reinit(Pmin, q_in.pressure) "reinitialisation minimal pressure";
          end when;
          der(SumPressure) = q_in.pressure;
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                    {-100,-100},{100,100}}), graphics={Text(
                          extent={{-52,11},{52,-11}},
                          lineColor={0,0,0},
                          fillColor={85,170,255},
                          fillPattern=FillPattern.Solid,
                          origin={-77,30},
                          rotation=90,
                          textString="Ps",
                          textStyle={TextStyle.Bold}),Text(
                          extent={{-53,10},{53,-10}},
                          lineColor={0,0,0},
                          fillColor={85,170,255},
                          fillPattern=FillPattern.Solid,
                          origin={-56,29},
                          rotation=90,
                          textString="Pd"),Text(
                          extent={{-55,12},{55,-12}},
                          lineColor={0,0,0},
                          fillColor={85,170,255},
                          fillPattern=FillPattern.Solid,
                          origin={-32,35},
                          rotation=90,
                          textString="Pmean"),Text(
                          extent={{-29,12},{29,-12}},
                          lineColor={0,0,255},
                          fillColor={85,170,255},
                          fillPattern=FillPattern.Solid,
                          origin={34,7},
                          rotation=90,
                          textString="SV"),Text(
                          extent={{-30,11},{30,-11}},
                          lineColor={0,0,255},
                          fillColor={85,170,255},
                          fillPattern=FillPattern.Solid,
                          origin={55,8},
                          rotation=90,
                          textString="CO")}), Diagram(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                graphics));
        end AortaFlowMeasurement;

      end Parts;

      annotation (conversion(from(
            version="1",
            script="ConvertFromFernandezModel_1.mos",
            version="")), Documentation(info="<html>
<p>Model as presented in [1], reimplemented an extended.</p>
<p><br>[1] Fernandez de Canete J, Luque J, Barbancho J, Munoz V. Modelling of long-term and short-term mechanisms of arterial pressure control in the cardiovascular system: An object-oriented approach. Comput Biol Med 2014;47:104&ndash;12.</p>
</html>"));
    end Fernandez;

    package Complex
      "Complex model unifying state-of-the-art circAdapt model with coronary arteries and complex arterial tree"
         extends Modelica.Icons.ExamplesPackage;
      package Environment "Central model settings and environment"

        import Physiolibrary.Types.*;

        model ComplexEnvironment "Class encompassing all settings"
          extends Cardiovascular.Icons.Settings;
          import Cardiovascular.Model.Complex.Components.Main.SystemicArteries.*;

          inner replaceable Conditions.Rest_NoAdapt condition constrainedby
            Conditions.Abstraction.Condition
            "Selected global condition and adaptation"
            annotation (choicesAllMatching=true);

          replaceable Supports.No supports constrainedby
            Supports.Abstraction.Supports
            "Selected settings of cardiac supports"
            annotation (choicesAllMatching=true);

          replaceable Initialization.PhysiologicalAdapted initialization
            constrainedby Initialization.Abstraction.Initialization
            "Selected initialization of components"
            annotation (choicesAllMatching=true);

          replaceable ModelConstants.Standard constants constrainedby
            ModelConstants.Standard "Selected set of basic constants"
            annotation (choicesAllMatching=true);

          Time t(start=0, fixed=true)
            "Time with respect to start of cardiac cycle";
          inner Boolean stepCycle(start=true, fixed=true)
            "Steps denote start of new cardiac cycle";

        //   discrete Real[:] feedback(start = {0, 0, 0})
        //     "Monitored values for stability convergence";
        //   discrete Real feedbackError
        //     "Total square error of monitored values - used as a convergence criterion";
        //   discrete Real newMode
        //     "New mode to switch to - used during adaptation protocol";
        //   Integer counter
        //     "Counts sequential mode transitions realized without a need for further adaptation - used as a convergence criterion";
          Real HeartRate=60/condition.cycleDuration "Heart rate BPM";
        equation



          // Watching cardiac cycle time
          der(t) = 1;
          when t >= condition.cycleDuration then
            reinit(t, t - condition.cycleDuration);
            stepCycle = not pre(stepCycle);
          end when;


        //   // Controling adaptation convergence
        //   when change(stepCycle) then
        //     feedback[:] = {avg_PC_dp. average  * 760 / 101325, avg_cVSA_q. average * 1e6, avg_cVSA_p. average * 760 / 101325};
        //     feedbackError = sum((feedback[i] - pre(feedback[i])) ^ 2 for i in 1 : size(feedback, 1));
        //     newMode = settings.condition.processFeedback(feedbackError, pre(counter) >= 14);
        //     counter = if pre(counter) < 14 and settings. condition. adaptationPhase and pre(settings. condition. adaptationPhase) then (if newMode <> pre(settings. condition. mode) then pre(counter) + 1 else max(0, pre(counter) - 1)) else pre(counter);
        //     reinit(settings. condition. mode, newMode);
        //   end when;

          annotation (
                  defaultComponentName="settings",
            defaultComponentPrefixes="inner",
            missingInnerMessage="No \"Settings\" component is defined. A default settings
    component is required for proper function. Its enough to drop it to the top-level scene!
    You can find it in Cardiovascular.Model.Complex.Settings.",
                  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}})));
        end ComplexEnvironment;

        package Conditions "Setting global condition including adaptation"
          package Abstraction "Common ancestors"
            partial model Condition "Basic condition definition"
              import Cardiovascular.Types.*;

              parameter Frequency heartBeat(displayUnit="1/s") = 1/0.85
                "Heart beat";
              parameter Pressure aortalPressureRef=12200
                "Reference pressure in aorta";
              parameter Pressure pulmonaryPressureDropRef=1500
                "Reference pressure drop over pulmonary capillaries";

              Time cycleDuration=1/heartBeat "Duration of cardiac cycle";
              VolumeFlowRate aortalFlowRef=85e-6 "Reference flow through aorta";
              Volume bloodVolumeRef=0.95e-3 "Reference blood volume";

              Boolean adaptCapillaryResistance=true
                "Whether capillary resistance should be adapted";
              Boolean adaptVesselDiameter=false
                "Whether cross-sectional area of vessels should be adapted";
              Boolean adaptValveDiameter=false
                "Whether valve cross-sectional area should be adapted";
              Boolean adaptVesselWVolume=false
                "Whether wall volume of vessels should be adapted";
              Boolean adaptTriSegJunction=false
                "Whether correctional coefficient for heart geometry should be adapted";
              Boolean adaptChamberWVolume=false
                "Whether wall volume in heart walls should be adapted";
              Boolean adaptChamberWArea=false
                "Whether wall surface area in heart walls should be adapted";
              Boolean adaptChamberEcmStress=false
                "Whether reference myofiber passive stress should be adapted";
              Boolean adaptPericardium=false
                "Whether pericardium should be adapted";
              Boolean adaptationPhase=false "Whether adaptation is in progress";

              Real mode(start=0, fixed=true)
                "Inner state used in adaptation protocol";

              function processFeedback = ProcessFeedback (mode=mode)
                "Evaluates convergence";

              replaceable partial function ProcessFeedback
                "Can evaluate and react to convergence when redeclared"
                input Real error "Feedback error to evaluate convergence";
                input Boolean inEndPhase=false
                  "Whether global convergence has been reached";
                input Real mode
                  "Inner state through which the function interacts";
                output Real result=mode "New state";
              algorithm
              end ProcessFeedback;

            equation
              der(mode) = 0;

            end Condition;
          end Abstraction;

          model Rest_NoAdapt "Resting condition with no adaptation"
            extends Conditions.Abstraction.Condition(adaptCapillaryResistance=
                  false);

          end Rest_NoAdapt;

          model Rest_MinimalAdapt
            "Resting condition with adaptation of capillary resistance"
            extends Conditions.Abstraction.Condition(adaptCapillaryResistance=
                  true, adaptationPhase=true);

          end Rest_MinimalAdapt;

          model Rest_Adapt "Adaptation phase in resting condition"
            extends Conditions.Rest_MinimalAdapt(adaptVesselDiameter=true,
              adaptValveDiameter=true);

          end Rest_Adapt;

          model Exercise_Adapt "Adaptation phase for exercise"
            extends Conditions.Rest_MinimalAdapt(
              heartBeat=1/0.425,
              aortalFlowRef=255e-6,
              bloodVolumeRef=1.3e-3,
              adaptVesselWVolume=true,
              adaptTriSegJunction=true,
              adaptChamberWVolume=true,
              adaptChamberWArea=true,
              adaptChamberEcmStress=true,
              adaptPericardium=true);

          end Exercise_Adapt;

          model AdaptationProtocol
            "Adaptation protocol switching between resting and exercise adaptation phases"
            extends Conditions.Abstraction.Condition(
              cycleDuration=if mode < 2 then adaptRest.cycleDuration else
                  adaptEx.cycleDuration,
              adaptCapillaryResistance=true,
              adaptVesselDiameter=mode >= 1 and mode < 2,
              adaptValveDiameter=mode >= 1 and mode < 2,
              adaptVesselWVolume=mode >= 3,
              adaptTriSegJunction=mode >= 3,
              adaptChamberWVolume=mode >= 3,
              adaptChamberWArea=mode >= 3,
              adaptChamberEcmStress=mode >= 3,
              adaptPericardium=mode >= 3,
              aortalFlowRef=if mode < 2 then adaptRest.aortalFlowRef else
                  adaptEx.aortalFlowRef,
              bloodVolumeRef=if mode < 2 then adaptRest.bloodVolumeRef else
                  adaptEx.bloodVolumeRef,
              adaptationPhase=mode >= 1 and mode < 2 or mode >= 3);

            Conditions.Rest_Adapt adaptRest "Resting adaptation phase settings";
            Conditions.Exercise_Adapt adaptEx
              "Exercise adaptation phase settings";

            redeclare partial function ProcessFeedback
              "Evaluates changes between two cardiac cycles and adjusts adaptation mode"
              input Real error "Feedback error to evaluate convergence";
              input Boolean inEndPhase=false
                "Whether global convergence has been reach - parking in resting condition is awaited";
              input Real mode
                "Adaptation phase - 0-1: stabilization at rest, 1-2: adaptation at rest, 2-3: stabilization during exercise, 3-4: adaptation during exercise";
              output Real result=if error < 1e-2 then (if mode > 0 then (if
                  inEndPhase and mode >= 1 and mode <= 1.25 then mode else mod(
                  mode + 0.25, 4)) else mode + 0.25) else mode "New mode";
            algorithm
            end ProcessFeedback;

          end AdaptationProtocol;

        end Conditions;

        package Initialization "Initialization for components"
          package Abstraction "Common ancestors"
            partial record Initialization "Initial values for circuit segments"
              import Cardiovascular.Types.*;
              import Physiolibrary.Types.*;

              parameter Pressure SA_pRef
                "Reference pressure for systemic arteries";
              parameter Cardiovascular.Types.Area SA_ARef
                "Reference cavity cross-sectional area for systemic arteries";
              parameter Cardiovascular.Types.Area SA_AW
                "Wall cross-sectional area for systemic arteries";
              parameter Cardiovascular.Types.Length SA_l
                "Length of systemic arteries";
              parameter Real SA_k
                "Stiffness non-linearity coefficient for systemic arteries";

              parameter Pressure SV_pRef
                "Reference pressure for systemic veins";
              parameter Cardiovascular.Types.Area SV_ARef
                "Reference cavity cross-sectional area for systemic veins";
              parameter Cardiovascular.Types.Area SV_AW
                "Wall cross-sectional area for systemic veins";
              parameter Cardiovascular.Types.Length SV_l
                "Length of systemic veins";
              parameter Real SV_k
                "Stiffness non-linearity coefficient for systemic veins";

              parameter Pressure PA_pRef
                "Reference pressure for pulmonary arteries";
              parameter Cardiovascular.Types.Area PA_ARef
                "Reference cavity cross-sectional area for pulmonary arteries";
              parameter Cardiovascular.Types.Area PA_AW
                "Wall cross-sectional area for pulmonary arteries";
              parameter Cardiovascular.Types.Length PA_l
                "Length of pulmonary arteries";
              parameter Real PA_k
                "Stiffness non-linearity coefficient for pulmonary arteries";

              parameter Pressure PV_pRef
                "Reference pressure for pulmonary veins";
              parameter Cardiovascular.Types.Area PV_ARef
                "Reference cavity cross-sectional area for pulmonary veins";
              parameter Cardiovascular.Types.Area PV_AW
                "Wall cross-sectional area for pulmonary veins";
              parameter Cardiovascular.Types.Length PV_l
                "Length of pulmonary veins";
              parameter Real PV_k
                "Stiffness non-linearity coefficient for pulmonary veins";

              parameter HydraulicResistance SC_R
                "Resistence of systemic capillaries";
              parameter HydraulicResistance PC_R
                "Resistence of pulmonary capillaries";

              parameter Cardiovascular.Types.Area vLAV_ARef
                "Reference cross-sectional area of left atrio-ventricular valve";
              parameter Cardiovascular.Types.Length vLAV_l
                "Length of left atrio-ventricular valve";
              parameter Real vLAV_Ko
                "Time coefficient for opening of left atrio-ventricular valve";
              parameter Real vLAV_Kc
                "Time coefficient for closing of left atrio-ventricular valve";
              parameter Fraction vLAV_Mrg
                "Severity of left atrio-ventricular valve regurgitation";
              parameter Fraction vLAV_Mst
                "Severity of left atrio-ventricular valve stenosis";
              parameter Pressure vLAV_dpO
                "Opening pressure for left atrio-ventricular valve";
              parameter Pressure vLAV_dpC
                "Closing pressure for left atrio-ventricular valve";

              parameter Cardiovascular.Types.Area vRAV_ARef
                "Reference cross-sectional area of right atrio-ventricular valve";
              parameter Cardiovascular.Types.Length vRAV_l
                "Length of right atrio-ventricular valve";
              parameter Real vRAV_Ko
                "Time coefficient for opening of right atrio-ventricular valve";
              parameter Real vRAV_Kc
                "Time coefficient for closing of right atrio-ventricular valve";
              parameter Real vRAV_Mrg
                "Severity of right atrio-ventricular valve regurgitation";
              parameter Real vRAV_Mst
                "Severity of right atrio-ventricular valve stenosis";
              parameter Pressure vRAV_dpO
                "Opening pressure for right atrio-ventricular valve";
              parameter Pressure vRAV_dpC
                "Closing pressure for right atrio-ventricular valve";

              parameter Cardiovascular.Types.Area vSA_ARef
                "Reference cross-sectional area of aortic valve";
              parameter Cardiovascular.Types.Length vSA_l
                "Length of aortic valve";
              parameter Real vSA_Ko
                "Time coefficient for opening of aortic valve";
              parameter Real vSA_Kc
                "Time coefficient for closing of aortic valve";
              parameter Fraction vSA_Mrg
                "Severity of aortic valve regurgitation";
              parameter Fraction vSA_Mst "Severity of aortic valve stenosis";
              parameter Pressure vSA_dpO "Opening pressure for aortic valve";
              parameter Pressure vSA_dpC "Closing pressure for aortic valve";

              parameter Cardiovascular.Types.Area vPA_ARef
                "Reference cross-sectional area of pulmonary valve";
              parameter Cardiovascular.Types.Length vPA_l
                "Length of pulmonary valve";
              parameter Real vPA_Ko
                "Time coefficient for opening of pulmonary valve";
              parameter Real vPA_Kc
                "Time coefficient for closing of pulmonary valve";
              parameter Fraction vPA_Mrg
                "Severity of pulmonary valve regurgitation";
              parameter Fraction vPA_Mst "Severity of pulmonary valve stenosis";
              parameter Pressure vPA_dpO "Opening pressure for pulmonary valve";
              parameter Pressure vPA_dpC "Closing pressure for pulmonary valve";

              parameter Cardiovascular.Types.Area vSV_ARef
                "Reference cross-sectional area of left atrial inlet";
              parameter Cardiovascular.Types.Length vSV_l
                "Length of left atrial inlet";
              parameter Real vSV_Ko
                "Time coefficient for opening of left atrial inlet";
              parameter Real vSV_Kc
                "Time coefficient for closing of left atrial inlet";
              parameter Fraction vSV_Mrg
                "Severity left atrial inlet regurgitation (pseudo-valve - should be 100 %)";
              parameter Fraction vSV_Mst
                "Severity of left atrial inlet stenosis";
              parameter Pressure vSV_dpO
                "Opening pressure for left atrial inlet";
              parameter Pressure vSV_dpC
                "Closing pressure for left atrial inlet";

              parameter Cardiovascular.Types.Area vPV_ARef
                "Reference cross-sectional area of right atrial inlet";
              parameter Cardiovascular.Types.Length vPV_l
                "Length of right atrial inlet";
              parameter Real vPV_Ko
                "Time coefficient for opening of right atrial inlet";
              parameter Real vPV_Kc
                "Time coefficient for closing of right atrial inlet";
              parameter Fraction vPV_Mrg
                "Severity of right atrial inlet regurgitation (pseudo-valve - should be 100 %)";
              parameter Fraction vPV_Mst
                "Severity of right atrial inlet stenosis";
              parameter Pressure vPV_dpO
                "Opening pressure for right atrial inlet";
              parameter Pressure vPV_dpC
                "Closing pressure for right atrial inlet";

              parameter Volume RA_Am "Mid-wall area of right atrium";
              parameter Cardiovascular.Types.Area RA_AmRef
                "Reference mid-wall area of right atrium";
              parameter Cardiovascular.Types.Area RA_Am0
                "Dead space mid-wall area of right atrium";
              parameter Volume RA_VW "Wall volume of right atrium";
              parameter Pressure RA_sigmaPRef
                "Reference passive myofiber stress in right atrium";
              parameter Time RA_tauA_Base(displayUnit="s")
                "Activation time offset for right atrium";
              parameter Real RA_tauA_CycleFraction
                "Activation time fraction of cardiac cycle duration for right atrium";
              parameter Time RA_tDelay_Base(displayUnit="s")
                "Activation delay offset for right atrium";
              parameter Real RA_tDelay_CycleFraction
                "Activation delay fraction of cardiac cycle duration for right atrium";

              parameter Volume LA_Am "Mid-wall area of left atrium";
              parameter Cardiovascular.Types.Area LA_AmRef
                "Reference mid-wall area of left atrium";
              parameter Cardiovascular.Types.Area LA_Am0
                "Dead space mid-wall area of left atrium";
              parameter Volume LA_VW "Wall volume of left atrium";
              parameter Pressure LA_sigmaPRef
                "Reference passive myofiber stress in left atrium";
              parameter Time LA_tauA_Base(displayUnit="s")
                "Activation time offset for left atrium";
              parameter Real LA_tauA_CycleFraction
                "Activation time fraction of cardiac cycle duration for left atrium";
              parameter Time LA_tDelay_Base(displayUnit="s")
                "Activation delay offset for left atrium";
              parameter Real LA_tDelay_CycleFraction
                "Activation delay fraction of cardiac cycle duration for left atrium";

              parameter Cardiovascular.Types.Area LW_EAmRef
                "Correctional coefficient of ventricle geometry for left ventricular wall";
              parameter Cardiovascular.Types.Area LW_AmRef
                "Reference mid-wall area of left ventricular wall";
              parameter Cardiovascular.Types.Area LW_Am0
                "Dead space mid-wall area of left ventricular wall";
              parameter Volume LW_VW "Wall volume of left ventricular wall";
              parameter Pressure LW_sigmaPRef
                "Reference passive myofiber stress in left ventricular wall";
              parameter Time LW_tauA_Base(displayUnit="s")
                "Activation time offset for left ventricular wall";
              parameter Real LW_tauA_CycleFraction
                "Activation time fraction of cardiac cycle duration for left ventricular wall";
              parameter Time LW_tDelay_Base(displayUnit="s")
                "Activation delay offset for left ventricular wall";
              parameter Real LW_tDelay_CycleFraction
                "Activation delay fraction of cardiac cycle duration for left ventricular wall";

              parameter Cardiovascular.Types.Area SW_EAmRef
                "Correctional coefficient of ventricle geometry for sepal wall";
              parameter Cardiovascular.Types.Area SW_AmRef
                "Reference mid-wall area of sepal wall";
              parameter Cardiovascular.Types.Area SW_Am0
                "Dead space mid-wall area of sepal wall";
              parameter Volume SW_VW "Wall volume of sepal wall";
              parameter Pressure SW_sigmaPRef
                "Reference passive myofiber stress in sepal wall";
              parameter Time SW_tauA_Base(displayUnit="s")
                "Activation time offset for sepal wall";
              parameter Real SW_tauA_CycleFraction
                "Activation time fraction of cardiac cycle duration for sepal wall";
              parameter Time SW_tDelay_Base(displayUnit="s")
                "Activation delay offset for sepal wall";
              parameter Real SW_tDelay_CycleFraction
                "Activation delay fraction of cardiac cycle duration for sepal wall";

              parameter Cardiovascular.Types.Area RW_EAmRef
                "Correctional coefficient of ventricle geometry for right ventricular wall";
              parameter Cardiovascular.Types.Area RW_AmRef
                "Reference mid-wall area of right ventricular wall";
              parameter Cardiovascular.Types.Area RW_Am0
                "Dead space mid-wall area of right ventricular wall";
              parameter Volume RW_VW "Wall volume of right ventricular wall";
              parameter Pressure RW_sigmaPRef
                "Reference passive myofiber stress in right ventricular wall";
              parameter Time RW_tauA_Base(displayUnit="s")
                "Activation time offset for right ventricular wall";
              parameter Real RW_tauA_CycleFraction
                "Activation time fraction of cardiac cycle duration for right ventricular wall";
              parameter Time RW_tDelay_Base(displayUnit="s")
                "Activation delay offset for right ventricular wall";
              parameter Real RW_tDelay_CycleFraction
                "Activation delay fraction of cardiac cycle duration for right ventricular wall";

              parameter Real peri_k
                "Stiffness non-linearity coefficient for pericardium";
              parameter Volume peri_VRef "Reference volume of pericardium";
              parameter Pressure peri_pRef "Reference pericardial pressure";

            end Initialization;
          end Abstraction;

          record Original
            "Original set of initialization parameters based on source code for CircAdapt by Arts et al. (2012)"
            extends Abstraction.Initialization(
              SA_pRef=12289,
              SA_ARef=499e-6,
              SA_AW=117e-6,
              SA_l=0.4001,
              SA_k=8,
              SV_pRef=133,
              SV_ARef=499e-6,
              SV_AW=34e-6,
              SV_l=0.4001,
              SV_k=10,
              PA_pRef=1804,
              PA_ARef=507e-6,
              PA_AW=50e-6,
              PA_l=0.2001,
              PA_k=8,
              PV_pRef=326,
              PV_ARef=504e-6,
              PV_AW=49e-6,
              PV_l=0.2001,
              PV_k=10,
              SC_R=141.81e6,
              PC_R=17.663e6,
              vLAV_ARef=7.474e-4,
              vLAV_l=0.0246,
              vLAV_Ko=0.3,
              vLAV_Kc=0.4,
              vLAV_Mrg=0,
              vLAV_Mst=0,
              vLAV_dpO=0,
              vLAV_dpC=0,
              vRAV_ARef=7.4785e-4,
              vRAV_l=0.0246,
              vRAV_Ko=0.3,
              vRAV_Kc=0.4,
              vRAV_Mrg=0,
              vRAV_Mst=0,
              vRAV_dpO=0,
              vRAV_dpC=0,
              vSA_ARef=4.9827e-4,
              vSA_l=0.0201,
              vSA_Ko=0.12,
              vSA_Kc=0.12,
              vSA_Mrg=0,
              vSA_Mst=0,
              vSA_dpO=0,
              vSA_dpC=0,
              vPA_ARef=4.9857e-4,
              vPA_l=0.0201,
              vPA_Ko=0.2,
              vPA_Kc=0.2,
              vPA_Mrg=0,
              vPA_Mst=0,
              vPA_dpO=0,
              vPA_dpC=0,
              vSV_ARef=5.2312e-4,
              vSV_l=0.0201,
              vSV_Ko=1/inf,
              vSV_Kc=1/inf,
              vSV_Mrg=1,
              vSV_Mst=0,
              vSV_dpO=0,
              vSV_dpC=0,
              vPV_ARef=5.1906e-4,
              vPV_l=0.0201,
              vPV_Ko=1/inf,
              vPV_Kc=1/inf,
              vPV_Mrg=1,
              vPV_Mst=0,
              vPV_dpO=0,
              vPV_dpC=0,
              RA_Am=57e-4,
              RA_AmRef=55e-4,
              RA_Am0=12e-4,
              RA_VW=4.8e-6,
              RA_sigmaPRef=19353,
              RA_tauA_Base=0,
              RA_tauA_CycleFraction=0.15/0.85,
              RA_tDelay_Base=0,
              RA_tDelay_CycleFraction=0,
              LA_Am=68e-4,
              LA_AmRef=62e-4,
              LA_Am0=12e-4,
              LA_VW=15e-6,
              LA_sigmaPRef=11156,
              LA_tauA_Base=0,
              LA_tauA_CycleFraction=0.15/0.85,
              LA_tDelay_Base=0.02,
              LA_tDelay_CycleFraction=0,
              LW_EAmRef=0,
              LW_AmRef=89e-4,
              LW_Am0=12e-4,
              LW_VW=99e-6,
              LW_sigmaPRef=4373,
              LW_tauA_Base=0.085,
              LW_tauA_CycleFraction=0.4,
              LW_tDelay_Base=0,
              LW_tDelay_CycleFraction=0.185,
              SW_EAmRef=-0.1059,
              SW_AmRef=52e-4,
              SW_Am0=5e-10,
              SW_VW=44e-6,
              SW_sigmaPRef=4629,
              SW_tauA_Base=0.085,
              SW_tauA_CycleFraction=0.4,
              SW_tDelay_Base=0,
              SW_tDelay_CycleFraction=0.185,
              RW_EAmRef=0,
              RW_AmRef=119e-4,
              RW_Am0=12e-4,
              RW_VW=43e-6,
              RW_sigmaPRef=5144,
              RW_tauA_Base=0.085,
              RW_tauA_CycleFraction=0.4,
              RW_tDelay_Base=0,
              RW_tDelay_CycleFraction=0.185,
              peri_k=10,
              peri_VRef=609e-6,
              peri_pRef=500);
            import Modelica.Constants.*;

          end Original;

          record PhysiologicalAdapted
            "Set of parameters adapted to the model structure"
            extends Original(
              SA_pRef=1.269250e+04,
              SA_ARef=5.200303e-04,
              SA_AW=1.047177e-04,
              SV_pRef=2.378004e+02,
              SV_ARef=5.164770e-04,
              SV_AW=3.530430e-05,
              PA_pRef=2.221040e+03,
              PA_ARef=5.527450e-04,
              PA_AW=5.971791e-05,
              PV_pRef=7.568972e+02,
              PV_ARef=5.486271e-04,
              PV_AW=5.756578e-05,
              SC_R=140736288,
              PC_R=16254300,
              vLAV_ARef=7.738475e-04,
              vRAV_ARef=8.142545e-04,
              vSA_ARef=5.158983e-04,
              vPA_ARef=5.428363e-04,
              vSV_ARef=5.159014e-04,
              vPV_ARef=5.428373e-04,
              RA_AmRef=5.399583e-03,
              RA_Am0=1.357092e-03,
              RA_VW=7.999816e-06,
              RA_sigmaPRef=1.358824e+04,
              LA_AmRef=6.022352e-03,
              LA_Am0=1.289749e-03,
              LA_VW=2.016152e-05,
              LA_sigmaPRef=1.471949e+04,
              LW_AmRef=8.534521e-03,
              LW_Am0=1.289746e-03,
              LW_VW=9.951744e-05,
              LW_sigmaPRef=8.666301e+03*0.64,
              LW_EAmRef=0,
              SW_AmRef=5.111006e-03,
              SW_Am0=0,
              SW_VW=4.050521e-05,
              SW_sigmaPRef=8.638455e+03*0.64,
              SW_EAmRef=-8.544202e-03,
              RW_AmRef=1.268816e-02,
              RW_Am0=1.357091e-03,
              RW_VW=5.069673e-05,
              RW_sigmaPRef=9.300374e+03*0.64,
              RW_EAmRef=0,
              peri_VRef=6.651555e-04);

          end PhysiologicalAdapted;
        end Initialization;

        package Supports "Settings of cardiac supports"
          package Abstraction "Common ancestors"
            partial record Supports
              "Definition of standard settings for cardiac supports"
              import Cardiovascular.Types.*;

              parameter Boolean _DT_IABP_isEnabled
                "Whether IABP is implanted (derived tree only)";
              parameter Time _DT_IABP_inflationTime(displayUnit="s") = 0.57
                "IABP inflation timing with respect to cardiac cycle (derived tree only)";
              parameter Time _DT_IABP_deflationTime(displayUnit="s") = 0.28
                "IABP deflation timing with respect to cardiac cycle (derived tree only)";

              parameter Boolean ECMO_isEnabled "Whether ECMO is connected";
              parameter VolumeFlowRate ECMO_qMeanRef=1.6666666666667e-06
                "Reference mean flow through ECMO";
              parameter Cardiovascular.Types.PulseShape ECMO_pulseShapeRef=
                  PulseShape.pulseless "Shape of ECMO pulse or constant flow";
              parameter Time ECMO_cycleDuration(displayUnit="s") = 0.85
                "Cycle duration for ECMO pulses";
              parameter Time ECMO_pulseDuration(displayUnit="s") = 0.85/4
                "Duration of reference ECMO pulse";
              parameter Time ECMO_pulseStartTime(displayUnit="s") = 0
                "Starting time of reference ECMO pulse with respect to cardiac cycle";
              parameter Cardiovascular.Types.CannulaPlacement
                ECMO_cannulaPlacement=CannulaPlacement.ascendingAorta
                "Insertion location of ECMO cannula (arterial trees only)";
              parameter Cardiovascular.Types.Length ECMO_cannulaLength=0.15
                "Length of ECMO cannulas";
              parameter Cardiovascular.Types.Length ECMO_cannulaInnerDiameter=
                  0.005 "Inner diameter of ECMO cannulas";
              parameter Cardiovascular.Types.Length
                _DT_ECMO_cannulaOuterDiameter=0.007
                "Outer diameter of ECMO cannulas (derived tree only)";
              parameter Cardiovascular.Types.Length _DT_ECMO_cannulaDepth=0.007
                "Insertion depth of ECMO cannulas (derived tree only)";

              annotation (__Dymola_Commands);
            end Supports;
          end Abstraction;

          record No "No supports are applied"
            extends Supports.Abstraction.Supports(ECMO_isEnabled=false,
                _DT_IABP_isEnabled=false);

          end No;

          record IABP "IABP enabled"
            extends Supports.No(_DT_IABP_isEnabled=true);

          end IABP;

          record ECMO_Nonpulsatile "ECMO enabled in non-pulsatile mode"
            extends Supports.No(ECMO_isEnabled=true, ECMO_pulseShapeRef=
                  PulseShape.pulseless);
            import Cardiovascular.Types.*;

          end ECMO_Nonpulsatile;

          record ECMO_Pulsatile "ECMO enabled in pulsatile mode"
            extends Supports.No(ECMO_isEnabled=true, ECMO_pulseShapeRef=
                  PulseShape.parabolic);
            import Cardiovascular.Types.*;

          end ECMO_Pulsatile;
        end Supports;

        package ModelConstants "Adjustable model constants"
          package Abstraction "Common ancestors"
            partial record ModelConstants
              "Declaration of model constants (should be relatively fixed)"
              import Cardiovascular.Types.*;

              parameter Time bloodVolumeAdaptationRate
                "Speed of adjusting blood volume when reference volume changes";
              parameter Real CRest "Contractility when myofiber is at rest";
              parameter Real ecmoPumpPressureAdaptationRate
                "Speed of adjusting ECMO pump pressure to reference value";
              parameter Cardiovascular.Types.Length Lsc0
                "Length of contractile sarcomere element with zero passive stress";
              parameter Cardiovascular.Types.Length LseIso
                "Reference length of isometrically stressed elastic sarcomere element";
              parameter Cardiovascular.Types.Length LsMaxAdapt
                "Maximal sarcomere length for adaptation";
              parameter Cardiovascular.Types.Length LsMinAdapt
                "Minimal sarcomere length for adaptation";
              parameter Cardiovascular.Types.Length LsP0
                "Sarcomere length with zero passive stress";
              parameter Cardiovascular.Types.Length LsRef
                "Reference sarcomere length";
              parameter Cardiovascular.Types.Length atriumDLsP
                "Passive stress coefficient for atria";
              parameter Pressure atriumSigmaARef
                "Reference active myofiber stress in atria";
              parameter Pressure atriumSigmaPAdapt
                "Reference passive myofiber stress in atria for adaptation";
              parameter Real atriumTauS
                "Contractility time coefficient for atria";
              parameter Velocity atriumVMax
                "Maximal sarcomere velocity in atria";
              parameter Cardiovascular.Types.Length ventricleDLsP
                "Passive stress coefficient for ventricles";
              parameter Pressure ventricleSigmaARef
                "Reference active myofiber stress in ventricles";
              parameter Pressure ventricleSigmaPAdapt
                "Reference passive myofiber stress in ventricles for adaptation";
              parameter Real ventricleTauS
                "Contractility time coefficient for ventricles";
              parameter Velocity ventricleVMax
                "Maximal sarcomere velocity in ventricles";
              parameter Velocity vImpact
                "Reference velocity of blood due to movement impacts";

              parameter Fraction _DT_aorticArchStenosisRatio=0
                "Severity of stenosis in aortic arch (derived tree only)";
              parameter Fraction _DT_arterialStiffnessScale=1
                "Scaling coefficient for arterial stiffness (derived tree only)";
              parameter Fraction bloodVolumeRefScale=1
                "Scaling coefficient for blood volume";
              parameter Fraction systemicResistanceScale=1
                "Scaling coefficient for systemic resistance";
              parameter Fraction LW_contractilityScale=1
                "Scaling coefficient for contractility of left ventricle wall";
              parameter Fraction SW_contractilityScale=1
                "Scaling coefficient for contractility of sepal wall";
              parameter Fraction RW_contractilityScale=1
                "Scaling coefficient for contractility of right ventricle wall";
              parameter Fraction LA_contractilityScale=1
                "Scaling coefficient for contractility of left atrium";
              parameter Fraction RA_contractilityScale=1
                "Scaling coefficient for contractility of right atrium";

            end ModelConstants;
          end Abstraction;

          record Standard "Standard set of model constants"
            extends Abstraction.ModelConstants(
              vImpact=3,
              LsMaxAdapt=2.2e-6,
              LsMinAdapt=1.75e-6,
              LsP0=1.8e-6,
              CRest=0.02,
              Lsc0=1.51e-6,
              LsRef=2.0e-6,
              LseIso=0.04e-6,
              ventricleVMax=7e-6,
              atriumVMax=10.5e-6,
              ventricleDLsP=0.6e-6,
              atriumDLsP=0.8e-6,
              ventricleSigmaARef=120e3,
              ventricleSigmaPAdapt=7.5e3,
              atriumSigmaARef=84e3,
              atriumSigmaPAdapt=52.5e3,
              ventricleTauS=0.25,
              atriumTauS=0.5,
              bloodVolumeAdaptationRate=1,
              ecmoPumpPressureAdaptationRate=4e9);

          end Standard;

          record LVFailure
            extends Standard(
              LW_contractilityScale=0.1,
              RW_contractilityScale=x,
              SW_contractilityScale=x);
            constant Real x = 1;
          end LVFailure;
        end ModelConstants;
      end Environment;

      package Components "Model components"

        package Auxiliary "Auxiliary components"
          package Connectors
            "Connectors used in the model, compatible with Physiolibrary"
            connector In "Inflow connector"
              extends Physiolibrary.Hydraulic.Interfaces.HydraulicPort;

              annotation (Icon(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics={
                    Ellipse(
                      extent={{-80,80},{80,-80}},
                      lineColor={127,0,0},
                      fillColor={255,63,5},
                      fillPattern=FillPattern.Sphere),
                    Rectangle(
                      extent={{-42,12},{34,-14}},
                      lineColor={255,255,0},
                      lineThickness=0.5,
                      fillPattern=FillPattern.Solid,
                      fillColor={255,255,0}),
                    Polygon(
                      points={{8,42},{8,-42},{50,0},{8,42}},
                      lineColor={255,255,0},
                      lineThickness=0.5,
                      fillPattern=FillPattern.Sphere,
                      smooth=Smooth.None,
                      fillColor={255,255,0})}));
            end In;

            connector Through "Connector with no preferred flow direction"
              extends Physiolibrary.Hydraulic.Interfaces.HydraulicPort;

              annotation (Icon(graphics={Ellipse(
                      extent={{-80,80},{80,-80}},
                      lineColor={197,52,16},
                      fillColor={255,170,0},
                      fillPattern=FillPattern.Sphere)}));
            end Through;

            connector Out "Outflow connector"
              extends Physiolibrary.Hydraulic.Interfaces.HydraulicPort;

              annotation (Icon(graphics={
                    Ellipse(
                      extent={{-80,80},{80,-80}},
                      lineColor={229,133,64},
                      fillColor={255,255,0},
                      fillPattern=FillPattern.Sphere),
                    Rectangle(
                      extent={{-42,12},{32,-14}},
                      lineColor={255,0,0},
                      lineThickness=0.5,
                      fillPattern=FillPattern.Solid,
                      fillColor={255,0,0}),
                    Polygon(
                      points={{8,42},{8,-42},{50,0},{8,42}},
                      lineColor={255,0,0},
                      lineThickness=0.5,
                      fillPattern=FillPattern.Sphere,
                      smooth=Smooth.None,
                      fillColor={255,0,0})}));
            end Out;

          end Connectors;

          package BlockKinds "Fundamental types of blocks"
            partial model Port "Block with flow through"
              import Physiolibrary.Types.*;

              Connectors.In cIn "Inflow" annotation (Placement(transformation(
                      extent={{-90,-10},{-70,10}})));
              Connectors.Out cOut "Outflow" annotation (Placement(
                    transformation(extent={{70,-10},{90,10}})));

              Pressure dp=cIn.pressure - cOut.pressure "Pressure gradient";

              annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics));
            end Port;

            model Hook "Block for intercepting flow"

              Connectors.Through c "Hooking connector" annotation (Placement(
                    transformation(extent={{-10,40},{10,60}}),
                    iconTransformation(extent={{-10,40},{10,60}})));

              annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics), Icon(
                    coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                        {100,100}}), graphics));
            end Hook;
          end BlockKinds;

          package Analyzers
            "Components for analysis of signal during a cardiac cycle"
            package Abstraction "Common ancestors"
              partial class Analyzer
                import Physiolibrary.Types.*;

                replaceable type T = Real constrainedby Real
                  "Signal type - to guarantee a unit control" annotation (
                    choicesAllMatching=true);

                parameter T init=0 "Initial value for output from analyzer";

                input Boolean condition=true
                  "Analyzer works if condition is true";
                input Boolean control
                  "When changed, the analyzer outputs and resets";
                input T signal "Signal to be analyzed";

              end Analyzer;
            end Abstraction;

            class Averager "Computes average value"
              extends Abstraction.Analyzer;
              import Physiolibrary.Types.*;

              discrete T average(start=init, fixed=true)
                "Resulting signal average of the previous phase";

            protected
              T integral(start=0) "Integral of the input signal";
              // Setting fixed=true for those two variables wouldn't compile in Dymola 2014; in Dymola 2015 FD01 it would be OK
              Time t(start=0) "Current duration of integration";
              Time unit=1
                "Auxiliary variable to resolve the modified unit type of the integral ([T]/s is unknown beforehand)";

            equation
              der(t) = if condition then 1 else 0;
              der(integral) = if condition then signal/unit else 0;
              when change(control) then
                average = (if pre(t) == 0 then 0 else pre(integral)/pre(t))*
                  unit;
                reinit(integral, 0);
                reinit(t, 0);
              end when;

            end Averager;

            class Maxer "Traces maximum value in the signal"
              extends Abstraction.Analyzer;
              import Physiolibrary.Types.*;

              discrete T maximum(start=init) "Resulting real-time maximum";

            equation
              // Sampling needs to be used to avoid troubled integration of some variables (crashed)
              when {change(control),sample(0, 1e-2)} then
                maximum = if change(control) then 0 elseif condition then max(
                  pre(maximum), pre(signal)) else pre(maximum);
              end when;

            end Maxer;
          end Analyzers;

          package RLC "Components with RLC characteristics"
            package Elements "Fundamental units for RLC"
              model R "Resistive port"
                extends Auxiliary.BlockKinds.Port;
                extends Physiolibrary.Icons.Resistor;
                import Physiolibrary.Types.*;

                input HydraulicResistance R "Current resistance";
                input Real nonlinearity=1
                  "Special argument to allow for a non-linear term";

              equation
                cIn.q*R*nonlinearity = dp;
                0 = cIn.q + cOut.q;

              end R;

              model L "Port with inertance"
                extends Auxiliary.BlockKinds.Port;
                extends Physiolibrary.Icons.Inertance;
                import Physiolibrary.Types.*;

                input HydraulicInertance L=0 "Current inertance";

              equation
                der(cIn.q)*L = dp;
                0 = cIn.q + cOut.q;

              end L;

              model C "Compliance compartment"
                extends Auxiliary.BlockKinds.Hook;
                extends Physiolibrary.Icons.BloodElasticCompartment;
                import Physiolibrary.Types.*;

                parameter Volume V_init=0 "Starting volume";

                input HydraulicCompliance C "Current compliance";
                input Pressure pGround=0 "Grounding pressure";

                Pressure dp=c.pressure - pGround "Pressure gradient";
                Volume V(start=V_init) "Compartment volume";

              equation
                c.q = C*der(dp);
                c.q = der(V);

                annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                        extent={{-100,-100},{100,100}}), graphics));
              end C;

              model ExponentialResistance
                "Resistive port with exponential resistivity profile dp = Base*q^Exp"
                extends Auxiliary.BlockKinds.Port;
                extends Physiolibrary.Icons.Resistor;
                import Physiolibrary.Types.*;

                parameter Real Base "Base for mmHg";
                parameter Real Exp;
                parameter Boolean closed = false;

                Real qs=cIn.q^2;
                Real dps=dp^2;
              equation
                //   if noEvent(dp >= 0) and noEvent(cIn.q >= 0) then
                //     Base*cIn.q^Exp = dp;
                //     //log(dp/Base) = Exp*log(cIn.q);
                //
                //   else
                //     // just a numeric workaround for negative flows
                //     Base*(-cIn.q)^Exp = -dp;
                //     //    log(-dp/Base) = Exp*log(-cIn.q);
                //   end if;

                //   dp = if noEvent(dp >= 0) and noEvent(cIn.q >= 0) then Base*cIn.q^Exp else -
                //     Base*(-cIn.q)^Exp;
                if closed then
                  cIn.q = 0;
                  else
                cIn.q = if noEvent(dp >= 0) then (dp/Base)^(1/Exp) else -(-dp/
                  Base)^(1/Exp);
                end if;


                0 = cIn.q + cOut.q;

                annotation (Icon(graphics={Line(
                        points={{-80,-60},{-20,-52},{38,-18},{60,60}},
                        color={28,108,200},
                        smooth=Smooth.Bezier), Text(
                        extent={{-68,-28},{54,38}},
                        lineColor={28,108,200},
                        textString="B^exp")}));
              end ExponentialResistance;
            end Elements;

            package Compounds "RLC circuits"
              model RC "Constant RC segment"
                extends BlockKinds.Port;
                import Physiolibrary.Types.*;

                parameter HydraulicResistance R "Constant resistance";
                parameter HydraulicCompliance C "Constant compliance";

                Volume V=capacitor.V "Segment volume";

                Elements.C capacitor(C=C) annotation (Placement(transformation(
                      extent={{-10,-10},{10,10}},
                      rotation=0,
                      origin={40,-6})));
                Elements.R resistor(R=R) annotation (Placement(transformation(
                        extent={{-50,-10},{-30,10}})));

              equation
                connect(cIn, resistor.cIn) annotation (Line(
                    points={{-80,0},{-48,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(resistor.cOut, capacitor.c) annotation (Line(
                    points={{-32,0},{8,0},{8,-1},{40,-1}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(cOut, capacitor.c) annotation (Line(
                    points={{80,0},{64,0},{64,-1},{40,-1}},
                    color={0,0,255},
                    smooth=Smooth.None));

                annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                        extent={{-100,-100},{100,100}}), graphics), Icon(
                      graphics={Text(
                        extent={{-32,26},{32,-24}},
                        lineColor={0,0,0},
                        fillColor={255,255,255},
                        fillPattern=FillPattern.Solid,
                        textStyle={TextStyle.Bold},
                                      textString="RC"),Text(
                        extent={{-70,86},{72,30}},
                        lineColor={0,0,0},
                        fillColor={86,199,10},
                        fillPattern=FillPattern.Solid,
                        textString="%name")}));
              end RC;

              model RLC "Constant RLC segment"
                extends BlockKinds.Port;
                import Physiolibrary.Types.*;

                parameter HydraulicResistance R "Constant resistance";
                parameter HydraulicInertance L "Constant inertance";
                parameter HydraulicCompliance C "Constant compliance";

                Volume V=capacitor.V "Segment volume";

                Elements.C capacitor(C=C) annotation (Placement(transformation(
                      extent={{-10,-10},{10,10}},
                      rotation=0,
                      origin={40,-6})));
                Elements.L inductor(L=L) annotation (Placement(transformation(
                        extent={{-10,-10},{10,10}})));
                Elements.R resistor(R=R) annotation (Placement(transformation(
                        extent={{-50,-10},{-30,10}})));

              equation
                connect(cIn, resistor.cIn) annotation (Line(
                    points={{-80,0},{-48,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(resistor.cOut, inductor.cIn) annotation (Line(
                    points={{-32,0},{-8,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(inductor.cOut, capacitor.c) annotation (Line(
                    points={{8,0},{28,0},{28,-1},{40,-1}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(cOut, capacitor.c) annotation (Line(
                    points={{80,0},{64,0},{64,-1},{40,-1}},
                    color={0,0,255},
                    smooth=Smooth.None));

                annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                        extent={{-100,-100},{100,100}}), graphics), Icon(
                      graphics={Text(
                        extent={{-34,26},{30,-24}},
                        lineColor={0,0,0},
                        fillColor={255,255,255},
                        fillPattern=FillPattern.Solid,
                        textStyle={TextStyle.Bold},
                                      textString="RLC"),Text(
                        extent={{-70,86},{72,30}},
                        lineColor={0,0,0},
                        fillColor={86,199,10},
                        fillPattern=FillPattern.Solid,
                        textString="%name")}));
              end RLC;

              model CLR "Constant CLR segment"
                extends BlockKinds.Port;
                import Physiolibrary.Types.*;

                parameter HydraulicCompliance C "Constant compliance";
                parameter HydraulicInertance L "Constant inertance";
                parameter HydraulicResistance R "Constant resistance";

                Volume V=capacitor.V "Segment volume";

                Elements.C capacitor(C=C) annotation (Placement(transformation(
                      extent={{-10,-10},{10,10}},
                      rotation=0,
                      origin={-40,-6})));
                Elements.L inductor(L=L) annotation (Placement(transformation(
                        extent={{-10,-10},{10,10}})));
                Elements.R resistor(R=R) annotation (Placement(transformation(
                        extent={{30,-10},{50,10}})));

              equation
                connect(inductor.cOut, resistor.cIn) annotation (Line(
                    points={{8,0},{32,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(cOut, resistor.cOut) annotation (Line(
                    points={{80,0},{48,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(cIn, capacitor.c) annotation (Line(
                    points={{-80,0},{-56,0},{-56,-1},{-40,-1}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(inductor.cIn, capacitor.c) annotation (Line(
                    points={{-8,0},{-20,0},{-20,-1},{-40,-1}},
                    color={0,0,255},
                    smooth=Smooth.None));

                annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                        extent={{-100,-100},{100,100}}), graphics), Icon(
                      graphics={Text(
                        extent={{-34,26},{30,-24}},
                        lineColor={0,0,0},
                        fillColor={255,255,255},
                        fillPattern=FillPattern.Solid,
                        textStyle={TextStyle.Bold},
                                      textString="CLR"),Text(
                        extent={{-66,86},{76,30}},
                        lineColor={0,0,0},
                        fillColor={86,199,10},
                        fillPattern=FillPattern.Solid,
                        textString="%name")}));
              end CLR;

              model CRL "Constant CRL segment"
                extends Auxiliary.BlockKinds.Port;
                import Physiolibrary.Types.*;

                parameter HydraulicCompliance C "Constant compliance";
                parameter HydraulicResistance R "Constant resistance";
                parameter HydraulicInertance L "Constant inertance";

                Volume V=capacitor.V "Segment volume";

                Elements.C capacitor(C=C) annotation (Placement(transformation(
                      extent={{-10,-10},{10,10}},
                      rotation=0,
                      origin={-40,-6})));
                Elements.L inductor(L=L) annotation (Placement(transformation(
                        extent={{30,-10},{50,10}})));
                Elements.R resistor(R=R) annotation (Placement(transformation(
                        extent={{-10,-10},{10,10}})));

              equation
                connect(capacitor.c, cIn) annotation (Line(
                    points={{-40,-1},{-60,-1},{-60,0},{-80,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(capacitor.c, resistor.cIn) annotation (Line(
                    points={{-40,-1},{-20,-1},{-20,0},{-8,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(resistor.cOut, inductor.cIn) annotation (Line(
                    points={{8,0},{32,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(cOut, inductor.cOut) annotation (Line(
                    points={{80,0},{48,0}},
                    color={0,0,255},
                    smooth=Smooth.None));

                annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                        extent={{-100,-100},{100,100}}), graphics), Icon(
                      graphics={Text(
                        extent={{-34,26},{30,-24}},
                        lineColor={0,0,0},
                        fillColor={255,255,255},
                        fillPattern=FillPattern.Solid,
                        textStyle={TextStyle.Bold},
                                      textString="CRL"),Text(
                        extent={{-66,86},{76,30}},
                        lineColor={0,0,0},
                        fillColor={86,199,10},
                        fillPattern=FillPattern.Solid,
                        textString="%name")}));
              end CRL;

              model CLpRR "Constant C(L|R)R segment"
                extends CLR;
                import Physiolibrary.Types.*;

                parameter HydraulicResistance Rp "Constant parallel resistance";

                Elements.R resistorPar(R=Rp) annotation (Placement(
                      transformation(extent={{-10,10},{10,30}})));

              equation
                connect(resistorPar.cIn, inductor.cIn) annotation (Line(
                    points={{-8,20},{-8,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(resistorPar.cOut, inductor.cOut) annotation (Line(
                    points={{8,20},{8,0}},
                    color={0,0,255},
                    smooth=Smooth.None));

                annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                        extent={{-100,-100},{100,100}}), graphics), Icon(
                      graphics={Rectangle(
                        extent={{-48,18},{52,-18}},
                        lineColor={255,255,255},
                        fillColor={255,255,255},
                                      fillPattern=FillPattern.Solid),Text(
                        extent={{-34,26},{30,-24}},
                        lineColor={0,0,0},
                        fillColor={255,255,255},
                        fillPattern=FillPattern.Solid,
                        textStyle={TextStyle.Bold},
                        textString="CLpRR")}));
              end CLpRR;

              model CRLpR "Constant CR(L|R) segment"
                extends CRL;
                import Physiolibrary.Types.*;

                parameter HydraulicResistance Rp "Constant parallel resistance";

                Elements.R resistorPar(R=Rp) annotation (Placement(
                      transformation(extent={{30,14},{50,34}})));

              equation
                connect(resistorPar.cIn, inductor.cIn) annotation (Line(
                    points={{32,24},{32,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(resistorPar.cOut, inductor.cOut) annotation (Line(
                    points={{48,24},{48,0}},
                    color={0,0,255},
                    smooth=Smooth.None));

                annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                        extent={{-100,-100},{100,100}}), graphics), Icon(
                      graphics={Rectangle(
                        extent={{-50,18},{50,-18}},
                        lineColor={255,255,255},
                        fillColor={255,255,255},
                                      fillPattern=FillPattern.Solid),Text(
                        extent={{-34,26},{30,-24}},
                        lineColor={0,0,0},
                        fillColor={255,255,255},
                        fillPattern=FillPattern.Solid,
                        textStyle={TextStyle.Bold},
                        textString="CRLpR")}));
              end CRLpR;

              partial model LpRCR "Constant (L|R)CR segment"
                extends BlockKinds.Port;
                import Physiolibrary.Types.*;

                parameter HydraulicInertance L "Constant inertance";
                parameter HydraulicResistance Rp "Constant parallel resistance";
                parameter HydraulicCompliance C "Constant compliance";
                parameter HydraulicResistance R "Constant resistance";

                Volume V=capacitor.V "Segment volume";

                Elements.C capacitor(C=C) annotation (Placement(transformation(
                      extent={{-10,-10},{10,10}},
                      rotation=0,
                      origin={0,-6})));
                Elements.L inductor(L=L) annotation (Placement(transformation(
                        extent={{-50,10},{-30,30}})));
                Elements.R resistorP(R=Rp) annotation (Placement(transformation(
                        extent={{-50,-30},{-30,-10}})));
                Elements.R resistor(R=R) annotation (Placement(transformation(
                        extent={{30,-10},{50,10}})));

              equation
                connect(inductor.cIn, cIn) annotation (Line(
                    points={{-48,20},{-64,20},{-64,0},{-80,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(resistorP.cIn, cIn) annotation (Line(
                    points={{-48,-20},{-64,-20},{-64,0},{-80,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(capacitor.c, inductor.cOut) annotation (Line(
                    points={{0,-1},{-16,-1},{-16,20},{-32,20}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(capacitor.c, resistorP.cOut) annotation (Line(
                    points={{0,-1},{-16,-1},{-16,-20},{-32,-20}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(capacitor.c, resistor.cIn) annotation (Line(
                    points={{0,-1},{20,-1},{20,0},{32,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(cOut, resistor.cOut) annotation (Line(
                    points={{80,0},{48,0}},
                    color={0,0,255},
                    smooth=Smooth.None));

                annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                        extent={{-100,-100},{100,100}}), graphics), Icon(
                      graphics={Text(
                        extent={{-34,26},{30,-24}},
                        lineColor={0,0,0},
                        fillColor={255,255,255},
                        fillPattern=FillPattern.Solid,
                        textStyle={TextStyle.Bold},
                                      textString="LpRCR"),Text(
                        extent={{-66,86},{76,30}},
                        lineColor={0,0,0},
                        fillColor={86,199,10},
                        fillPattern=FillPattern.Solid,
                        textString="%name")}));
              end LpRCR;

              model RRcC "Constant R(R-C) segment"
                extends BlockKinds.Port;
                import Physiolibrary.Types.*;

                parameter HydraulicCompliance C "Constant compliance";
                parameter HydraulicResistance Rc
                  "Constant compliance resistance";
                parameter HydraulicResistance R "Constant resistance";

                Volume V=capacitor.V "Segment volume";

                Elements.C capacitor(C=C) annotation (Placement(transformation(
                      extent={{-10,-10},{10,10}},
                      rotation=0,
                      origin={22,-34})));
                Elements.R resistor(R=R) annotation (Placement(transformation(
                        extent={{-50,-10},{-30,10}})));
                Elements.R resistorC(R=Rc) annotation (Placement(transformation(
                      extent={{-10,-10},{10,10}},
                      rotation=-90,
                      origin={22,-8})));

              equation
                connect(cIn, resistor.cIn) annotation (Line(
                    points={{-80,0},{-48,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(resistor.cOut, resistorC.cIn) annotation (Line(
                    points={{-32,0},{22,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(cOut, resistorC.cIn) annotation (Line(
                    points={{80,0},{22,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(resistorC.cOut, capacitor.c) annotation (Line(
                    points={{22,-16},{22,-26},{22,-29},{22,-29}},
                    color={0,0,255},
                    smooth=Smooth.None));

                annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                        extent={{-100,-100},{100,100}}), graphics), Icon(
                      coordinateSystem(preserveAspectRatio=false, extent={{-100,
                          -100},{100,100}}), graphics={Text(
                        extent={{-32,26},{32,-24}},
                        lineColor={0,0,0},
                        fillColor={255,255,255},
                        fillPattern=FillPattern.Solid,
                        textStyle={TextStyle.Bold},
                                      textString="RRcC"),Text(
                        extent={{-66,84},{76,28}},
                        lineColor={0,0,0},
                        fillColor={86,199,10},
                        fillPattern=FillPattern.Solid,
                        textString="%name")}));
              end RRcC;

            end Compounds;

            package Tubes "Geometrical tubes with RLC characteristics"
              package Abstraction "Common ancestors"
                model Tube "Tube segment"
                  extends Physiolibrary.Icons.HydraulicResistor;
                  import Cardiovascular.Types.*;

                  parameter Cardiovascular.Types.Length l "Length";
                  parameter Cardiovascular.Types.Length r
                    "Cross-sectional radius";

                  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
                          extent={{-100,-100},{100,100}})));

                end Tube;
              end Abstraction;

              model TubeR "Resistive tube"
                extends Abstraction.Tube;
                extends Elements.R(R=8*mu*l/pi/r^4);
                import Cardiovascular.Constants.*;
                import Modelica.Constants.*;

              end TubeR;

              model TubeRLC "Tube with resistance, inertance, and compliance"
                extends Abstraction.Tube;
                extends Compounds.RLC(
                  R=qR*mu*l/pi/r^4,
                  L=qL*rho*l/pi/r^2,
                  C=qC*pi*r^3*l/E/h);
                import Cardiovascular.Constants.*;
                import Cardiovascular.Types.*;
                import Modelica.Constants.*;
                import Physiolibrary.Types.*;

                parameter Cardiovascular.Types.Length h "Wall thickness";
                parameter Pressure E "Young's elastic modulus";

                parameter Real qR=8
                  "Numerical coefficient for resistance equation";
                parameter Real qL=1
                  "Numerical coefficient for inertance equation";
                parameter Real qC=1.5
                  "Numerical coefficient for compliance equation";

                annotation (Icon(graphics));
              end TubeRLC;

              model TubeRLC_Ferrari
                "Arterial segment as used by Ferrari et al. (2005)"
                extends TubeRLC(E=4.08*9.80665*1e4, qC=3.53);

              end TubeRLC_Ferrari;

              model TubeRLC_Derived
                "Arterial segment as used in the derived tree"
                extends TubeRLC(
                  qC=3.53/arterialStiffnessScale,
                  qL=8*(0.2057 - 0.0392),
                  resistor(R=R + Rb + Rc));
                import Cardiovascular.Constants.*;
                import Cardiovascular.Types.*;
                import Modelica.Constants.*;
                import Physiolibrary.Types.*;

                outer parameter Cardiovascular.Types.Length
                  cannulaOuterDiameter "Outer diameter of ECMO cannula";
                outer parameter Cardiovascular.Types.Length cannulaDepth
                  "Insertion depth of ECMO cannula";
                outer parameter Fraction arterialStiffnessScale
                  "Stifness scale coefficient";

                parameter Boolean isBranching=false
                  "Whether the segment is after branching and should include branching resistance";
                parameter Boolean isCannulated=false
                  "Whether a cannula is connected";

                parameter HydraulicResistance Rb=if isBranching then h/r*qRb
                     else 0 "Branching resistance";
                parameter HydraulicResistance Rc=if isCannulated then 8*mu*
                    cannulaOuterDiameter/pi*(1/(((cannulaOuterDiameter*pi*r^2
                     - cannulaDepth*pi*(cannulaOuterDiameter/2)^2)/
                    cannulaOuterDiameter/pi)^0.5)^4 - 1/r^4) else 0
                  "Additional resistance according to volume of inserted cannula";

                constant Real qRb=100e6
                  "Numerical coefficient for branching resistance equation";

                annotation (Icon(graphics));
              end TubeRLC_Derived;

              model TubeRLC_Derived_IABP
                "Arterial segment allowing for IABP connection as used in the derived tree"
                extends TubeRLC_Derived(resistor(R=(if enableIABP then R/(1 -
                        xi^4 - (1 - xi^2)^2/log(xi)) else R) + Rb + Rc),
                    inductor(L=(if enableIABP then L/(1 - xi^2) else L)));
                import Cardiovascular.Constants.*;
                import Cardiovascular.Types.*;
                import Modelica.Constants.*;
                import Physiolibrary.Types.*;

                outer parameter Boolean enableIABP "Whether IABP is implanted";
                outer parameter Time tDeflation
                  "Time of balloon deflation with respect to cardiac cycle duration";
                outer parameter Time tInflation
                  "Time of balloon inflation with respect to cardiac cycle duration";

                outer Time cycleDuration "Duration of cardiac cycle";

                parameter Time flationDuration=80e-3
                  "Duration of transition between inflation and deflation and vice versa";
                parameter Cardiovascular.Types.Length rIABPdeflated=5e-4
                  "Radius of deflated balloon";
                parameter Cardiovascular.Types.Length rIABPinflated=8e-3
                  "Radius of inflated balloon";
                parameter Pressure pIABPdeflated=-200*101325/760
                  "Balloon pressure when deflated";
                parameter Pressure pIABPinflated=200*101325/760
                  "Balloon pressure when inflated";
                parameter Boolean useIABP2=false
                  "Whether the second IABP compliance should be used (applied in starting segment with IABP)";

                Boolean deflation(start=false)
                  "Whether deflation is in progress";
                Boolean inflation(start=false)
                  "Whether inflation is in progress";
                Pressure pIABP(start=if tInflation < tDeflation then
                      pIABPdeflated else pIABPinflated)
                  "Current balloon pressure";
                Cardiovascular.Types.Length rIABP(start=if tInflation <
                      tDeflation then rIABPdeflated else rIABPinflated)
                  "Current balloon radius";
                Time t "Current time with respect to cardiac cycle";
                Real xi=rIABP/r
                  "Fraction of balloon radius and arterial radius";

                Elements.C capacitorIABP(C=0.1*C, pGround=pIABP) if enableIABP
                  annotation (Placement(transformation(extent={{24,-46},{44,-26}})));
                Elements.C capacitorIABP2(C=0.1*C, pGround=pIABP) if useIABP2
                   and enableIABP annotation (Placement(transformation(extent={
                          {-50,-46},{-30,-26}})));

              equation
                der(t) = 1;
                when t >= cycleDuration then
                  reinit(t, t - cycleDuration);
                end when;

                if enableIABP then
                  inflation = t >= tInflation and t <= tInflation +
                    flationDuration or t + cycleDuration >= tInflation and t +
                    cycleDuration <= tInflation + flationDuration;
                  deflation = t >= tDeflation and t <= tDeflation +
                    flationDuration or t + cycleDuration >= tDeflation and t +
                    cycleDuration <= tDeflation + flationDuration;
                  if inflation then
                    der(rIABP) = (rIABPinflated - rIABPdeflated)/
                      flationDuration;
                    der(pIABP) = (pIABPinflated - pIABPdeflated)/
                      flationDuration;
                  elseif deflation then
                    der(rIABP) = (rIABPdeflated - rIABPinflated)/
                      flationDuration;
                    der(pIABP) = (pIABPdeflated - pIABPinflated)/
                      flationDuration;
                  else
                    der(rIABP) = 0;
                    der(pIABP) = 0;
                  end if;
                else
                  inflation = false;
                  deflation = false;
                  rIABP = 1/inf;
                  pIABP = 0;
                end if;

                connect(inductor.cOut, capacitorIABP.c) annotation (Line(
                    points={{8,0},{18,0},{18,-31},{34,-31}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(capacitorIABP2.c, resistor.cIn) annotation (Line(
                    points={{-40,-31},{-40,-14},{-48,-14},{-48,0}},
                    color={0,0,255},
                    smooth=Smooth.None));

                annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                        extent={{-100,-100},{100,100}}), graphics), Icon(
                      coordinateSystem(preserveAspectRatio=false, extent={{-100,
                          -100},{100,100}}), graphics={Text(
                        extent={{-62,-34},{62,-76}},
                        lineColor={127,0,127},
                        fillColor={86,199,10},
                        fillPattern=FillPattern.Solid,
                        textString="+IABP")}));
              end TubeRLC_Derived_IABP;
            end Tubes;
          end RLC;
        end Auxiliary;

        package Main "Main components of cardiovascular circuits"
          package Heart "Heart and its subparts"
            package Abstraction "Common ancestors"
              partial model HeartWall
                "Heart wall with sarcomere mechanics based on source code for CircAdapt by Arts et al. (2012)"
                import Cardiovascular.Model.Complex.Environment.*;
                import Cardiovascular.Types.*;
                import Modelica.Constants.*;
                import Physiolibrary.Types.*;

                outer Environment.ComplexEnvironment settings
                  "Everything is out there...";

              //   discrete input Cardiovascular.Types.Area Am0(start=Am0_init,
              //       fixed=true) "Adaptable mid-wall area of dead space";
              //   discrete input Cardiovascular.Types.Area AmRef(start=AmRef_init,
              //       fixed=true) "Adaptable mid-wall area of cavity";
              //   discrete input Pressure sigmaPRef(start = sigmaPRef_init, fixed = true)
              //     "Adaptable reference passive myofiber stress";
              //   discrete input Volume VW(start = VW_init, fixed = true)
              //     "Adaptable wall volume";
              // DISABLING THE ADAPTATION
                Cardiovascular.Types.Area Am0=Am0_init;
                Cardiovascular.Types.Area AmRef=AmRef_init;
                Pressure sigmaPRef=sigmaPRef_init;
                Volume VW=VW_init;



                input Real tauA "Activation time coefficient";
                input Time tDelay
                  "Delay in contraction with respect to start of cardiac cycle";

                // constant parameters
                parameter Cardiovascular.Types.Length LsP0=settings.constants.LsP0
                  "Sarcomere length with zero passive stress";
                parameter Cardiovascular.Types.Length Lsc0=settings.constants.Lsc0
                  "Length of contractile sarcomere element with zero passive stress";
                parameter Cardiovascular.Types.Length LseIso=settings.constants.LseIso
                  "Reference length of isometrically stressed elastic sarcomere element";
                parameter Cardiovascular.Types.Length LsRef=settings.constants.LsRef
                  "Reference sarcomere length";

                // top-level parameters
                parameter Cardiovascular.Types.Area Am0_init
                  "Starting value of mid-wall area of dead space";
                parameter Cardiovascular.Types.Area AmRef_init
                  "Starting value of mid-wall surface area";
                parameter Fraction contractilityScale=1
                  "Scaling coefficient of contractility";
                parameter Real CRest=settings.constants.CRest
                  "Contractility at fiber rest";

                parameter Pressure sigmaPRef_init
                  "Starting value of reference passive myofiber stress";
                parameter Volume VW_init "Starting value of wall volume";

                // parameters to distinguish Atria and Ventricles during inheritance
                parameter Cardiovascular.Types.Length dLsP
                  "Passive stress coefficient";
                parameter Pressure sigmaARef "Reference active myofiber stress";
                parameter Real tauS "Time scaling coefficient";
                parameter Velocity vMax
                  "Reference maximal sarcomere contraction velocity";

                Real epsilon=0.5*log(max(1e-9, Am - Am0)/AmRef) - 1/12*z^2 -
                    0.019*z^4 "Natural myofiber strain";
                Cardiovascular.Types.Length Ls=LsRef*exp(epsilon)
                  "Sarcomere length";
                Cardiovascular.Types.Length LscNorm=max(0.0001, (Lsc - Lsc0)*
                    1e6) "Normalized length of contractile sarcomere element";
                Cardiovascular.Types.Length Lse=Ls - Lsc
                  "Length of elastic sarcomere element";
                Real LseNorm=max(-0.02, Lse/LseIso)
                  "Normalized length of elastic sarcomere element";
                Pressure pT=2*Tm*Cm "Transmural pressure";
                Pressure sigma=max(0.2*sigmaP, sigmaP) + sigmaA
                  "Total myofiber stress";
                Pressure sigmaA=sigmaARef*LscNorm*((C + CRest)*LseNorm - CRest)
                  "Active myofiber stress";
                Pressure sigmaP=sigmaPRef*(0.12*(cosh(5*smooth(1, noEvent(if Ls
                     > LsP0 then LsP0/dLsP*log(Ls/LsP0) else 0.0))) - 1) + (log(
                    Ls/LsRef) + 0.1)) "Passive myofiber stress";
                Real tauD=tauS*0.33*tauA
                  "Time coefficient for contractility decay";
                Real tauR=tauS*0.55*tauA
                  "Time coefficient for contractility rise";
                Real Tm(unit="kg/s2") = VW*sigma/2/Am*(1 + 0.27*z^2)
                  "Total wall tension";
                Real xD=(t - tDelay - tauA*(0.65 + 0.7*LscNorm))/tauD
                  "Auxiliary coefficient for modeling contractility decay";
                Real xR=min(8, max(0, (t - tDelay)/tauR))
                  "Auxiliary coefficient for modeling contractility rise";
                Real z=3*Cm*VW/2/(Am - Am0)
                  "Auxiliary coefficient for computing natural myofiber strain";

                // differentiated variables
                Cardiovascular.Types.Length Lsc
                  "Length of contractile sarcomere element";
                Real C(start=0, fixed=true) "Current contractility";
                Time t(start=0, fixed=true) "Time from start of cardiac cycle";

                // abstract variables
                Cardiovascular.Types.Area Am(start=AmRef_init, fixed=true)
                  "Current mid-wall area";
                Volume Vm "Current Mid-wall volume";
                Real Cm(unit="m-1") "Mid-wall curvature";
              equation
                der(Lsc) = max(LseNorm - 1, tanh(10*C + max(0, 1e-4*sigmaP^2))*
                  (LseNorm - 1))*vMax;
                der(C) = contractilityScale*(if t - tDelay < 0 then 0 else 1/
                  tauR*tanh(4*LscNorm^2)*0.02*xR^3*(8 - xR)^2*exp(-xR) - 1/tauD
                  *C*(0.5 + 0.5*sin((if xD >= 0 then 1 else -1)*min(pi/2, abs(
                  xD)))));
                der(t) = 1;
                when t - tDelay >= settings.condition.cycleDuration then
                  reinit(t, t - settings.condition.cycleDuration);
                end when;

              end HeartWall;
            end Abstraction;

            model Heart "Heart model including coronaries"
              extends Cardiovascular.Icons.Heart_detailed;
              import
                Cardiovascular.Model.Complex.Components.Auxiliary.Analyzers.*;
              import
                Cardiovascular.Model.Complex.Components.Auxiliary.Connectors.*;
              import Cardiovascular.Model.Complex.Components.Main.Vessels.*;
              import Cardiovascular.Model.Complex.Environment.*;
              import Physiolibrary.Types.*;

              outer Environment.ComplexEnvironment settings
                "Everything is out there...";
              inner Pressure pP=pPRef*(VP/VPRef)^kP "Pericardial pressure";

            //   discrete input Volume VPRef(start = VPRef_init, fixed = true)
            //     "Adaptable reference pericardial volume";
            // DISABLING THE ADAPTATION
              Volume VPRef=VPRef_init;

              parameter Real kP
                "Pericardial stiffness non-linearity coefficient";
              parameter Pressure pPRef "Pericardiial reference pressure";
              parameter Volume VPRef_init
                "Starting value of pericardial reference volume";

              Volume V=RA.V + LA.V + ventricles.VLV + ventricles.VRV + Coro.V
                "Current blood volume";
              Volume VP=RA.V + LA.V + ventricles.VLV + ventricles.VRV +
                  ventricles.LW.VW + ventricles.SW.VW + ventricles.RW.VW + RA.VW
                   + LA.VW "Current pericardial volume";

              Ventricles ventricles(pP=pP) annotation (Placement(transformation(
                      extent={{-32,-110},{28,-50}})));
              AtrialWall LA(
                AmRef_init=settings.initialization.LA_AmRef,
                sigmaPRef_init=settings.initialization.LA_sigmaPRef,
                Am0_init=settings.initialization.LA_Am0,
                tauA=settings.initialization.LA_tauA_Base + settings.initialization.LA_tauA_CycleFraction
                    *settings.condition.cycleDuration,
                tDelay=settings.initialization.LA_tDelay_Base + settings.initialization.LA_tDelay_CycleFraction
                    *settings.condition.cycleDuration,
                VW_init=settings.initialization.LA_VW,
                pP=0.5*pP,
                contractilityScale=settings.constants.LA_contractilityScale)
                annotation (Placement(transformation(extent={{58,-40},{16,-2}})));
              AtrialWall RA(
                AmRef_init=settings.initialization.RA_AmRef,
                sigmaPRef_init=settings.initialization.RA_sigmaPRef,
                Am0_init=settings.initialization.RA_Am0,
                tauA=settings.initialization.RA_tauA_Base + settings.initialization.RA_tauA_CycleFraction
                    *settings.condition.cycleDuration,
                tDelay=settings.initialization.RA_tDelay_Base + settings.initialization.RA_tDelay_CycleFraction
                    *settings.condition.cycleDuration,
                VW_init=settings.initialization.RA_VW,
                pP=pP,
                contractilityScale=settings.constants.RA_contractilityScale)
                annotation (Placement(transformation(extent={{-68,-58},{-22,-12}})));
              CoronaryVessels Coro(pM=ventricles.pM) annotation (Placement(
                    transformation(extent={{28,-42},{-34,20}})));
              Valve vLAV(
                Ko=settings.initialization.vLAV_Ko,
                Kc=settings.initialization.vLAV_Kc,
                Mrg=settings.initialization.vLAV_Mrg,
                Mst=settings.initialization.vLAV_Mst,
                ARef_init=settings.initialization.vLAV_ARef,
                l=settings.initialization.vLAV_l,
                dpO=settings.initialization.vLAV_dpO,
                dpC=settings.initialization.vLAV_dpC) annotation (Placement(
                    transformation(
                    extent={{-9.5963,-8.85676},{9.5963,8.85676}},
                    rotation=230,
                    origin={29.3837,-52.9558})));
              Valve vRAV(
                Ko=settings.initialization.vRAV_Ko,
                Kc=settings.initialization.vRAV_Kc,
                Mrg=settings.initialization.vRAV_Mrg,
                Mst=settings.initialization.vRAV_Mst,
                ARef_init=settings.initialization.vRAV_ARef,
                l=settings.initialization.vRAV_l,
                dpO=settings.initialization.vRAV_dpO,
                dpC=settings.initialization.vRAV_dpC) annotation (Placement(
                    transformation(
                    extent={{-10,-10},{10,10}},
                    rotation=-55,
                    origin={-32,-56})));
              Valve vSA(
                Ko=settings.initialization.vSA_Ko,
                Kc=settings.initialization.vSA_Kc,
                Mrg=settings.initialization.vSA_Mrg,
                Mst=settings.initialization.vSA_Mst,
                ARef_init=settings.initialization.vSA_ARef,
                l=settings.initialization.vSA_l,
                dpO=settings.initialization.vSA_dpO,
                dpC=settings.initialization.vSA_dpC) annotation (Placement(
                    transformation(
                    extent={{-10,-10},{10,10}},
                    rotation=89,
                    origin={10,-40})));
              Valve vPA(
                Ko=settings.initialization.vPA_Ko,
                Kc=settings.initialization.vPA_Kc,
                Mrg=settings.initialization.vPA_Mrg,
                Mst=settings.initialization.vPA_Mst,
                ARef_init=settings.initialization.vPA_ARef,
                l=settings.initialization.vPA_l,
                dpO=settings.initialization.vPA_dpO,
                dpC=settings.initialization.vPA_dpC) annotation (Placement(
                    transformation(
                    extent={{-10,-10},{10,10}},
                    rotation=89,
                    origin={-10,-40})));
              Valve vSV(
                Ko=settings.initialization.vSV_Ko,
                Kc=settings.initialization.vSV_Kc,
                Mrg=settings.initialization.vSV_Mrg,
                Mst=settings.initialization.vSV_Mst,
                ARef_init=settings.initialization.vSV_ARef,
                l=settings.initialization.vSV_l,
                dpO=settings.initialization.vSV_dpO,
                dpC=settings.initialization.vSV_dpC) annotation (Placement(
                    transformation(
                    extent={{-10,-10},{10,10}},
                    rotation=-91,
                    origin={-44,0})));
              Valve vPV(
                Ko=settings.initialization.vPV_Ko,
                Kc=settings.initialization.vPV_Kc,
                Mrg=settings.initialization.vPV_Mrg,
                Mst=settings.initialization.vPV_Mst,
                ARef_init=settings.initialization.vPV_ARef,
                l=settings.initialization.vPV_l,
                dpO=settings.initialization.vPV_dpO,
                dpC=settings.initialization.vPV_dpC) annotation (Placement(
                    transformation(
                    extent={{-10,-10},{10,10}},
                    rotation=-91,
                    origin={34,10})));
              In cVSV "Right atrial inlet - To be connected to systemic veins"
                annotation (Placement(transformation(
                    extent={{-10,-10},{10,10}},
                    rotation=-90,
                    origin={-42,24}), iconTransformation(
                    extent={{-10,-10},{10,10}},
                    rotation=-60,
                    origin={-42,24})));
              In cVPV "Left atrial inlet - To be connected to pulmonary veins"
                annotation (Placement(transformation(
                    extent={{-10,-10},{10,10}},
                    rotation=-90,
                    origin={32,36}), iconTransformation(
                    extent={{-10,-10},{10,10}},
                    rotation=-75,
                    origin={32,36})));
              Out cVSA "Aortic valve - To be connected to systemic arteries"
                annotation (Placement(transformation(
                    extent={{-10,-10},{10,10}},
                    rotation=110,
                    origin={-24,40}), iconTransformation(
                    extent={{-10,-10},{10,10}},
                    rotation=110,
                    origin={-24,40})));
              Out cVPA
                "Pulmonary valve - To be connected to pulmonary arteries"
                annotation (Placement(transformation(
                    extent={{-10,-10},{10,10}},
                    rotation=80,
                    origin={4,44}), iconTransformation(
                    extent={{-10,-10},{10,10}},
                    rotation=80,
                    origin={4,44})));

            equation

              connect(cVSV, vSV.cIn) annotation (Line(
                  points={{-42,24},{-44,24},{-44,7.99878},{-43.8604,7.99878}},
                  color={127,5,58},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(vSV.cOut, RA.c) annotation (Line(
                  points={{-44.1396,-7.99878},{-44,-7.99878},{-44,-23.5},{-45,-23.5}},
                  color={127,5,58},
                  smooth=Smooth.Bezier,
                  thickness=1));

              connect(RA.c, vRAV.cIn) annotation (Line(
                  points={{-45,-23.5},{-44,-23.5},{-44,-48},{-42,-48},{-42,-49.4468},
                      {-36.5886,-49.4468}},
                  color={127,5,58},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(cVPV, vPV.cIn) annotation (Line(
                  points={{32,36},{34,36},{34,17.9988},{34.1396,17.9988}},
                  color={255,0,0},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(vPV.cOut, LA.c) annotation (Line(
                  points={{33.8604,2.00122},{36,2.00122},{36,-11.5},{37,-11.5}},
                  color={255,0,0},
                  smooth=Smooth.Bezier,
                  thickness=1));

              connect(vLAV.cIn, LA.c) annotation (Line(
                  points={{34.3184,-47.0748},{36,-47.0748},{36,-11.5},{37,-11.5}},
                  color={255,0,0},
                  smooth=Smooth.Bezier,
                  thickness=1));

              connect(vLAV.cOut, ventricles.cLV) annotation (Line(
                  points={{24.449,-58.8368},{30,-58.8368},{24,-58.8368},{24,-68},
                      {12,-68},{12,-67.4},{8.8,-67.4}},
                  color={255,0,0},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(ventricles.cLV, vSA.cIn) annotation (Line(
                  points={{8.8,-67.4},{8,-67.4},{8,-47.9988},{9.86038,-47.9988}},
                  color={255,0,0},
                  smooth=Smooth.Bezier,
                  thickness=1));

              connect(vSA.cOut, cVSA) annotation (Line(
                  points={{10.1396,-32.0012},{8,-32.0012},{8,-20},{-20,-20},{-20,
                      38},{-24,38},{-24,40}},
                  color={255,0,0},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(ventricles.cRV, vRAV.cOut) annotation (Line(
                  points={{-11.6,-68},{-26,-68},{-26,-62},{-27.4114,-62},{-27.4114,
                      -62.5532}},
                  color={127,5,58},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(ventricles.cRV, vPA.cIn) annotation (Line(
                  points={{-11.6,-68},{-11.6,-66},{-10,-66},{-10,-62},{-10.1396,
                      -62},{-10.1396,-47.9988}},
                  color={127,5,58},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(vPA.cOut, cVPA) annotation (Line(
                  points={{-9.86038,-32.0012},{-10,-32.0012},{-10,-24},{4,-24},
                      {4,44}},
                  color={127,5,58},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(vSA.cOut, Coro.cIn) annotation (Line(
                  points={{10.1396,-32.0012},{10,-32.0012},{10,-32},{10,-24},{
                      22,-24},{22,-10},{22,-12},{21.8,-12},{21.8,-11}},
                  color={255,0,0},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(RA.c, Coro.cOut) annotation (Line(
                  points={{-45,-23.5},{-40,-23.5},{-40,-12},{-28,-12},{-28,-10},
                      {-28,-12},{-27.8,-12},{-27.8,-11}},
                  color={127,5,58},
                  smooth=Smooth.Bezier,
                  thickness=1));

              annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics), Icon(
                    coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                        {100,100}})));
            end Heart;

            model Valve "Heart valves with finite-time state transition"
              extends Auxiliary.BlockKinds.Port;
              extends Cardiovascular.Icons.Valve;
              import Cardiovascular.Constants.*;
              import Cardiovascular.Types.*;
              import Physiolibrary.Types.*;


              // discrete input Cardiovascular.Types.Area ARef(start=ARef_init,
              //       fixed=true) "Adaptable cross-sectional area";
            // DISABLING THE ADAPTATION
              Cardiovascular.Types.Area ARef=ARef_init;

              parameter Cardiovascular.Types.Area ARef_init
                "Starting value of reference cross-sectional area";
              parameter Position l "Length of valve segment";
              parameter Pressure dpO=0 "Opening pressure";
              parameter Pressure dpC=0 "Closing pressure";
              parameter Real Ko(unit="m2/(N.s)") "Opening rate coefficient";
              parameter Real Kc(unit="m2/(N.s)") "Closing rate coefficient";
              parameter Fraction Mrg=0 "Ratio of valve regurgitation";
              parameter Fraction Mst=0 "Valve stenosis ratio";

              Cardiovascular.Types.Area A=(AMax - AMin)*s + AMin
                "Current cross-sectional area";
              Cardiovascular.Types.Area AMin=Mrg*ARef + 1e-10
                "Cross-sectional area when closed, with miniature hole to prevent zero division";
              Cardiovascular.Types.Area AMax=(1 - Mst)*ARef
                "Cross-sectional area when open";

              Real s(start=1, fixed=true)
                "Opening state (1 = open .. 0 = closed)";
              Real R(unit="kg/m7") "Bernoulli resistance";
              HydraulicInertance L "Inertance";
            equation
              cIn.q = -cOut.q;

              if noEvent(A > 0) then
                dp = R*cIn.q*abs(cIn.q) + L*der(cIn.q);
                R = rho/2/A^2;
                L = rho*l/A;
              else
                cIn.q = 0;
                R = Modelica.Constants.inf;
                L = Modelica.Constants.inf;
              end if;

              if dp > dpO then
                der(s) = (1 - s)*Ko*(dp - dpO);
              elseif dp < dpC then
                der(s) = s*Kc*(dp - dpC);
              else
                der(s) = 0;
              end if;

              annotation (Icon(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}})));
            end Valve;

            model AtrialWall "Atrial wall and cavity"
              extends Cardiovascular.Icons.Atrium;
              extends Hook;
              extends Abstraction.HeartWall(
                dLsP=settings.constants.atriumDLsP,
                vMax=settings.constants.atriumVMax,
                tauS=settings.constants.atriumTauS,
                sigmaARef=settings.constants.atriumSigmaARef);
              import
                Cardiovascular.Model.Complex.Components.Auxiliary.BlockKinds.*;
              import Modelica.Constants.*;
              import Physiolibrary.Types.*;

              input Pressure pP "Pericardial pressure";

              Pressure p=pT + pP "Current atria pressure";
              Volume V "Current atria volume";

            equation
              // connector connection - 1+
              c.q = der(V) - (if V < 10e-6 then 700*(10e-6 - V) else 0);
              // Protection against near-zero volumes
              c.pressure = p;

              // implementation of inherited variables
              Vm = V + 0.5*VW;
              Cm = (4*pi/(3*Vm))^(1/3);
              Am = 4*pi/Cm^2;
              annotation (Documentation(info="<html>
<p>from triseg nodel</p>
</html>"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                        {100,100}})));
            end AtrialWall;

            model VentricularWall "Ventricular free or sepal wall"
              extends Abstraction.HeartWall(
                dLsP=settings.constants.ventricleDLsP,
                vMax=settings.constants.ventricleVMax,
                tauS=settings.constants.ventricleTauS,
                sigmaARef=settings.constants.ventricleSigmaARef);
              extends Physiolibrary.Icons.HeartVentricle;
              import Cardiovascular.Types.*;

            //   discrete input Real EAmRef(start = EAmRef_init, fixed = true)
            //     "Adaptable correctional coefficient for sepal wall geometry";
            // DISABLING THE ADAPTATION
              Real EAmRef=EAmRef_init;

              parameter Real EAmRef_init=0
                "Starting value of the correctional coefficient";

              input Cardiovascular.Types.Length xm
                "Wall extension along the x-axis";
              input Cardiovascular.Types.Length ym(start=0.033)
                "Wall extension along the y-axis";

              Real sinAlpha=2*xm*ym/(xm^2 + ym^2)
                "Sinus of angle of spherical surface";
              Real cosAlpha=(ym^2 - xm^2)/(xm^2 + ym^2)
                "Cosinus of angle of spherical surface";
              Real Tx(unit="kg/s2") = Tm*sinAlpha "Axial wall tension";
              Real Ty(unit="kg/s2") = Tm*cosAlpha "Radial wall tension";

            equation
              // implementation of inherited variables
              Vm = Modelica.Constants.pi/6*xm*(xm^2 + 3*ym^2);
              Am = Modelica.Constants.pi*(xm^2 + ym^2);
              Cm = 2*xm/(xm^2 + ym^2);

            end VentricularWall;

            model Ventricles "Model of interacting ventricles"
              extends Cardiovascular.Icons.Ventricle;
              import
                Cardiovascular.Model.Complex.Components.Auxiliary.Connectors.*;
              import Cardiovascular.Model.Complex.Environment.*;
              import Cardiovascular.Types.*;
              import Physiolibrary.Types.*;

              outer Environment.ComplexEnvironment settings
                "Everything is out there...";

              input Pressure pP "Pericardial pressure";

              Volume VLV "Volume of left ventricle";
              Volume VRV "Volume of right ventricle";
              Pressure pLV=LW.pT + pP "Pressure in left ventricle";
              Pressure pRV=RW.pT + pP "Pressure in right ventricle";
              Pressure pM=sigmaRM + pLV*(rO - rM)/(rO - rI)
                "Intramyocardial pressure for left ventricle";

            protected
              Cardiovascular.Types.Length rO=(3*(VLV + (LW.VW + SW.VW)*1)/4/
                  Modelica.Constants.pi)^(1/3)
                "Radial position at outer surface";
              Cardiovascular.Types.Length rI=(3*(VLV + (LW.VW + SW.VW)*0)/4/
                  Modelica.Constants.pi)^(1/3)
                "Radial position at inner surface";
              Cardiovascular.Types.Length rM=(3*(VLV + (LW.VW + SW.VW)/3)/4/
                  Modelica.Constants.pi)^(1/3)
                "Radial possition at representative position (1 / 3) inside the wall";
              Real lambdaR=(((VLV + (LW.VW + SW.VW)/3)/(60e-6 + (LW.VW + SW.VW)
                  /3))^(1/3))^(-2) "Radial fiber stretch ratio";
              Pressure sigmaRM=if lambdaR < 1 then 0 else 0.2e3*(exp(9*(lambdaR
                   - 1)) - 1) "Radial passive wall stress";
              Real e
                "Error in sum of radial wall tensions for their adjustment";

            public
              Through cRV "Connector to right ventricle" annotation (Placement(
                    transformation(extent={{-42,30},{-22,50}}),
                    iconTransformation(extent={{-42,30},{-22,50}})));
              Through cLV "Connector to left ventricle" annotation (Placement(
                    transformation(extent={{26,32},{46,52}}),
                    iconTransformation(extent={{26,32},{46,52}})));

              VentricularWall LW(
                AmRef_init=settings.initialization.LW_AmRef,
                sigmaPRef_init=settings.initialization.LW_sigmaPRef,
                Am0_init=settings.initialization.LW_Am0,
                tauA=settings.initialization.LW_tauA_Base + settings.initialization.LW_tauA_CycleFraction
                    *settings.condition.cycleDuration,
                tDelay=settings.initialization.LW_tDelay_Base + settings.initialization.LW_tDelay_CycleFraction
                    *settings.condition.cycleDuration,
                EAmRef_init=settings.initialization.LW_EAmRef,
                VW_init=settings.initialization.LW_VW,
                contractilityScale=settings.constants.LW_contractilityScale)
                annotation (Placement(transforMation(extent={{-48,26},{-28,46}})));
              VentricularWall SW(
                AmRef_init=settings.initialization.SW_AmRef,
                sigmaPRef_init=settings.initialization.SW_sigmaPRef,
                Am0_init=settings.initialization.SW_Am0,
                tauA=settings.initialization.SW_tauA_Base + settings.initialization.SW_tauA_CycleFraction
                    *settings.condition.cycleDuration,
                tDelay=settings.initialization.SW_tDelay_Base + settings.initialization.SW_tDelay_CycleFraction
                    *settings.condition.cycleDuration,
                EAmRef_init=settings.initialization.SW_EAmRef,
                VW_init=settings.initialization.SW_VW,
                contractilityScale=settings.constants.SW_contractilityScale)
                annotation (Placement(transforMation(extent={{-18,4},{2,24}})));
              VentricularWall RW(
                AmRef_init=settings.initialization.RW_AmRef,
                sigmaPRef_init=settings.initialization.RW_sigmaPRef,
                Am0_init=settings.initialization.RW_Am0,
                tauA=settings.initialization.RW_tauA_Base + settings.initialization.RW_tauA_CycleFraction
                    *settings.condition.cycleDuration,
                tDelay=settings.initialization.RW_tDelay_Base + settings.initialization.RW_tDelay_CycleFraction
                    *settings.condition.cycleDuration,
                EAmRef_init=settings.initialization.RW_EAmRef,
                VW_init=settings.initialization.RW_VW,
                contractilityScale=settings.constants.RW_contractilityScale)
                annotation (Placement(transforMation(extent={{10,-20},{30,0}})));

            equation
              // missing definitions for following inputs :
              // Am0 (ihnerited from HeartWall)
              // AmRef (ihnerited from HeartWall)
              // EAmRef (ihnerited from HeartWall)
              // VW (ihnerited from HeartWall)
              // sigmaPRef (from VentricularWall)

              LW.Tx = RW.Tx + SW.Tx;
              LW.Ty + RW.Ty + SW.Ty = e;
              // This workaround needed because direct enforcement of equality of radial tensions led to numerical crashes in some cases
              der(LW.ym) = -e*1e6;
              // part of the workaround
              SW.ym = RW.ym;
              SW.ym = LW.ym;

              // ventricles volume
              LW.Vm = +VLV + 0.5*LW.VW + 0.5*SW.VW - SW.Vm;
              RW.Vm = +VRV + 0.5*RW.VW + 0.5*SW.VW + SW.Vm;

              // connectors connection
              cLV.pressure = pLV;
              cRV.pressure = pRV;
              cLV.q = der(VLV);
              cRV.q = der(VRV);

              annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics), Icon(
                    coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                        {100,100}})));
            end Ventricles;

            model HeartLVCannulated
              extends Heart;
              Auxiliary.Connectors.Out LVcannula
                "Pulmonary valve - To be connected to pulmonary arteries"
                annotation (Placement(transformation(
                    extent={{-10,-10},{10,10}},
                    rotation=80,
                    origin={90,-68}), iconTransformation(
                    extent={{-10,-10},{10,10}},
                    rotation=80,
                    origin={100,2})));
            equation
              connect(ventricles.cLV, LVcannula) annotation (Line(points={{8.8,
                      -67.4},{47.4,-67.4},{47.4,-68},{90,-68}}, color={197,52,
                      16}));
              annotation (Icon(graphics={Polygon(
                                  points={{32,-8},{40,2},{98,2},{96,-2},{42,-2},
                        {32,-8}}, lineColor={0,0,255},
                      lineThickness=1,
                      fillColor={0,0,255},
                      fillPattern=FillPattern.Solid)}), Diagram(
                    coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                        {100,100}})));
            end HeartLVCannulated;
          end Heart;

          package Vessels "Human vessels"
            package Abstraction "Common ancestors"
              partial model Vessels "General block for vessels"
                extends Auxiliary.BlockKinds.Port;
                import Physiolibrary.Types.RealIO.*;

                PressureOutput pInner "Output pressure for cappilary control"
                  annotation (Placement(transformation(
                      extent={{-10,-10},{10,10}},
                      rotation=-90,
                      origin={0,-80}), iconTransformation(
                      extent={{-10,-10},{10,10}},
                      rotation=-90,
                      origin={0,-10})));

                annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                        extent={{-100,-100},{100,100}}), graphics), Icon(
                      coordinateSystem(preserveAspectRatio=false, extent={{-100,
                          -100},{100,100}}), graphics));
              end Vessels;

              partial model AdaptableVessels
                "Vessels compatible with adaptation protocol based on source code for CircAdapt by Arts et al. (2012)"
                extends Abstraction.Vessels;
                import Cardiovascular.Model.Complex.Components.Auxiliary.RLC.*;
                import Cardiovascular.Types.*;
                import Physiolibrary.Types.*;
                import Physiolibrary.Hydraulic.Sensors.*;

                inner parameter Real k "Stiffness non-linearity coefficient";
                inner parameter Cardiovascular.Types.Length l
                  "Length of vessels";
                inner parameter Cardiovascular.Types.Area AW_init
                  "Starting value for wall cross-sectional area";
                inner parameter Cardiovascular.Types.Area ARef_init
                  "Starting value of reference inner cross-sectional area";
                inner parameter Pressure pRef_init
                  "Starting value of reference pressure";

                Volume V=core.V "Current volume";

                Elements.R RWave(R=core.RWave) annotation (Placement(
                      transformation(
                      extent={{-10,-10},{10,10}},
                      rotation=-90,
                      origin={-10,-8})));
                AdaptableVesselsCore core annotation (Placement(transformation(
                        extent={{-20,-46},{0,-26}})));
                PressureMeasure pressureMeasure annotation (Placement(
                      transformation(extent={{-4,-34},{16,-14}})));

              equation
                connect(RWave.cOut, core.c) annotation (Line(
                    points={{-10,-16},{-10,-31}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(RWave.cIn, cOut) annotation (Line(
                    points={{-10,0},{80,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(RWave.cIn, cIn) annotation (Line(
                    points={{-10,0},{-80,0}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(core.c, pressureMeasure.q_in)   annotation (Line(
                    points={{-10,-31},{2,-31},{2,-30}},
                    color={0,0,255},
                    smooth=Smooth.None));
                connect(pressureMeasure.pressure, pInner) annotation (Line(
                    points={{12,-28},{22,-28},{22,-66},{0,-66},{0,-80},{0,-80}},
                    color={0,0,127},
                    smooth=Smooth.None));

                annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                        extent={{-100,-100},{100,100}}), graphics), Icon(
                      coordinateSystem(preserveAspectRatio=false, extent={{-100,
                          -100},{100,100}}), graphics={Text(
                        extent={{-40,20},{40,80}},
                        lineColor={0,0,0},
                        textString="A",
                        fontName="Bauhaus 93",
                        textStyle={TextStyle.Bold})}));
              end AdaptableVessels;

              model Capillaries "Port for capillaries"
                extends Auxiliary.RLC.Elements.R(dp=pIn - pOut, R=R_R);
                import Physiolibrary.Types.RealIO.*;
                import Physiolibrary.Types.*;

                PressureInput pIn annotation (Placement(transformation(extent={
                          {-66,-90},{-26,-50}}), iconTransformation(
                      extent={{15,-15},{-15,15}},
                      rotation=-90,
                      origin={-39,-57})));
                PressureInput pOut annotation (Placement(transformation(extent=
                          {{52,-92},{92,-52}}), iconTransformation(
                      extent={{-15,-15},{15,15}},
                      rotation=90,
                      origin={39,-57})));
                HydraulicResistance R_R;
              equation
                der(R_R) = 0;
                // R is adaptable via reinit()

                annotation (Icon(coordinateSystem(preserveAspectRatio=false,
                        extent={{-100,-100},{100,100}}), graphics={Rectangle(
                        extent={{-70,30},{70,-30}},
                        lineColor={255,255,255},
                        fillColor={255,255,255},
                        fillPattern=FillPattern.Solid)}), Diagram(
                      coordinateSystem(preserveAspectRatio=false, extent={{-100,
                          -100},{100,100}})));
              end Capillaries;
            end Abstraction;

            model AdaptableVesselsCore "Compliance core of adaptable vessels"
              extends Hook;
              extends Physiolibrary.Icons.ElasticBalloon;
              import
                Cardiovascular.Model.Complex.Components.Auxiliary.BlockKinds.*;
              import Cardiovascular.Constants.*;
              import Cardiovascular.Types.*;
              import Cardiovascular.Types.IO.*;
              import Physiolibrary.Types.*;

              outer parameter Real k "Stiffness non-linearity coefficient";
              outer parameter Cardiovascular.Types.Length l "Length of vessels";
              outer parameter Cardiovascular.Types.Area AW_init
                "Starting value for wall cross-sectional area";
              outer parameter Cardiovascular.Types.Area ARef_init
                "Starting value of reference inner cross-sectional area";
              outer parameter Pressure pRef_init
                "Starting value of reference pressure";


              // discrete input Cardiovascular.Types.Area AW(start=AW_init, fixed=true)
              //   "Adaptable wall cross-sectional area";
              // discrete input Cardiovascular.Types.Area ARef(start=ARef_init, fixed=true)
              //   "Adaptable reference inner cross-sectional area";
              // discrete input Pressure pRef(start = pRef_init, fixed = true)
              //   "Adaptable reference pressure";
              // DISABLING THE ADAPTATION

              Cardiovascular.Types.Area AW=AW_init;
              Cardiovascular.Types.Area ARef=ARef_init;
              Pressure pRef=pRef_init;

              Cardiovascular.Types.Area A "Inner cross-sectional area";
              Volume VW "Wall volume";
              Volume VRef "Reference volume";
              Volume V(start=l*ARef_init, fixed=true) "Current volume";

              Pressure p "Wave-smoothed inner pressure";

              HydraulicResistanceOutput RWave annotation (Placement(
                    transformation(
                    extent={{-10,-10},{10,10}},
                    rotation=-90,
                    origin={0,-70})));

            equation
              VRef = ARef*l;
              V = A*l;
              VW = AW*l;

              RWave = (rho*(k - 3)*max(1.0, p)/3)^0.5/(A + AW/3);

              // For an unknown reason, this won't compile for the Abdolrazaghi tree:
              //   p = pRef * ((VW + 3 * V) / (VW + 3 * VRef)) ^ ((k - 3) / 3);
            //   p = pre(pRef) * ((pre(AW) * l + 3 * V) / (pre(AW) * l + 3 * pre(ARef) * l)) ^ ((k - 3) / 3);

              // DISABLING THE ADAPTATION
              p = pRef*((VW + 3*V)/(VW + 3*VRef))^((k - 3)/3);

              c.pressure = p;
              c.q = der(V);

              annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics));
            end AdaptableVesselsCore;

            model AdaptableArteries
              extends Cardiovascular.Icons.Arteries;
              extends Abstraction.AdaptableVessels;
              annotation (Icon(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}})));

            end AdaptableArteries;

            model AdaptableVeins
              extends Cardiovascular.Icons.Vessels;
              extends Abstraction.AdaptableVessels;
              annotation (Icon(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}})));

            end AdaptableVeins;

            model CoronaryVessels "Flow port for coronary vessels"
              extends Cardiovascular.Icons.Vessels;
              extends Auxiliary.BlockKinds.Port;
              import
                Cardiovascular.Model.Complex.Components.Auxiliary.RLC.Elements.*;
              import Physiolibrary.Types.Volume;

              input Real pM "Intramyocardial pressure";

              Volume V=Ca.V + Cm.V + Cv.V "Current volume";

              R Rv(R=200000000) annotation (Placement(transformation(extent={{
                        38,-10},{58,10}})));
              R Rm2(R=900000000) annotation (Placement(transformation(extent={{
                        6,-10},{26,10}})));
              R Rm1(R=900000000) annotation (Placement(transformation(extent={{
                        -26,-10},{-6,10}})));
              R Ra(R=700000000) annotation (Placement(transformation(extent={{-58,
                        -10},{-38,10}})));
              C Ca(V_init=6e-06, C(displayUnit="m3/Pa") = 3e-11) annotation (
                  Placement(transformation(extent={{-40,-40},{-20,-20}})));
              C Cv(V_init=10e-6, C=7e-10) annotation (Placement(transformation(
                      extent={{20,-40},{40,-20}})));
              C Cm(
                V_init=7e-6,
                pGround=pM,
                C=1.4e-09) annotation (Placement(transformation(extent={{-10,-40},
                        {10,-20}})));

            equation
              connect(cIn, Ra.cIn) annotation (Line(points={{-80,0},{-56,0}},
                    smooth=Smooth.None));
              connect(Ra.cOut, Rm1.cIn) annotation (Line(points={{-40,0},{-24,0}},
                    smooth=Smooth.None));
              connect(Rm1.cOut, Rm2.cIn)
                annotation (Line(points={{-8,0},{8,0}}, smooth=Smooth.None));
              connect(Rm2.cOut, Rv.cIn)
                annotation (Line(points={{24,0},{40,0}}, smooth=Smooth.None));
              connect(cOut, Rv.cOut)
                annotation (Line(points={{80,0},{56,0}}, smooth=Smooth.None));
              connect(Rm1.cIn, Ca.c) annotation (Line(points={{-24,0},{-32,0},{
                      -32,-25},{-30,-25}}, smooth=Smooth.None));
              connect(Rm2.cOut, Cv.c) annotation (Line(points={{24,0},{24,-25},
                      {30,-25}}, smooth=Smooth.None));
              connect(Rm1.cOut, Cm.c) annotation (Line(points={{-8,0},{-8,-25},
                      {0,-25}}, smooth=Smooth.None));

              annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics));
            end CoronaryVessels;

            model ConsumingCapillaries
              "Capillaries visualized as consuming oxygen"
              extends Physiolibrary.Icons.PerfusionOD;
              extends Abstraction.Capillaries;

            end ConsumingCapillaries;

            model OxygenatingCapillaries
              "Capillaries visualized as blood oxygenating"
              extends Physiolibrary.Icons.PerfusionDO;
              extends Abstraction.Capillaries;

            end OxygenatingCapillaries;
          end Vessels;

          package SystemicArteries "Various realizations of systemic arteries"
            package Abstraction "Common ancestors"
              partial model SystemicArteries
                "Common ancestor for all types of systemic arteries"
                extends Vessels.Abstraction.Vessels;
                import
                  Cardiovascular.Model.Complex.Components.Auxiliary.Connectors.*;

                parameter Boolean isAdaptable
                  "Whether the model supports adaptation";

                In cCannula "Location for connecting ECMO cannula" annotation (
                    Placement(transformation(
                      extent={{-10,-10},{10,10}},
                      rotation=60,
                      origin={-60,-12})));

                annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                        extent={{-100,-100},{100,100}}), graphics));
              end SystemicArteries;

              partial model SystemicArteries_Adapter
                "Adapter for non-adaptable versions of systemic arteries"
                extends Cardiovascular.Icons.Arteries;
                extends SystemicArteries(isAdaptable=false);
                import Cardiovascular.Types.*;
                import Physiolibrary.Types.*;

                // DISABLING THE ADAPTATION
              //   inner parameter Real k = 10
              //     "Fake stifnesss non-linearity parameter";
              //   inner parameter Cardiovascular.Types.Length l=1
              //     "Fake total arterial length";
              //   inner parameter Cardiovascular.Types.Area AW_init=1
              //     "Fake starting value of wall cross-sectional area";
              //   inner parameter Cardiovascular.Types.Area ARef_init=1
              //     "Fake starting value of reference inner cross-sectional area";
              //   inner parameter Pressure pRef_init = 1
              //     "Fake starting value of reference pressure";
              //
              //   Vessels.AdaptableVesselsCore core "Fake compliance core";

              end SystemicArteries_Adapter;
            end Abstraction;

            model Original_CircAdapt
              "Original systemic arteries from CircAdapt by Arts et al. (2004 - 2013)"
              extends Abstraction.SystemicArteries(isAdaptable=true);
              extends Vessels.AdaptableArteries(
                pRef_init=settings.initialization.SA_pRef,
                ARef_init=settings.initialization.SA_ARef,
                AW_init=settings.initialization.SA_AW,
                l=settings.initialization.SA_l,
                k=settings.initialization.SA_k);
              import Cardiovascular.Model.Complex.Environment.*;
              import Physiolibrary.Types.*;

              outer Environment.ComplexEnvironment settings
                "Everything is out there";

              Volume V_filling(start=0);

                Real q_filling;

              parameter Fraction speed_factor=10;

              parameter Volume V_init=300e-6;

              Physiolibrary.Hydraulic.Sources.UnlimitedPump volumeControl_(
                  useSolutionFlowInput=true);


            equation
              der(V_filling) = q_filling;
              q_filling/speed_factor = V_init - V_filling;
              // - der(V_filling);
                volumeControl_.solutionFlow = q_filling;
              connect(volumeControl_.q_out, cIn);
              // Homely component -> disabling vizualization, even for connection

              connect(cCannula, cIn) annotation (Line(
                  points={{-60,-12},{-40,-12},{-40,0},{-80,0}},
                  color={0,0,255},
                  smooth=Smooth.None));

              annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics), Icon(
                    coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                        {100,100}}), graphics={Text(
                      extent={{-52,52},{28,16}},
                      lineColor={0,128,0},
                      lineThickness=1,
                      fillColor={255,0,0},
                      fillPattern=FillPattern.Solid,
                      textStyle={TextStyle.Bold},
                      textString="Original (Arts)")}));
            end Original_CircAdapt;


            model Windkessel_Physiolibrary
              "Windkessel model of systemic arteries from Physiolibrary v2.3.1-alpha by Marek Matejak (2015)"
              extends Abstraction.SystemicArteries_Adapter;

              extends Auxiliary.RLC.Compounds.LpRCR(
                C=1.0500862061839e-08,
                L(displayUnit="mmHg.s2/ml") = 666611.937075,
                R(displayUnit="(mmHg.s)/ml") = 123456530.74629,
                Rp(displayUnit="(mmHg.s)/ml") = 666611.937075);
              import Physiolibrary.Types.*;
              Volume V_filling(start=0);

                Real q_filling;

              parameter Fraction speed_factor=10;

              parameter Volume V_init=300e-6;

              Physiolibrary.Hydraulic.Sources.UnlimitedPump volumeControl_(
                  useSolutionFlowInput=true);


            equation
              der(V_filling) = q_filling;
              q_filling/speed_factor = V_init - V_filling;
              // - der(V_filling);
                volumeControl_.solutionFlow = q_filling;
              connect(volumeControl_.q_out, cIn);
              // Homely component -> disabling vizualization, even for connection

              pInner = capacitor.c.pressure;

              connect(cIn, cCannula) annotation (Line(
                  points={{-80,0},{-40,0},{-40,-12},{-60,-12}},
                  color={0,0,255},
                  smooth=Smooth.None));

              annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics), Icon(graphics=
                     {Text(       extent={{-70,64},{52,4}},
                      lineColor={0,128,0},
                      lineThickness=1,
                      fillColor={255,0,0},
                      fillPattern=FillPattern.Solid,
                      textStyle={TextStyle.Bold},
                      textString="Windkessel (Physiolibrary)")}));
            end Windkessel_Physiolibrary;

            model Windkessel_Stergiopulos
              "Windkessel model of systemic arteries by Stergiopulos et al. (1999)"
              extends
                Model.Complex.Components.Main.SystemicArteries.Abstraction.SystemicArteries_Adapter;
              extends Model.Complex.Components.Auxiliary.RLC.Compounds.LpRCR(
                C=1.0275843589085e-08,
                L(displayUnit="mmHg.s2/ml") = 933256.711905,
                R(displayUnit="(mmHg.s)/ml") = 139988506.78575,
                Rp(displayUnit="(mmHg.s)/ml") = 7599376.082655);

            equation
              pInner = capacitor.c.pressure;

              connect(cIn, cCannula) annotation (Line(
                  points={{-80,0},{-40,0},{-40,-12},{-60,-12}},
                  color={0,0,255},
                  smooth=Smooth.None));

              annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics), Icon(graphics=
                     {Text(       extent={{-68,64},{46,8}},
                      lineColor={0,128,0},
                      lineThickness=1,
                      fillColor={255,0,0},
                      fillPattern=FillPattern.Solid,
                      textStyle={TextStyle.Bold},
                      textString="Windkessel (Stergiopulos)")}));
            end Windkessel_Stergiopulos;

            model Aorta_Ferrari "Model of aorta by Ferrari et al. (2005)"
              extends SystemicArteries.Abstraction.SystemicArteries_Adapter;
              import
                Cardiovascular.Model.Complex.Components.Auxiliary.RLC.Compounds.*;
              import
                Cardiovascular.Model.Complex.Components.Auxiliary.RLC.Elements.*;
              import
                Cardiovascular.Model.Complex.Components.Auxiliary.RLC.Tubes.*;
              import Cardiovascular.Types.*;
              import Physiolibrary.Types.Volume;

              outer Cardiovascular.Model.Complex.Environment.ComplexEnvironment
                settings "Everything is out there...";

              Volume V=ascendingAorta.V + aorticArch1.V + aorticArch2.V +
                  thoracicAorta1.V + thoracicAorta2.V + thoracicAorta3.V +
                  abdominalAorta1.V + abdominalAorta2.V + arms.V + leftBrain.V
                   + rightBrain.V + hepaticCirculation.V + rightKidney.V +
                  leftKidneyAndUpperMesenteric.V + legsAndLowerMesenteric.V
                "Current volume";

              TubeRLC_Ferrari ascendingAorta(
                l=0.04,
                r=0.01455,
                h=0.00163) annotation (Placement(transformation(extent={{-70,36},
                        {-50,56}})));
              TubeRLC_Ferrari aorticArch1(
                l=0.02,
                r=0.0112,
                h=0.00132) annotation (Placement(transformation(extent={{-44,56},
                        {-24,76}})));
              TubeRLC_Ferrari aorticArch2(
                l=0.039,
                r=0.0107,
                h=0.00127)
                annotation (Placement(transformation(extent={{4,52},{24,72}})));
              TubeRLC_Ferrari thoracicAorta1(
                l=0.052,
                r=0.00999,
                h=0.0012) annotation (Placement(transformation(extent={{14,24},
                        {34,44}})));
              TubeRLC_Ferrari thoracicAorta2(
                l=0.052,
                r=0.006675,
                h=0.0009) annotation (Placement(transformation(extent={{22,-8},
                        {42,12}})));
              TubeRLC_Ferrari thoracicAorta3(
                l=0.052,
                r=0.006525,
                h=0.00087) annotation (Placement(transformation(extent={{30,-36},
                        {50,-16}})));
              TubeRLC_Ferrari abdominalAorta1(
                l=0.053,
                r=0.0061,
                h=0.00084) annotation (Placement(transformation(extent={{38,-64},
                        {58,-44}})));
              TubeRLC_Ferrari abdominalAorta2(
                l=0.106,
                r=0.00564,
                h=0.0008) annotation (Placement(transformation(extent={{44,-88},
                        {64,-68}})));
              RRcC arms(
                R=18200e5/4,
                Rc=770e5/4,
                C=9.685e-10) annotation (Placement(transformation(extent={{-28,
                        88},{-8,108}})));
              RRcC leftBrain(
                R=72000e5/4,
                Rc=1000e5/4,
                C=5.188e-10) annotation (Placement(transformation(extent={{-6,
                        78},{14,98}})));
              RRcC rightBrain(
                R=10600e5/4,
                Rc=380e5/4,
                C=1.3089e-10) annotation (Placement(transformation(extent={{16,
                        74},{36,94}})));
              R intercostal1(R=190000e5/4) annotation (Placement(transformation(
                      extent={{30,44},{50,64}})));
              R intercostal2(R=190000e5/4) annotation (Placement(transformation(
                      extent={{42,24},{62,44}})));
              R intercostal3(R=190000e5/4)
                annotation (Placement(transformation(extent={{46,2},{66,22}})));
              R intercostal4(R=190000e5/4) annotation (Placement(transformation(
                      extent={{48,-22},{68,-2}})));
              RC hepaticCirculation(R=11000e5/4, C=1.79e-10) annotation (
                  Placement(transformation(extent={{56,-44},{76,-24}})));
              RC rightKidney(R=11000e5/4, C=3.29e-11) annotation (Placement(
                    transformation(extent={{64,-68},{84,-48}})));
              RC leftKidneyAndUpperMesenteric(R=5200e5/4, C=2.11e-10)
                annotation (Placement(transformation(extent={{74,-90},{94,-70}})));
              RRcC legsAndLowerMesenteric(
                R=7780e5/4,
                Rc=415e5/4,
                C=1.25e-11) annotation (Placement(transformation(extent={{68,-112},
                        {88,-92}})));

            equation
              pInner = aorticArch2.cIn.pressure;

              if settings.supports.ECMO_isEnabled then
                if settings.supports.ECMO_cannulaPlacement == CannulaPlacement.ascendingAorta then
                  connect(cCannula, ascendingAorta.cIn);
                elseif settings.supports.ECMO_cannulaPlacement ==
                    CannulaPlacement.aorticArch1 then
                  connect(cCannula, aorticArch1.cIn);
                elseif settings.supports.ECMO_cannulaPlacement ==
                    CannulaPlacement.aorticArch2 then
                  connect(cCannula, aorticArch2.cIn);
                elseif settings.supports.ECMO_cannulaPlacement ==
                    CannulaPlacement.thoracicAorta1 then
                  connect(cCannula, thoracicAorta1.cIn);
                elseif settings.supports.ECMO_cannulaPlacement ==
                    CannulaPlacement.thoracicAorta2 then
                  connect(cCannula, thoracicAorta2.cIn);
                else
                  connect(cCannula, cIn);
                end if;
              else
                connect(cCannula, cIn);
              end if;

              connect(cIn, ascendingAorta.cIn) annotation (Line(
                  points={{-80,0},{-74,0},{-74,46},{-68,46}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(ascendingAorta.cOut, aorticArch1.cIn) annotation (Line(
                  points={{-52,46},{-48,46},{-48,66},{-42,66}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(aorticArch1.cOut, aorticArch2.cIn) annotation (Line(
                  points={{-26,66},{-4,66},{-4,62},{6,62}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(aorticArch2.cOut, thoracicAorta1.cIn) annotation (Line(
                  points={{22,62},{20,62},{20,34},{16,34}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(thoracicAorta1.cOut, thoracicAorta2.cIn) annotation (Line(
                  points={{32,34},{28,34},{28,2},{24,2}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(thoracicAorta2.cOut, thoracicAorta3.cIn) annotation (Line(
                  points={{40,2},{36,2},{36,-26},{32,-26}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(thoracicAorta3.cOut, abdominalAorta1.cIn) annotation (
                  Line(
                  points={{48,-26},{44,-26},{44,-54},{40,-54}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(abdominalAorta1.cOut, abdominalAorta2.cIn) annotation (
                  Line(
                  points={{56,-54},{52,-54},{52,-78},{46,-78}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(intercostal1.cIn, aorticArch2.cIn) annotation (Line(
                  points={{32,54},{20,54},{20,62},{6,62}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(thoracicAorta1.cIn, intercostal2.cIn) annotation (Line(
                  points={{16,34},{44,34}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(thoracicAorta2.cIn, intercostal3.cIn) annotation (Line(
                  points={{24,2},{36,2},{36,12},{48,12}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(intercostal4.cIn, thoracicAorta3.cIn) annotation (Line(
                  points={{50,-12},{42,-12},{42,-26},{32,-26}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(aorticArch1.cOut, arms.cIn) annotation (Line(
                  points={{-26,66},{-18,66},{-18,98},{-26,98}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(aorticArch1.cOut, leftBrain.cIn) annotation (Line(
                  points={{-26,66},{-14,66},{-14,88},{-4,88}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(aorticArch1.cOut, rightBrain.cIn) annotation (Line(
                  points={{-26,66},{-10,66},{-10,84},{18,84}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(abdominalAorta1.cIn, hepaticCirculation.cIn) annotation (
                  Line(
                  points={{40,-54},{48,-54},{48,-34},{58,-34}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(abdominalAorta2.cIn, rightKidney.cIn) annotation (Line(
                  points={{46,-78},{56,-78},{56,-58},{66,-58}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(abdominalAorta2.cIn, leftKidneyAndUpperMesenteric.cIn)
                annotation (Line(
                  points={{46,-78},{60,-78},{60,-80},{76,-80}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(abdominalAorta2.cOut, legsAndLowerMesenteric.cIn)
                annotation (Line(
                  points={{62,-78},{66,-78},{66,-102},{70,-102}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(cOut, intercostal4.cOut) annotation (Line(
                  points={{80,0},{74,0},{74,-12},{66,-12}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(hepaticCirculation.cOut, cOut) annotation (Line(
                  points={{74,-34},{74,0},{80,0}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(rightKidney.cOut, cOut) annotation (Line(
                  points={{82,-58},{82,0},{80,0}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(leftKidneyAndUpperMesenteric.cOut, cOut) annotation (Line(
                  points={{92,-80},{86,-80},{86,0},{80,0}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(legsAndLowerMesenteric.cOut, cOut) annotation (Line(
                  points={{86,-102},{80,-102},{80,0}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(intercostal3.cOut, cOut) annotation (Line(
                  points={{64,12},{68,12},{68,0},{80,0}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(intercostal2.cOut, cOut) annotation (Line(
                  points={{60,34},{68,34},{68,0},{80,0}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(intercostal1.cOut, cOut) annotation (Line(
                  points={{48,54},{62,54},{62,0},{80,0}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(rightBrain.cOut, cOut) annotation (Line(
                  points={{34,84},{50,84},{50,0},{80,0}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(leftBrain.cOut, cOut) annotation (Line(
                  points={{12,88},{46,88},{46,0},{80,0}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(arms.cOut, cOut) annotation (Line(
                  points={{-10,98},{42,98},{42,0},{80,0}},
                  color={0,0,255},
                  smooth=Smooth.None));

              annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics), Icon(graphics=
                     {Text(       extent={{-56,56},{28,10}},
                      lineColor={0,128,0},
                      lineThickness=1,
                      fillColor={255,0,0},
                      fillPattern=FillPattern.Solid,
                      textStyle={TextStyle.Bold},
                      textString="Aorta (Ferrari)")}));
            end Aorta_Ferrari;

            model Tree_Abdolrazaghi
              "Model of systemic arterial tree by Abdolrazaghi et al. (2010)"
              extends Abstraction.SystemicArteries_Adapter;
              import
                Cardiovascular.Model.Complex.Components.Auxiliary.RLC.Compounds.*;
              import Cardiovascular.Types.*;
              import Physiolibrary.Types.Volume;

              outer Cardiovascular.Model.Complex.Environment.ComplexEnvironment
                settings "Everything is out there...";

              Volume V=ascendingAorta.V + aorticArch1.V + aorticArch2.V +
                  thoracicAorta1.V + thoracicAorta2.V + abdominalAorta1.V +
                  abdominalAorta2And3.V + abdominalAorta4.V + abdominalAorta5.V
                   + hepatic.V + gastric.V + splenetic.V + leftRenal.V +
                  rightRenal.V + rightCommonCarotid.V + rightInteriorCarotid.V
                   + rightExteriorCarotid.V + leftCommonCarotid.V +
                  leftInteriorCarotid.V + leftExteriorCarotid.V +
                  leftSubclavian.V + rightSubclavian.V + leftCommonIlliac.V +
                  leftExternalIlliac.V + leftFemoral.V + rightCommonIlliac.V +
                  rightExternalIlliac.V + rightFemoral.V + superiorMesenteric.V
                   + inferiorMesenteric.V + arterioles.V "Current volume";

              CRL arterioles(
                C=1.4001e-08,
                R=72000000,
                L=1000000) annotation (Placement(transformation(
                    extent={{-10,-10},{10,10}},
                    rotation=180,
                    origin={-58,-80})));
              CLR rightFemoral(
                C=1.8126e-10,
                L=30545610,
                R=87740000) annotation (Placement(transformation(extent={{-16,-100},
                        {-36,-80}})));
              CLR leftFemoral(
                C=1.8126e-10,
                L=30545610,
                R=87740000) annotation (Placement(transformation(extent={{-16,-80},
                        {-36,-60}})));
              CLR rightExternalIlliac(
                C=1.0483e-10,
                L=6504400,
                R=12230000) annotation (Placement(transformation(extent={{2,-100},
                        {-18,-80}})));
              CLR leftExternalIlliac(
                C=1.0483e-10,
                L=6504400,
                R=12245000) annotation (Placement(transformation(extent={{2,-80},
                        {-18,-60}})));
              CRL rightCommonIlliac(
                C=5.6726e-11,
                R=2867000,
                L=1980970) annotation (Placement(transformation(
                    extent={{-10,-10},{10,10}},
                    rotation=180,
                    origin={10,-90})));
              CRL leftCommonIlliac(
                C=5.6726e-11,
                R=2867000,
                L=1980970) annotation (Placement(transformation(
                    extent={{-10,-10},{10,10}},
                    rotation=180,
                    origin={10,-70})));
              CLpRR abdominalAorta5(
                C=2.5472e-11,
                L=164820,
                R=121960,
                Rp=519650) annotation (Placement(transformation(extent={{44,-90},
                        {24,-70}})));
              CLpRR abdominalAorta4(
                C=3.2471e-10,
                L=1404350,
                R=835260,
                Rp=3558940) annotation (Placement(transformation(
                    extent={{10,-10},{-10,10}},
                    rotation=90,
                    origin={90,-50})));
              CLpRR abdominalAorta2And3(
                C=6.3585e-11,
                L=247600,
                R=137610,
                Rp=586340) annotation (Placement(transformation(
                    extent={{10,-10},{-10,10}},
                    rotation=90,
                    origin={90,-26})));
              CLpRR abdominalAorta1(
                C=1.5739e-10,
                L=634810,
                R=341340,
                Rp=1454400) annotation (Placement(transformation(
                    extent={{10,-10},{-10,10}},
                    rotation=90,
                    origin={90,-2})));
              CRLpR ascendingAorta(
                C=9.1788e-10,
                R=7540,
                L=82500,
                Rp=32550) annotation (Placement(transformation(extent={{0,80},{
                        20,100}})));
              CLpRR thoracicAorta1(
                C=5.5664e-10,
                L=231750,
                R=46370,
                Rp=197570) annotation (Placement(transformation(extent={{58,80},
                        {78,100}})));
              CLpRR thoracicAorta2(
                C=3.7662e-10,
                L=1017300,
                R=446730,
                Rp=1903460) annotation (Placement(transformation(extent={{78,80},
                        {98,100}})));
              CLR inferiorMesenteric(
                C=5.6082e-12,
                L=9033880,
                R=1662000000) annotation (Placement(transformation(extent={{44,
                        -64},{24,-44}})));
              CRL superiorMesenteric(
                C=8.2877e-11,
                R=192000000,
                L=1442180) annotation (Placement(transformation(extent={{44,-44},
                        {24,-24}})));
              CRL leftRenal(
                C=1.2496e-11,
                R=126000000,
                L=2189510) annotation (Placement(transformation(extent={{68,-12},
                        {48,8}})));
              CRL rightRenal(
                C=1.2496e-11,
                R=126000000,
                L=2189510) annotation (Placement(transformation(extent={{68,-32},
                        {48,-12}})));
              CLpRR splenetic(
                C=2.857e-11,
                L=3853180,
                R=254000000,
                Rp=1117000000) annotation (Placement(transformation(extent={{80,
                        14},{60,34}})));
              CLpRR gastric(
                C=1.0835e-11,
                L=10135800,
                R=254000000,
                Rp=1117000000) annotation (Placement(transformation(extent={{80,
                        34},{60,54}})));
              CLpRR hepatic(
                C=1.688e-11,
                L=6033700,
                R=254000000,
                Rp=1117000000) annotation (Placement(transformation(extent={{80,
                        54},{60,74}})));
              CLR leftSubclavian(
                C=4.8542e-10,
                L=12018410,
                R=14118000) annotation (Placement(transformation(extent={{-16,-54},
                        {-36,-34}})));
              CLR leftCommonCarotid(
                C=1.9692e-10,
                L=7027560,
                R=9890000) annotation (Placement(transformation(extent={{-10,-30},
                        {-30,-10}})));
              CRL leftInteriorCarotid(
                C=2.5538e-11,
                R=159800000,
                L=25984280) annotation (Placement(transformation(extent={{-32,-40},
                        {-52,-20}})));
              CLR leftExteriorCarotid(
                C=2.7517e-11,
                L=26131920,
                R=160720000) annotation (Placement(transformation(extent={{-32,
                        -20},{-52,0}})));
              CLR rightSubclavian(
                C=4.8904e-10,
                L=11958990,
                R=5349000) annotation (Placement(transformation(extent={{-14,4},
                        {-34,24}})));
              CLR rightCommonCarotid(
                C=1.6757e-10,
                L=5980180,
                R=3153000) annotation (Placement(transformation(extent={{-6,30},
                        {-26,50}})));
              CLR rightExteriorCarotid(
                C=2.7517e-11,
                L=26131920,
                R=160800000) annotation (Placement(transformation(extent={{-26,
                        20},{-46,40}})));
              CLR rightInteriorCarotid(
                C=2.5538e-11,
                L=25984280,
                R=159800000) annotation (Placement(transformation(extent={{-26,
                        38},{-46,58}})));
              CLpRR aorticArch2(
                C=4.8919e-10,
                L=151820,
                R=26530,
                Rp=113050) annotation (Placement(transformation(extent={{40,80},
                        {60,100}})));
              CRLpR aorticArch1(
                C=2.6259e-10,
                R=11330,
                L=71060,
                Rp=48290) annotation (Placement(transformation(extent={{20,80},
                        {40,100}})));

            equation
              pInner = aorticArch2.cIn.pressure;

              if settings.supports.ECMO_isEnabled then
                if settings.supports.ECMO_cannulaPlacement == CannulaPlacement.ascendingAorta then
                  connect(cCannula, ascendingAorta.cIn);
                elseif settings.supports.ECMO_cannulaPlacement ==
                    CannulaPlacement.aorticArch1 then
                  connect(cCannula, aorticArch1.cIn);
                elseif settings.supports.ECMO_cannulaPlacement ==
                    CannulaPlacement.aorticArch2 then
                  connect(cCannula, aorticArch2.cIn);
                elseif settings.supports.ECMO_cannulaPlacement ==
                    CannulaPlacement.thoracicAorta1 then
                  connect(cCannula, thoracicAorta1.cIn);
                elseif settings.supports.ECMO_cannulaPlacement ==
                    CannulaPlacement.thoracicAorta2 then
                  connect(cCannula, thoracicAorta2.cIn);
                else
                  connect(cCannula, cIn);
                end if;
              else
                connect(cCannula, cIn);
              end if;

              connect(arterioles.cIn, rightFemoral.cOut) annotation (Line(
                  points={{-50,-80},{-42,-80},{-42,-90},{-34,-90}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(arterioles.cIn, leftFemoral.cOut) annotation (Line(
                  points={{-50,-80},{-42,-80},{-42,-70},{-34,-70}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(rightFemoral.cIn, rightExternalIlliac.cOut) annotation (
                  Line(
                  points={{-18,-90},{-16,-90}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(leftFemoral.cIn, leftExternalIlliac.cOut) annotation (
                  Line(
                  points={{-18,-70},{-16,-70}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(rightExternalIlliac.cIn, rightCommonIlliac.cOut)
                annotation (Line(
                  points={{0,-90},{2,-90}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(leftExternalIlliac.cIn, leftCommonIlliac.cOut)
                annotation (Line(
                  points={{0,-70},{2,-70}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(leftCommonIlliac.cIn, abdominalAorta5.cOut) annotation (
                  Line(
                  points={{18,-70},{22,-70},{22,-80},{26,-80}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(rightCommonIlliac.cIn, abdominalAorta5.cOut) annotation (
                  Line(
                  points={{18,-90},{22,-90},{22,-80},{26,-80}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(abdominalAorta5.cIn, abdominalAorta4.cOut) annotation (
                  Line(
                  points={{42,-80},{66,-80},{66,-58},{90,-58}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(abdominalAorta4.cIn, abdominalAorta2And3.cOut)
                annotation (Line(
                  points={{90,-42},{90,-34}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(abdominalAorta2And3.cIn, abdominalAorta1.cOut)
                annotation (Line(
                  points={{90,-18},{90,-10}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(thoracicAorta1.cOut, thoracicAorta2.cIn) annotation (Line(
                  points={{76,90},{80,90}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(thoracicAorta2.cOut, abdominalAorta1.cIn) annotation (
                  Line(
                  points={{96,90},{94,90},{94,6},{90,6}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(abdominalAorta4.cOut, inferiorMesenteric.cIn) annotation (
                 Line(
                  points={{90,-58},{66,-58},{66,-54},{42,-54}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(abdominalAorta2And3.cOut, superiorMesenteric.cIn)
                annotation (Line(
                  points={{90,-34},{42,-34}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(abdominalAorta1.cOut, leftRenal.cIn) annotation (Line(
                  points={{90,-10},{78,-10},{78,-2},{66,-2}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(abdominalAorta1.cOut, rightRenal.cIn) annotation (Line(
                  points={{90,-10},{78,-10},{78,-22},{66,-22}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(arterioles.cIn, inferiorMesenteric.cOut) annotation (Line(
                  points={{-50,-80},{-12,-80},{-12,-54},{26,-54}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(arterioles.cIn, superiorMesenteric.cOut) annotation (Line(
                  points={{-50,-80},{-12,-80},{-12,-34},{26,-34}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(arterioles.cIn, rightRenal.cOut) annotation (Line(
                  points={{-50,-80},{0,-80},{0,-22},{50,-22}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(arterioles.cIn, leftRenal.cOut) annotation (Line(
                  points={{-50,-80},{0,-80},{0,-2},{50,-2}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(thoracicAorta2.cOut, hepatic.cIn) annotation (Line(
                  points={{96,90},{88,90},{88,64},{78,64}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(thoracicAorta2.cOut, gastric.cIn) annotation (Line(
                  points={{96,90},{88,90},{88,44},{78,44}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(thoracicAorta2.cOut, splenetic.cIn) annotation (Line(
                  points={{96,90},{88,90},{88,24},{78,24}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(arterioles.cIn, splenetic.cOut) annotation (Line(
                  points={{-50,-80},{8,-80},{8,24},{62,24}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(arterioles.cIn, gastric.cOut) annotation (Line(
                  points={{-50,-80},{6,-80},{6,44},{62,44}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(arterioles.cIn, hepatic.cOut) annotation (Line(
                  points={{-50,-80},{6,-80},{6,64},{62,64}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(leftCommonCarotid.cOut, leftInteriorCarotid.cIn)
                annotation (Line(
                  points={{-28,-20},{-30,-20},{-30,-30},{-34,-30}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(leftCommonCarotid.cOut, leftExteriorCarotid.cIn)
                annotation (Line(
                  points={{-28,-20},{-32,-20},{-32,-10},{-34,-10}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(arterioles.cIn, leftSubclavian.cOut) annotation (Line(
                  points={{-50,-80},{-42,-80},{-42,-44},{-34,-44}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(arterioles.cIn, leftInteriorCarotid.cOut) annotation (
                  Line(
                  points={{-50,-80},{-50,-30}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(arterioles.cIn, leftExteriorCarotid.cOut) annotation (
                  Line(
                  points={{-50,-80},{-50,-10}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(rightCommonCarotid.cOut, rightExteriorCarotid.cIn)
                annotation (Line(
                  points={{-24,40},{-26,40},{-26,30},{-28,30}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(rightCommonCarotid.cOut, rightInteriorCarotid.cIn)
                annotation (Line(
                  points={{-24,40},{-26,40},{-26,48},{-28,48}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(arterioles.cIn, rightSubclavian.cOut) annotation (Line(
                  points={{-50,-80},{-42,-80},{-42,14},{-32,14}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(arterioles.cIn, rightExteriorCarotid.cOut) annotation (
                  Line(
                  points={{-50,-80},{-48,-80},{-48,30},{-44,30}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(arterioles.cIn, rightInteriorCarotid.cOut) annotation (
                  Line(
                  points={{-50,-80},{-48,-80},{-48,48},{-44,48}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(thoracicAorta1.cIn, aorticArch2.cOut) annotation (Line(
                  points={{60,90},{58,90}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(arterioles.cOut, cOut) annotation (Line(
                  points={{-66,-80},{6,-80},{6,0},{80,0}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(ascendingAorta.cIn, cIn) annotation (Line(
                  points={{2,90},{-30,90},{-30,0},{-80,0}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(ascendingAorta.cOut, aorticArch1.cIn) annotation (Line(
                  points={{18,90},{22,90}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(aorticArch2.cIn, aorticArch1.cOut) annotation (Line(
                  points={{42,90},{38,90}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(aorticArch1.cOut, leftCommonCarotid.cIn) annotation (Line(
                  points={{38,90},{14,90},{14,-20},{-12,-20}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(aorticArch1.cOut, leftSubclavian.cIn) annotation (Line(
                  points={{38,90},{10,90},{10,-44},{-18,-44}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(ascendingAorta.cOut, rightSubclavian.cIn) annotation (
                  Line(
                  points={{18,90},{2,90},{2,14},{-16,14}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(ascendingAorta.cOut, rightCommonCarotid.cIn) annotation (
                  Line(
                  points={{18,90},{6,90},{6,40},{-8,40}},
                  color={0,0,255},
                  smooth=Smooth.None));

              annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics), Icon(graphics=
                     {Text(       extent={{-60,50},{36,12}},
                      lineColor={0,128,0},
                      lineThickness=1,
                      fillColor={255,0,0},
                      fillPattern=FillPattern.Solid,
                      textStyle={TextStyle.Bold},
                      textString="Tree (Abdolrazaghi)")}));
            end Tree_Abdolrazaghi;

            model ComplexTree_Derived "Derived arterial tree"
              extends SystemicArteries.Abstraction.SystemicArteries_Adapter;
              import
                Cardiovascular.Model.Complex.Components.Auxiliary.RLC.Tubes.*;
              import Cardiovascular.Types.*;
              import Physiolibrary.Types.*;

              outer Cardiovascular.Model.Complex.Environment.ComplexEnvironment
                settings "Everything is out there...";

              inner parameter Fraction arterialStiffnessScale=settings.condition.
                  _DT_arterialStiffnessScale
                "Scaling coefficient for arterial stiffness";
              inner parameter Cardiovascular.Types.Length cannulaOuterDiameter=
                  settings.supports._DT_ECMO_cannulaOuterDiameter
                "Outer diameter of ECMO cannula";
              inner parameter Cardiovascular.Types.Length cannulaDepth=settings.supports.
                  _DT_ECMO_cannulaDepth "Insertion depth of ECMO cannula";
              inner parameter Boolean enableIABP=settings.supports.
                  _DT_IABP_isEnabled "Whether IABP is implanted";
              inner parameter Time tDeflation=settings.supports.
                  _DT_IABP_deflationTime
                "Time of IABP deflation with respect to start of the cardiac cycle";
              inner parameter Time tInflation=settings.supports.
                  _DT_IABP_inflationTime
                "Time of IABP inflation with respect to start of the cardiac cycle";

              inner Time cycleDuration=settings.condition.cycleDuration
                "Duration of cardiac cycle";

              parameter Fraction aorticArchStenosisRatio=settings.condition.
                  _DT_aorticArchStenosisRatio
                "Ratio of stenotic narrowing in aortic arch segments";
              parameter Cardiovascular.Types.CannulaPlacement cannulaPlacement=
                  settings.supports.ECMO_cannulaPlacement
                "Location of inserted ECMO cannula";
              parameter Boolean enableECMO=settings.supports.ECMO_isEnabled
                "Whether ECMO is connected";

              Volume V=ascendingAorta.V + aorticArch1.V + leftSubclavian1.V +
                  leftCommonCarotid1.V + aorticArch2.V + brachiocephalic.V +
                  leftInternalMammary.V + leftSubclavian2.V + leftVertebral.V
                   + leftCommonCarotid2.V + thoracicAorta1.V +
                  rightCommonCarotid1.V + rightVertebral.V + rightSubclavian.V
                   + righInternalMammary.V + leftCostocervical.V +
                  leftAxilliary1.V + leftSuprascapular.V + leftThyrocervical.V
                   + leftCommonCarotid3.V + thoracicAorta2.V +
                  rightCommonCarotid2.V + rightThyrocervical.V +
                  rightSuprascapular.V + rightAxilliary1.V + rightCostocervical.V
                   + leftThoracoacrominal.V + leftAxilliary2.V +
                  leftCircumflexScapular.V + leftSubscapular.V +
                  leftInternalCarotid1.V + leftExternalCarotid.V +
                  leftSuperiorThyroid.V + thoracicAorta3.V +
                  rightSuperiorThyroid.V + rightExternalCarotid.V +
                  rightInternalCarotid1.V + rightSubscapular.V +
                  rightCircumflexScapular.V + rightAxilliary2.V +
                  rightThoracoacrominal.V + leftBrachial1.V + leftLingual.V +
                  leftInternalCarotid2.V + leftFacial.V + leftMiddleCerebral.V
                   + leftCerebral.V + leftOpthalmic.V + coeliac.V +
                  abdominalAorta1.V + rightOpthalmic.V + rightCerebral.V +
                  rightMiddleCerebral.V + rightFacial.V + rightInternalCarotid2.V
                   + rightLingual.V + rightBrachial1.V + leftProfundaBrachi.V
                   + leftBrachial2.V + leftInternalCarotid3.V + gastric1.V +
                  splenic.V + hepatic.V + renal.V + abdominalAorta2.V +
                  superiorMesenteric.V + gastric2.V + rightInternalCarotid3.V
                   + rightBrachial2.V + rightProfundaBrachi.V + leftBrachial3.V
                   + leftSuperiorUlnarCollateral.V + leftSuperficialTemporal.V
                   + leftMaxilliary.V + abdominalAorta3.V + rightMaxilliary.V
                   + rightSuperficialTemporal.V + rightSuperiorUlnarCollateral.V
                   + rightBrachial3.V + leftInferiorUlnarCollateral.V +
                  leftBrachial4.V + leftCommonIlliac.V + inferiorMesenteric.V
                   + rightCommonIlliac.V + rightBrachial4.V +
                  rightInferiorUlnarCollateral.V + leftUlnar1.V + leftRadial1.V
                   + leftExternalIlliac1.V + leftInternalIlliac.V +
                  rightInternalIlliac.V + rightExternalIlliac1.V + rightRadial1.V
                   + rightUlnar1.V + leftUlnar2.V + leftInterossea.V +
                  leftRadial2.V + leftExternalIlliac2.V + rightExternalIlliac2.V
                   + rightRadial2.V + rightInterossea.V + rightUlnar2.V +
                  leftUlnar3.V + leftFemoral1.V + leftProfundis.V +
                  rightProfundis.V + rightFemoral1.V + rightUlnar3.V +
                  leftFemoral2.V + rightFemoral2.V + leftPopliteal1.V +
                  rightPopliteal1.V + leftPopliteal2.V + rightPopliteal2.V +
                  leftAnteriorTibial1.V + leftPosteriorTibial1.V +
                  rightPosteriorTibial1.V + rightAnteriorTibial1.V +
                  leftAnteriorTibial2.V + leftPeroneal1.V +
                  leftPosteriorTibial2.V + rightPosteriorTibial2.V +
                  rightPeroneal1.V + rightAnteriorTibial2.V +
                  leftAnteriorTibial3.V + leftPeroneal2.V + rightPeroneal2.V +
                  rightAnteriorTibial3.V "Current volume";

              Volume V_filling(start=0);

                Real q_filling;

              parameter Fraction speed_factor=5;

              parameter Volume V_init=270e-6;

              Physiolibrary.Hydraulic.Sources.UnlimitedPump volumeControl_(
                  useSolutionFlowInput=true);

              TubeRLC_Derived ascendingAorta(
                isCannulated=enableECMO and cannulaPlacement ==
                    CannulaPlacement.ascendingAorta,
                l=0.04,
                r=0.0145,
                h=0.00163,
                E=4e5) annotation (Placement(transformation(extent={{-64,52},{-68,
                        56}})));

              TubeRLC_Derived aorticArch1(
                isCannulated=enableECMO and cannulaPlacement ==
                    CannulaPlacement.aorticArch1,
                l=2e-2,
                r=1.12e-2*(1 - aorticArchStenosisRatio),
                h=0.132e-2 + 1.12e-2*aorticArchStenosisRatio,
                E=4e5) annotation (Placement(transformation(extent={{-62,54},{-66,
                        58}})));

              TubeRLC_Derived leftSubclavian1(
                isBranching=true,
                l=3.4e-2,
                r=0.42e-2,
                h=0.067e-2,
                E=4e5) annotation (Placement(transformation(extent={{-52,60},{-56,
                        64}})));

              TubeRLC_Derived leftCommonCarotid1(
                isBranching=true,
                l=8.9e-2,
                r=0.37e-2,
                h=0.063e-2,
                E=4e5) annotation (Placement(transformation(extent={{-52,66},{-48,
                        70}})));

              TubeRLC_Derived aorticArch2(
                isCannulated=enableECMO and cannulaPlacement ==
                    CannulaPlacement.aorticArch2,
                isBranching=true,
                l=3.9e-2,
                r=1.07e-2*(1 - aorticArchStenosisRatio),
                h=0.127e-2 + 1.07e-2*aorticArchStenosisRatio,
                E=4e5) annotation (Placement(transformation(
                    extent={{-2,-2},{2,2}},
                    rotation=90,
                    origin={-58,56})));

              TubeRLC_Derived brachiocephalic(
                isBranching=true,
                l=3.4e-2,
                r=0.62e-2,
                h=0.086e-2,
                E=4e5) annotation (Placement(transformation(extent={{-64,60},{-60,
                        64}})));

              TubeRLC_Derived leftInternalMammary(
                l=15e-2,
                isBranching=true,
                r=0.1e-2,
                h=0.03e-2,
                E=8e5) annotation (Placement(transformation(extent={{-48,58},{-44,
                        62}})));
              TubeRLC_Derived leftSubclavian2(
                isBranching=true,
                l=6.8e-2,
                r=0.4e-2,
                h=0.066e-2,
                E=4e5) annotation (Placement(transformation(extent={{-42,62},{-46,
                        66}})));

              TubeRLC_Derived leftVertebral(
                l=14.8e-2,
                isBranching=true,
                r=0.19e-2,
                h=0.045e-2,
                E=8e5) annotation (Placement(transformation(extent={{-48,56},{-44,
                        60}})));
              TubeRLC_Derived leftCommonCarotid2(
                l=8.9e-2,
                r=0.37e-2,
                h=0.063e-2,
                E=4e5) annotation (Placement(transformation(extent={{-52,68},{-48,
                        72}})));

              TubeRLC_Derived_IABP thoracicAorta1(
                isCannulated=enableECMO and cannulaPlacement ==
                    CannulaPlacement.thoracicAorta1,
                useIABP2=true,
                l=5.2e-2,
                r=1e-2,
                h=0.12e-2,
                E=4e5) annotation (Placement(transformation(extent={{-60,50},{-56,
                        54}})));

              TubeRLC_Derived rightCommonCarotid1(
                isBranching=true,
                l=8.9e-2,
                r=0.37e-2,
                h=0.063e-2,
                E=4e5) annotation (Placement(transformation(extent={{-68,68},{-64,
                        72}})));

              TubeRLC_Derived rightVertebral(
                l=14.8e-2,
                isBranching=true,
                r=0.19e-2,
                h=0.045e-2,
                E=8e5) annotation (Placement(transformation(extent={{-80,58},{-76,
                        62}})));
              TubeRLC_Derived rightSubclavian(
                isBranching=true,
                l=6.8e-2,
                r=0.4e-2,
                h=0.066e-2,
                E=4e5) annotation (Placement(transformation(extent={{-82,56},{-78,
                        60}})));

              TubeRLC_Derived righInternalMammary(
                l=15e-2,
                isBranching=true,
                r=0.1e-2,
                h=0.03e-2,
                E=8e5) annotation (Placement(transformation(extent={{-80,54},{-76,
                        58}})));
              TubeRLC_Derived leftCostocervical(
                l=5e-2,
                isBranching=true,
                r=0.1e-2,
                h=0.03e-2,
                E=8e5) annotation (Placement(transformation(extent={{-42,64},{-38,
                        68}})));
              TubeRLC_Derived leftAxilliary1(
                isBranching=true,
                l=6.1e-2,
                r=0.36e-2,
                h=0.062e-2,
                E=4e5) annotation (Placement(transformation(extent={{-32,62},{-36,
                        66}})));

              TubeRLC_Derived leftSuprascapular(
                l=10e-2,
                isBranching=true,
                r=0.2e-2,
                h=0.052e-2,
                E=8e5) annotation (Placement(transformation(extent={{-42,66},{-38,
                        70}})));
              TubeRLC_Derived leftThyrocervical(
                l=5e-2,
                isBranching=true,
                r=0.1e-2,
                h=0.03e-2,
                E=8e5) annotation (Placement(transformation(extent={{-42,68},{-38,
                        72}})));
              TubeRLC_Derived leftCommonCarotid3(
                l=3.1e-2,
                r=0.37e-2,
                h=0.063e-2,
                E=4e5) annotation (Placement(transformation(extent={{-52,70},{-48,
                        74}})));

              TubeRLC_Derived_IABP thoracicAorta2(
                isCannulated=enableECMO and cannulaPlacement ==
                    CannulaPlacement.thoracicAorta2,
                l=5.2e-2,
                r=0.95e-2,
                h=0.116e-2,
                E=4e5) annotation (Placement(transformation(extent={{-60,48},{-56,
                        52}})));

              TubeRLC_Derived rightCommonCarotid2(
                l=8.9e-2,
                r=0.37e-2,
                h=0.063e-2,
                E=4e5) annotation (Placement(transformation(extent={{-68,70},{-64,
                        74}})));

              TubeRLC_Derived rightThyrocervical(
                l=5e-2,
                isBranching=true,
                r=0.1e-2,
                h=0.03e-2,
                E=8e5) annotation (Placement(transformation(extent={{-86,60},{-82,
                        64}})));
              TubeRLC_Derived rightSuprascapular(
                l=10e-2,
                isBranching=true,
                r=0.2e-2,
                h=0.052e-2,
                E=8e5) annotation (Placement(transformation(extent={{-86,62},{-82,
                        66}})));
              TubeRLC_Derived rightAxilliary1(
                isBranching=true,
                l=6.1e-2,
                r=0.36e-2,
                h=0.062e-2,
                E=4e5) annotation (Placement(transformation(extent={{-88,56},{-84,
                        60}})));

              TubeRLC_Derived rightCostocervical(
                l=5e-2,
                isBranching=true,
                r=0.1e-2,
                h=0.03e-2,
                E=8e5) annotation (Placement(transformation(extent={{-86,58},{-82,
                        62}})));
              TubeRLC_Derived leftThoracoacrominal(
                l=3e-2,
                isBranching=true,
                r=0.15e-2,
                h=0.035e-2,
                E=16e5) annotation (Placement(transformation(extent={{-38,58},{
                        -34,62}})));
              TubeRLC_Derived leftAxilliary2(
                isBranching=true,
                l=5.6e-2,
                r=0.31e-2,
                h=0.057e-2,
                E=4e5) annotation (Placement(transformation(extent={{-36,54},{-32,
                        58}})));

              TubeRLC_Derived leftCircumflexScapular(
                l=5e-2,
                isBranching=true,
                r=0.1e-2,
                h=0.03e-2,
                E=16e5) annotation (Placement(transformation(extent={{-38,56},{
                        -34,60}})));
              TubeRLC_Derived leftSubscapular(
                l=8e-2,
                isBranching=true,
                r=0.15e-2,
                h=0.035e-2,
                E=16e5) annotation (Placement(transformation(extent={{-38,60},{
                        -34,64}})));
              TubeRLC_Derived leftInternalCarotid1(
                isBranching=true,
                l=5.9e-2,
                r=0.18e-2,
                h=0.045e-2,
                E=8e5) annotation (Placement(transformation(extent={{-52,76},{-48,
                        80}})));

              TubeRLC_Derived leftExternalCarotid(
                isBranching=true,
                l=11.8e-2,
                r=0.15e-2,
                h=0.042e-2,
                E=8e5) annotation (Placement(transformation(extent={{-54,74},{-50,
                        78}})));

              TubeRLC_Derived leftSuperiorThyroid(
                l=4e-2,
                isBranching=true,
                r=0.07e-2,
                h=0.02e-2,
                E=8e5) annotation (Placement(transformation(extent={{-54,72},{-50,
                        76}})));
              TubeRLC_Derived_IABP thoracicAorta3(
                l=5.2e-2,
                r=0.95e-2,
                h=0.116e-2,
                E=4e5) annotation (Placement(transformation(
                    extent={{-2,-2},{2,2}},
                    rotation=90,
                    origin={-58,46})));

              TubeRLC_Derived rightSuperiorThyroid(
                l=4e-2,
                isBranching=true,
                r=0.07e-2,
                h=0.02e-2,
                E=8e5) annotation (Placement(transformation(extent={{-70,72},{-66,
                        76}})));
              TubeRLC_Derived rightExternalCarotid(
                isBranching=true,
                l=11.8e-2,
                r=0.15e-2,
                h=0.042e-2,
                E=8e5) annotation (Placement(transformation(extent={{-70,74},{-66,
                        78}})));

              TubeRLC_Derived rightInternalCarotid1(
                isBranching=true,
                l=5.9e-2,
                r=0.18e-2,
                h=0.045e-2,
                E=8e5) annotation (Placement(transformation(extent={{-68,76},{-64,
                        80}})));

              TubeRLC_Derived rightSubscapular(
                l=8e-2,
                isBranching=true,
                r=0.15e-2,
                h=0.035e-2,
                E=16e5) annotation (Placement(transformation(extent={{-94,58},{
                        -90,62}})));
              TubeRLC_Derived rightCircumflexScapular(
                l=5e-2,
                isBranching=true,
                r=0.1e-2,
                h=0.03e-2,
                E=16e5) annotation (Placement(transformation(extent={{-94,56},{
                        -90,60}})));
              TubeRLC_Derived rightAxilliary2(
                isBranching=true,
                l=5.6e-2,
                r=0.31e-2,
                h=0.057e-2,
                E=4e5) annotation (Placement(transformation(extent={{-92,52},{-88,
                        56}})));

              TubeRLC_Derived rightThoracoacrominal(
                l=3e-2,
                isBranching=true,
                r=0.15e-2,
                h=0.035e-2,
                E=16e5) annotation (Placement(transformation(extent={{-94,54},{
                        -90,58}})));
              TubeRLC_Derived leftBrachial1(
                l=6.3e-2,
                r=0.28e-2,
                h=0.055e-2,
                E=4e5) annotation (Placement(transformation(extent={{-36,52},{-32,
                        56}})));

              TubeRLC_Derived leftLingual(
                l=3e-2,
                isBranching=true,
                r=0.1e-2,
                h=0.03e-2,
                E=8e5) annotation (Placement(transformation(extent={{-54,78},{-50,
                        82}})));
              TubeRLC_Derived leftInternalCarotid2(
                isBranching=true,
                l=5.9e-2,
                r=0.13e-2,
                h=0.039e-2,
                E=8e5) annotation (Placement(transformation(extent={{-52,82},{-48,
                        86}})));

              TubeRLC_Derived leftFacial(
                l=4e-2,
                isBranching=true,
                r=0.1e-2,
                h=0.03e-2,
                E=16e5) annotation (Placement(transformation(extent={{-54,80},{
                        -50,84}})));
              TubeRLC_Derived leftMiddleCerebral(
                l=3e-2,
                isBranching=true,
                r=0.06e-2,
                h=0.02e-2,
                E=16e5) annotation (Placement(transformation(extent={{-60,72},{
                        -56,76}})));
              TubeRLC_Derived leftCerebral(
                l=5.9e-2,
                isBranching=true,
                r=0.08e-2,
                h=0.026e-2,
                E=16e5) annotation (Placement(transformation(extent={{-60,74},{
                        -56,78}})));
              TubeRLC_Derived leftOpthalmic(
                l=3e-2,
                isBranching=true,
                r=0.07e-2,
                h=0.02e-2,
                E=16e5) annotation (Placement(transformation(extent={{-60,76},{
                        -56,80}})));
              TubeRLC_Derived coeliac(
                isBranching=true,
                l=1e-2,
                r=0.39e-2,
                h=0.064e-2,
                E=4e5) annotation (Placement(transformation(extent={{-64,44},{-60,
                        48}})));

              TubeRLC_Derived_IABP abdominalAorta1(
                isBranching=true,
                l=5.3e-2,
                r=0.87e-2,
                h=0.108e-2,
                E=4e5) annotation (Placement(transformation(
                    extent={{-2,-2},{2,2}},
                    rotation=90,
                    origin={-58,40})));

              TubeRLC_Derived rightOpthalmic(
                l=3e-2,
                isBranching=true,
                r=0.07e-2,
                h=0.02e-2,
                E=16e5) annotation (Placement(transformation(extent={{-76,72},{
                        -72,76}})));
              TubeRLC_Derived rightCerebral(
                l=5.9e-2,
                isBranching=true,
                r=0.08e-2,
                h=0.026e-2,
                E=16e5) annotation (Placement(transformation(extent={{-76,74},{
                        -72,78}})));
              TubeRLC_Derived rightMiddleCerebral(
                l=3e-2,
                isBranching=true,
                r=0.06e-2,
                h=0.02e-2,
                E=16e5) annotation (Placement(transformation(extent={{-76,76},{
                        -72,80}})));
              TubeRLC_Derived rightFacial(
                l=4e-2,
                r=0.1e-2,
                h=0.03e-2,
                E=16e5) annotation (Placement(transformation(extent={{-70,78},{
                        -66,82}})));
              TubeRLC_Derived rightInternalCarotid2(
                isBranching=true,
                l=5.9e-2,
                r=0.13e-2,
                h=0.039e-2,
                E=8e5) annotation (Placement(transformation(extent={{-68,82},{-64,
                        86}})));

              TubeRLC_Derived rightLingual(
                l=3e-2,
                isBranching=true,
                r=0.1e-2,
                h=0.03e-2,
                E=8e5) annotation (Placement(transformation(extent={{-70,80},{-66,
                        84}})));
              TubeRLC_Derived rightBrachial1(
                isBranching=true,
                l=6.3e-2,
                r=0.28e-2,
                h=0.055e-2,
                E=4e5) annotation (Placement(transformation(extent={{-94,50},{-90,
                        54}})));

              TubeRLC_Derived leftProfundaBrachi(
                l=15e-2,
                isBranching=true,
                r=0.15e-2,
                h=0.035e-2,
                E=8e5) annotation (Placement(transformation(extent={{-38,50},{-34,
                        54}})));
              TubeRLC_Derived leftBrachial2(
                isBranching=true,
                l=6.3e-2,
                r=0.26e-2,
                h=0.053e-2,
                E=4e5) annotation (Placement(transformation(extent={{-36,48},{-32,
                        52}})));

              TubeRLC_Derived leftInternalCarotid3(
                l=5.9e-2,
                r=0.08e-2,
                h=0.026e-2,
                E=16e5) annotation (Placement(transformation(extent={{-52,84},{
                        -48,88}})));

              TubeRLC_Derived gastric1(
                l=7.1e-2,
                isBranching=true,
                r=0.18e-2,
                h=0.045e-2,
                E=4e5) annotation (Placement(transformation(extent={{-68,46},{-64,
                        50}})));
              TubeRLC_Derived splenic(
                l=6.3e-2,
                isBranching=true,
                r=0.28e-2,
                h=0.054e-2,
                E=4e5) annotation (Placement(transformation(extent={{-68,44},{-64,
                        48}})));
              TubeRLC_Derived hepatic(
                l=6.6e-2,
                isBranching=true,
                r=0.22e-2,
                h=0.049e-2,
                E=4e5) annotation (Placement(transformation(extent={{-68,42},{-64,
                        46}})));
              TubeRLC_Derived renal(
                l=3.2e-2,
                isBranching=true,
                r=0.26e-2,
                h=0.053e-2,
                E=4e5) annotation (Placement(transformation(extent={{-64,40},{-60,
                        44}})));
              TubeRLC_Derived abdominalAorta2(
                isBranching=true,
                l=5.3e-2,
                r=0.57e-2,
                h=0.08e-2,
                E=4e5) annotation (Placement(transformation(
                    extent={{-2,-2},{2,2}},
                    rotation=90,
                    origin={-58,36})));

              TubeRLC_Derived superiorMesenteric(
                l=5.9e-2,
                isBranching=true,
                r=0.43e-2,
                h=0.069e-2,
                E=4e5) annotation (Placement(transformation(extent={{-64,36},{-60,
                        40}})));
              TubeRLC_Derived gastric2(
                l=3.2e-2,
                isBranching=true,
                r=0.26e-2,
                h=0.053e-2,
                E=4e5) annotation (Placement(transformation(extent={{-64,38},{-60,
                        42}})));
              TubeRLC_Derived rightInternalCarotid3(
                l=5.9e-2,
                r=0.08e-2,
                h=0.026e-2,
                E=16e5) annotation (Placement(transformation(extent={{-68,84},{
                        -64,88}})));

              TubeRLC_Derived rightBrachial2(
                isBranching=true,
                l=6.3e-2,
                r=0.26e-2,
                h=0.053e-2,
                E=4e5) annotation (Placement(transformation(extent={{-94,46},{-90,
                        50}})));

              TubeRLC_Derived rightProfundaBrachi(
                l=15e-2,
                isBranching=true,
                r=0.15e-2,
                h=0.035e-2,
                E=8e5) annotation (Placement(transformation(extent={{-96,48},{-92,
                        52}})));
              TubeRLC_Derived leftBrachial3(
                isBranching=true,
                l=6.3e-2,
                r=0.25e-2,
                h=0.052e-2,
                E=4e5) annotation (Placement(transformation(extent={{-36,44},{-32,
                        48}})));

              TubeRLC_Derived leftSuperiorUlnarCollateral(
                l=5e-2,
                isBranching=true,
                r=0.07e-2,
                h=0.02e-2,
                E=16e5) annotation (Placement(transformation(extent={{-38,46},{
                        -34,50}})));
              TubeRLC_Derived leftSuperficialTemporal(
                l=4e-2,
                isBranching=true,
                r=0.06e-2,
                h=0.02e-2,
                E=16e5) annotation (Placement(transformation(extent={{-52,88},{
                        -48,92}})));
              TubeRLC_Derived leftMaxilliary(
                l=5e-2,
                isBranching=true,
                r=0.07e-2,
                h=0.02e-2,
                E=16e5) annotation (Placement(transformation(extent={{-54,86},{
                        -50,90}})));
              TubeRLC_Derived abdominalAorta3(
                l=5.3e-2,
                r=0.57e-2,
                h=0.08e-2,
                E=4e5) annotation (Placement(transformation(
                    extent={{-2,-2},{2,2}},
                    rotation=90,
                    origin={-58,32})));

              TubeRLC_Derived rightMaxilliary(
                l=5e-2,
                isBranching=true,
                r=0.07e-2,
                h=0.02e-2,
                E=16e5) annotation (Placement(transformation(extent={{-70,86},{
                        -66,90}})));
              TubeRLC_Derived rightSuperficialTemporal(
                l=4e-2,
                isBranching=true,
                r=0.06e-2,
                h=0.02e-2,
                E=16e5) annotation (Placement(transformation(extent={{-68,88},{
                        -64,92}})));
              TubeRLC_Derived rightSuperiorUlnarCollateral(
                l=5e-2,
                isBranching=true,
                r=0.07e-2,
                h=0.02e-2,
                E=16e5) annotation (Placement(transformation(extent={{-96,44},{
                        -92,48}})));
              TubeRLC_Derived rightBrachial3(
                isBranching=true,
                l=6.3e-2,
                r=0.25e-2,
                h=0.052e-2,
                E=4e5) annotation (Placement(transformation(extent={{-94,42},{-90,
                        46}})));

              TubeRLC_Derived leftInferiorUlnarCollateral(
                l=5e-2,
                isBranching=true,
                r=0.06e-2,
                h=0.02e-2,
                E=16e5) annotation (Placement(transformation(extent={{-38,42},{
                        -34,46}})));
              TubeRLC_Derived leftBrachial4(
                isBranching=true,
                l=4.6e-2,
                r=0.24e-2,
                h=0.05e-2,
                E=4e5) annotation (Placement(transformation(extent={{-36,40},{-32,
                        44}})));

              TubeRLC_Derived leftCommonIlliac(
                isBranching=true,
                l=5.8e-2,
                r=0.52e-2,
                h=0.076e-2,
                E=4e5) annotation (Placement(transformation(extent={{-54,26},{-50,
                        30}})));

              TubeRLC_Derived inferiorMesenteric(
                l=5e-2,
                isBranching=true,
                r=0.16e-2,
                h=0.043e-2,
                E=4e5) annotation (Placement(transformation(extent={{-60,26},{-56,
                        30}})));
              TubeRLC_Derived rightCommonIlliac(
                isBranching=true,
                l=5.8e-2,
                r=0.52e-2,
                h=0.076e-2,
                E=4e5) annotation (Placement(transformation(extent={{-64,26},{-60,
                        30}})));

              TubeRLC_Derived rightBrachial4(
                isBranching=true,
                l=4.6e-2,
                r=0.24e-2,
                h=0.05e-2,
                E=4e5) annotation (Placement(transformation(extent={{-94,38},{-90,
                        42}})));

              TubeRLC_Derived rightInferiorUlnarCollateral(
                l=5e-2,
                isBranching=true,
                r=0.06e-2,
                h=0.02e-2,
                E=16e5) annotation (Placement(transformation(extent={{-96,40},{
                        -92,44}})));
              TubeRLC_Derived leftUlnar1(
                isBranching=true,
                l=6.7e-2,
                r=0.21e-2,
                h=0.049e-2,
                E=8e5) annotation (Placement(transformation(extent={{-34,38},{-30,
                        42}})));

              TubeRLC_Derived leftRadial1(
                isBranching=true,
                l=11.7e-2,
                r=0.16e-2,
                h=0.043e-2,
                E=8e5) annotation (Placement(transformation(extent={{-40,38},{-36,
                        42}})));

              TubeRLC_Derived leftExternalIlliac1(
                isBranching=true,
                l=8.3e-2,
                r=0.29e-2,
                h=0.055e-2,
                E=4e5) annotation (Placement(transformation(extent={{-54,22},{-50,
                        26}})));

              TubeRLC_Derived leftInternalIlliac(
                l=5e-2,
                isBranching=true,
                r=0.2e-2,
                h=0.04e-2,
                E=16e5) annotation (Placement(transformation(extent={{-56,24},{
                        -52,28}})));
              TubeRLC_Derived rightInternalIlliac(
                l=5e-2,
                isBranching=true,
                r=0.2e-2,
                h=0.04e-2,
                E=16e5) annotation (Placement(transformation(extent={{-66,24},{
                        -62,28}})));
              TubeRLC_Derived rightExternalIlliac1(
                isBranching=true,
                l=8.3e-2,
                r=0.29e-2,
                h=0.055e-2,
                E=4e5) annotation (Placement(transformation(extent={{-64,22},{-60,
                        26}})));

              TubeRLC_Derived rightRadial1(
                isBranching=true,
                l=11.7e-2,
                r=0.16e-2,
                h=0.043e-2,
                E=8e5) annotation (Placement(transformation(extent={{-96,36},{-92,
                        40}})));

              TubeRLC_Derived rightUlnar1(
                isBranching=true,
                l=6.7e-2,
                r=0.21e-2,
                h=0.049e-2,
                E=8e5) annotation (Placement(transformation(extent={{-92,34},{-88,
                        38}})));
              TubeRLC_Derived leftUlnar2(
                isBranching=true,
                l=8.5e-2,
                r=0.19e-2,
                h=0.046e-2,
                E=8e5) annotation (Placement(transformation(extent={{-34,34},{-30,
                        38}})));

              TubeRLC_Derived leftInterossea(
                l=7.9e-2,
                isBranching=true,
                r=0.09e-2,
                h=0.028e-2,
                E=16e5) annotation (Placement(transformation(extent={{-36,36},{
                        -32,40}})));
              TubeRLC_Derived leftRadial2(
                l=11.7e-2,
                r=0.16e-2,
                h=0.043e-2,
                E=8e5) annotation (Placement(transformation(extent={{-42,36},{-38,
                        40}})));
              TubeRLC_Derived leftExternalIlliac2(
                l=6.1e-2,
                r=0.27e-2,
                h=0.053e-2,
                E=4e5) annotation (Placement(transformation(extent={{-54,20},{-50,
                        24}})));

              TubeRLC_Derived rightExternalIlliac2(
                l=6.1e-2,
                r=0.27e-2,
                h=0.053e-2,
                E=4e5) annotation (Placement(transformation(extent={{-64,20},{-60,
                        24}})));

              TubeRLC_Derived rightRadial2(
                l=11.7e-2,
                r=0.16e-2,
                h=0.043e-2,
                E=8e5) annotation (Placement(transformation(extent={{-98,34},{-94,
                        38}})));
              TubeRLC_Derived rightInterossea(
                l=7.9e-2,
                isBranching=true,
                r=0.09e-2,
                h=0.028e-2,
                E=16e5) annotation (Placement(transformation(extent={{-94,32},{
                        -90,36}})));
              TubeRLC_Derived rightUlnar2(
                l=8.5e-2,
                isBranching=true,
                r=0.19e-2,
                h=0.046e-2,
                E=8e5) annotation (Placement(transformation(extent={{-92,30},{-88,
                        34}})));

              TubeRLC_Derived leftUlnar3(
                l=8.5e-2,
                r=0.19e-2,
                h=0.046e-2,
                E=8e5) annotation (Placement(transformation(extent={{-34,32},{-30,
                        36}})));
              TubeRLC_Derived leftFemoral1(
                isBranching=true,
                l=12.7e-2,
                r=0.24e-2,
                h=0.05e-2,
                E=8e5) annotation (Placement(transformation(extent={{-54,16},{-50,
                        20}})));

              TubeRLC_Derived leftProfundis(
                l=12.6e-2,
                isBranching=true,
                r=0.23e-2,
                h=0.049e-2,
                E=16e5) annotation (Placement(transformation(extent={{-56,18},{
                        -52,22}})));
              TubeRLC_Derived rightProfundis(
                l=12.6e-2,
                isBranching=true,
                r=0.23e-2,
                h=0.049e-2,
                E=16e5) annotation (Placement(transformation(extent={{-66,18},{
                        -62,22}})));
              TubeRLC_Derived rightFemoral1(
                isBranching=true,
                l=12.7e-2,
                r=0.24e-2,
                h=0.05e-2,
                E=8e5) annotation (Placement(transformation(extent={{-64,16},{-60,
                        20}})));

              TubeRLC_Derived rightUlnar3(
                l=8.5e-2,
                r=0.19e-2,
                h=0.046e-2,
                E=8e5) annotation (Placement(transformation(extent={{-92,28},{-88,
                        32}})));
              TubeRLC_Derived leftFemoral2(
                l=12.7e-2,
                r=0.24e-2,
                h=0.05e-2,
                E=8e5) annotation (Placement(transformation(extent={{-54,14},{-50,
                        18}})));

              TubeRLC_Derived rightFemoral2(
                l=12.7e-2,
                r=0.24e-2,
                h=0.05e-2,
                E=8e5) annotation (Placement(transformation(extent={{-64,14},{-60,
                        18}})));

              TubeRLC_Derived leftPopliteal1(
                l=9.4e-2,
                r=0.2e-2,
                h=0.047e-2,
                E=8e5) annotation (Placement(transformation(extent={{-54,12},{-50,
                        16}})));

              TubeRLC_Derived rightPopliteal1(
                l=9.4e-2,
                r=0.2e-2,
                h=0.047e-2,
                E=8e5) annotation (Placement(transformation(extent={{-64,12},{-60,
                        16}})));

              TubeRLC_Derived leftPopliteal2(
                l=9.4e-2,
                r=0.2e-2,
                h=0.05e-2,
                E=4e5) annotation (Placement(transformation(
                    extent={{-2,-2},{2,2}},
                    rotation=90,
                    origin={-52,10})));

              TubeRLC_Derived rightPopliteal2(
                l=9.4e-2,
                r=0.2e-2,
                h=0.05e-2,
                E=4e5) annotation (Placement(transformation(
                    extent={{-2,-2},{2,2}},
                    rotation=90,
                    origin={-62,10})));

              TubeRLC_Derived leftAnteriorTibial1(
                isBranching=true,
                l=2.5e-2,
                r=0.13e-2,
                h=0.039e-2,
                E=16e5) annotation (Placement(transformation(extent={{-52,2},{-48,
                        6}})));

              TubeRLC_Derived leftPosteriorTibial1(
                isBranching=true,
                l=16.1e-2,
                r=0.18e-2,
                h=0.045e-2,
                E=16e5) annotation (Placement(transformation(extent={{-58,6},{-54,
                        10}})));

              TubeRLC_Derived rightPosteriorTibial1(
                isBranching=true,
                l=16.1e-2,
                r=0.18e-2,
                h=0.045e-2,
                E=16e5) annotation (Placement(transformation(extent={{-64,-2},{
                        -60,2}})));

              TubeRLC_Derived rightAnteriorTibial1(
                isBranching=true,
                l=2.5e-2,
                r=0.13e-2,
                h=0.039e-2,
                E=16e5) annotation (Placement(transformation(extent={{-68,4},{-64,
                        8}})));

              TubeRLC_Derived leftAnteriorTibial2(
                isBranching=true,
                l=15e-2,
                r=0.1e-2,
                h=0.02e-2,
                E=16e5) annotation (Placement(transformation(extent={{-52,-4},{
                        -48,0}})));

              TubeRLC_Derived leftPeroneal1(
                isBranching=true,
                l=15.9e-2,
                r=0.13e-2,
                h=0.039e-2,
                E=16e5) annotation (Placement(transformation(extent={{-56,-2},{
                        -52,2}})));

              TubeRLC_Derived leftPosteriorTibial2(
                l=16.1e-2,
                r=0.18e-2,
                h=0.045e-2,
                E=16e5) annotation (Placement(transformation(extent={{-60,2},{-56,
                        6}})));
              TubeRLC_Derived rightPosteriorTibial2(
                l=16.1e-2,
                r=0.18e-2,
                h=0.045e-2,
                E=16e5) annotation (Placement(transformation(extent={{-68,-4},{
                        -64,0}})));
              TubeRLC_Derived rightPeroneal1(
                isBranching=true,
                l=15.9e-2,
                r=0.13e-2,
                h=0.039e-2,
                E=16e5) annotation (Placement(transformation(extent={{-70,-2},{
                        -66,2}})));

              TubeRLC_Derived rightAnteriorTibial2(
                isBranching=true,
                l=15e-2,
                r=0.1e-2,
                h=0.02e-2,
                E=16e5) annotation (Placement(transformation(extent={{-72,2},{-68,
                        6}})));

              TubeRLC_Derived leftAnteriorTibial3(
                l=15e-2,
                r=0.1e-2,
                h=0.02e-2,
                E=16e5) annotation (Placement(transformation(extent={{-52,-8},{
                        -48,-4}})));
              TubeRLC_Derived leftPeroneal2(
                l=15.9e-2,
                r=0.13e-2,
                h=0.019e-2,
                E=16e5) annotation (Placement(transformation(extent={{-58,-8},{
                        -54,-4}})));
              TubeRLC_Derived rightPeroneal2(
                l=15.9e-2,
                r=0.13e-2,
                h=0.019e-2,
                E=16e5) annotation (Placement(transformation(extent={{-74,-6},{
                        -70,-2}})));
              TubeRLC_Derived rightAnteriorTibial3(
                l=15e-2,
                r=0.1e-2,
                h=0.02e-2,
                E=16e5) annotation (Placement(transformation(extent={{-76,-2},{
                        -72,2}})));
            // initial equation
            //   thoracicAorta3.V = 180e-3;




            equation
              der(V_filling) = q_filling;
              q_filling/speed_factor = V_init - V_filling;
              // - der(V_filling);
                volumeControl_.solutionFlow = q_filling;
              connect(volumeControl_.q_out, cIn);
              // Homely component -> disabling vizualization, even for connection

              pInner = aorticArch2.cIn.pressure;

              if settings.supports.ECMO_isEnabled then
                if settings.supports.ECMO_cannulaPlacement == CannulaPlacement.ascendingAorta then
                  connect(cCannula, ascendingAorta.cIn);
                elseif settings.supports.ECMO_cannulaPlacement ==
                    CannulaPlacement.aorticArch1 then
                  connect(cCannula, aorticArch1.cIn);
                elseif settings.supports.ECMO_cannulaPlacement ==
                    CannulaPlacement.aorticArch2 then
                  connect(cCannula, aorticArch2.cIn);
                elseif settings.supports.ECMO_cannulaPlacement ==
                    CannulaPlacement.thoracicAorta1 then
                  connect(cCannula, thoracicAorta1.cIn);
                elseif settings.supports.ECMO_cannulaPlacement ==
                    CannulaPlacement.thoracicAorta2 then
                  connect(cCannula, thoracicAorta2.cIn);
                else
                  connect(cCannula, cIn);
                end if;
              else
                connect(cCannula, cIn);
              end if;

              connect(rightAnteriorTibial2.cOut, rightAnteriorTibial3.cIn)
                annotation (Line(
                  points={{-68.4,4},{-75.6,4},{-75.6,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightPeroneal1.cOut, rightPeroneal2.cIn) annotation (Line(
                  points={{-66.4,0},{-73.6,0},{-73.6,-4}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftPeroneal1.cOut, leftPeroneal2.cIn) annotation (Line(
                  points={{-52.4,0},{-54,0},{-54,-6},{-57.6,-6}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftAnteriorTibial2.cOut, leftAnteriorTibial3.cIn)
                annotation (Line(
                  points={{-48.4,-2},{-50,-2},{-50,-6},{-51.6,-6}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightAnteriorTibial1.cOut, rightAnteriorTibial2.cIn)
                annotation (Line(
                  points={{-64.4,6},{-71.6,6},{-71.6,4}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightAnteriorTibial1.cOut, rightPeroneal1.cIn)
                annotation (Line(
                  points={{-64.4,6},{-69.6,6},{-69.6,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightPosteriorTibial1.cOut, rightPosteriorTibial2.cIn)
                annotation (Line(
                  points={{-60.4,0},{-67.6,0},{-67.6,-2}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftPosteriorTibial1.cOut, leftPosteriorTibial2.cIn)
                annotation (Line(
                  points={{-54.4,8},{-59.6,8},{-59.6,4}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftAnteriorTibial1.cOut, leftPeroneal1.cIn) annotation (
                  Line(
                  points={{-48.4,4},{-55.6,4},{-55.6,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftAnteriorTibial1.cOut, leftAnteriorTibial2.cIn)
                annotation (Line(
                  points={{-48.4,4},{-50,4},{-50,-2},{-51.6,-2}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightPopliteal2.cOut, rightAnteriorTibial1.cIn)
                annotation (Line(
                  points={{-62,11.6},{-67.6,11.6},{-67.6,6}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightPopliteal2.cOut, rightPosteriorTibial1.cIn)
                annotation (Line(
                  points={{-62,11.6},{-62,0},{-63.6,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftPopliteal2.cOut, leftPosteriorTibial1.cIn)
                annotation (Line(
                  points={{-52,11.6},{-54,11.6},{-54,8},{-57.6,8}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftPopliteal2.cOut, leftAnteriorTibial1.cIn) annotation (
                 Line(
                  points={{-52,11.6},{-50,11.6},{-50,4},{-51.6,4}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightPopliteal1.cOut, rightPopliteal2.cIn) annotation (
                  Line(
                  points={{-60.4,14},{-62,14},{-62,8.4}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftPopliteal1.cOut, leftPopliteal2.cIn) annotation (Line(
                  points={{-50.4,14},{-52,14},{-52,8.4}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightFemoral2.cOut, rightPopliteal1.cIn) annotation (Line(
                  points={{-60.4,16},{-62,16},{-62,14},{-63.6,14}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftFemoral2.cOut, leftPopliteal1.cIn) annotation (Line(
                  points={{-50.4,16},{-52,16},{-52,14},{-53.6,14}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightFemoral1.cOut, rightFemoral2.cIn) annotation (Line(
                  points={{-60.4,18},{-62,18},{-62,16},{-63.6,16}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftFemoral1.cOut, leftFemoral2.cIn) annotation (Line(
                  points={{-50.4,18},{-52,18},{-52,16},{-53.6,16}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightUlnar2.cOut, rightUlnar3.cIn) annotation (Line(
                  points={{-88.4,32},{-90,32},{-90,30},{-91.6,30}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightExternalIlliac2.cOut, rightFemoral1.cIn) annotation (
                 Line(
                  points={{-60.4,22},{-62,22},{-62,18},{-63.6,18}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightExternalIlliac2.cOut, rightProfundis.cIn)
                annotation (Line(
                  points={{-60.4,22},{-65.6,22},{-65.6,20}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftExternalIlliac2.cOut, leftProfundis.cIn) annotation (
                  Line(
                  points={{-50.4,22},{-55.6,22},{-55.6,20}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftExternalIlliac2.cOut, leftFemoral1.cIn) annotation (
                  Line(
                  points={{-50.4,22},{-52,22},{-52,18},{-53.6,18}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftUlnar2.cOut, leftUlnar3.cIn) annotation (Line(
                  points={{-30.4,36},{-32,36},{-32,34},{-33.6,34}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightRadial1.cOut, rightRadial2.cIn) annotation (Line(
                  points={{-92.4,38},{-97.6,38},{-97.6,36}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightExternalIlliac1.cOut, rightExternalIlliac2.cIn)
                annotation (Line(
                  points={{-60.4,24},{-62,24},{-62,22},{-63.6,22}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftExternalIlliac1.cOut, leftExternalIlliac2.cIn)
                annotation (Line(
                  points={{-50.4,24},{-52,24},{-52,22},{-53.6,22}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightUlnar1.cOut, rightInterossea.cIn) annotation (Line(
                  points={{-88.4,36},{-93.6,36},{-93.6,34}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightUlnar1.cOut, rightUlnar2.cIn) annotation (Line(
                  points={{-88.4,36},{-90,36},{-90,32},{-91.6,32}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftUlnar1.cOut, leftInterossea.cIn) annotation (Line(
                  points={{-30.4,40},{-35.6,40},{-35.6,38}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftUlnar1.cOut, leftUlnar2.cIn) annotation (Line(
                  points={{-30.4,40},{-32,40},{-32,36},{-33.6,36}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftRadial1.cOut, leftRadial2.cIn) annotation (Line(
                  points={{-36.4,40},{-41.6,40},{-41.6,38}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightBrachial4.cOut, rightRadial1.cIn) annotation (Line(
                  points={{-90.4,40},{-95.6,40},{-95.6,38}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightBrachial4.cOut, rightUlnar1.cIn) annotation (Line(
                  points={{-90.4,40},{-90,40},{-90,36},{-91.6,36}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightCommonIlliac.cOut, rightInternalIlliac.cIn)
                annotation (Line(
                  points={{-60.4,28},{-65.6,28},{-65.6,26}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightCommonIlliac.cOut, rightExternalIlliac1.cIn)
                annotation (Line(
                  points={{-60.4,28},{-62,28},{-62,24},{-63.6,24}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftCommonIlliac.cOut, leftInternalIlliac.cIn)
                annotation (Line(
                  points={{-50.4,28},{-55.6,28},{-55.6,26}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftCommonIlliac.cOut, leftExternalIlliac1.cIn)
                annotation (Line(
                  points={{-50.4,28},{-52,28},{-52,24},{-53.6,24}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftBrachial4.cOut, leftRadial1.cIn) annotation (Line(
                  points={{-32.4,42},{-39.6,42},{-39.6,40}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftBrachial4.cOut, leftUlnar1.cIn) annotation (Line(
                  points={{-32.4,42},{-32,42},{-32,40},{-33.6,40}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightBrachial3.cOut, rightInferiorUlnarCollateral.cIn)
                annotation (Line(
                  points={{-90.4,44},{-95.6,44},{-95.6,42}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightBrachial4.cIn, rightBrachial3.cOut) annotation (Line(
                  points={{-93.6,40},{-92,40},{-92,44},{-90.4,44}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightCommonIlliac.cIn, abdominalAorta3.cOut) annotation (
                  Line(
                  points={{-63.6,28},{-60,28},{-60,33.6},{-58,33.6}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(inferiorMesenteric.cIn, abdominalAorta3.cOut) annotation (
                 Line(
                  points={{-59.6,28},{-58,28},{-58,33.6}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftCommonIlliac.cIn, abdominalAorta3.cOut) annotation (
                  Line(points={{-53.6,28},{-54,28},{-54,30},{-58,30},{-58,33.6}},
                    smooth=Smooth.None));
              connect(leftBrachial4.cIn, leftBrachial3.cOut) annotation (Line(
                  points={{-35.6,42},{-34,42},{-34,46},{-32.4,46}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftBrachial3.cOut, leftInferiorUlnarCollateral.cIn)
                annotation (Line(
                  points={{-32.4,46},{-37.6,46},{-37.6,44}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightSuperiorUlnarCollateral.cIn, rightBrachial2.cOut)
                annotation (Line(
                  points={{-95.6,46},{-90.4,46},{-90.4,48}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightBrachial2.cOut, rightBrachial3.cIn) annotation (Line(
                  points={{-90.4,48},{-92,48},{-92,44},{-93.6,44}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightInternalCarotid3.cOut, rightMaxilliary.cIn)
                annotation (Line(
                  points={{-64.4,86},{-69.6,86},{-69.6,88}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightInternalCarotid3.cOut, rightSuperficialTemporal.cIn)
                annotation (Line(
                  points={{-64.4,86},{-66,86},{-66,90},{-67.6,90}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(abdominalAorta2.cOut, abdominalAorta3.cIn) annotation (
                  Line(
                  points={{-58,37.6},{-58,30.4}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftInternalCarotid3.cOut, leftMaxilliary.cIn)
                annotation (Line(
                  points={{-48.4,86},{-53.6,86},{-53.6,88}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftInternalCarotid3.cOut, leftSuperficialTemporal.cIn)
                annotation (Line(
                  points={{-48.4,86},{-50,86},{-50,90},{-51.6,90}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftBrachial2.cOut, leftSuperiorUlnarCollateral.cIn)
                annotation (Line(
                  points={{-32.4,50},{-37.6,50},{-37.6,48}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftBrachial2.cOut, leftBrachial3.cIn) annotation (Line(
                  points={{-32.4,50},{-34,50},{-34,46},{-35.6,46}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightInternalCarotid3.cIn, rightInternalCarotid2.cOut)
                annotation (Line(
                  points={{-67.6,86},{-66,86},{-66,84},{-64.4,84}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightBrachial1.cOut, rightProfundaBrachi.cIn) annotation (
                 Line(
                  points={{-90.4,52},{-95.6,52},{-95.6,50}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightBrachial1.cOut, rightBrachial2.cIn) annotation (Line(
                  points={{-90.4,52},{-92,52},{-92,48},{-93.6,48}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(abdominalAorta1.cOut, abdominalAorta2.cIn) annotation (
                  Line(
                  points={{-58,41.6},{-58,34.4}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(abdominalAorta1.cOut, superiorMesenteric.cIn) annotation (
                 Line(
                  points={{-58,41.6},{-63.6,41.6},{-63.6,38}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(abdominalAorta1.cOut, gastric2.cIn) annotation (Line(
                  points={{-58,41.6},{-63.6,41.6},{-63.6,40}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(abdominalAorta1.cOut, renal.cIn) annotation (Line(
                  points={{-58,41.6},{-63.6,41.6},{-63.6,42}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(coeliac.cOut, splenic.cIn) annotation (Line(
                  points={{-60.4,46},{-67.6,46}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(coeliac.cOut, gastric1.cIn) annotation (Line(
                  points={{-60.4,46},{-67.6,46},{-67.6,48}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(coeliac.cOut, hepatic.cIn) annotation (Line(
                  points={{-60.4,46},{-67.6,46},{-67.6,44}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftInternalCarotid2.cOut, leftInternalCarotid3.cIn)
                annotation (Line(
                  points={{-48.4,84},{-50,84},{-50,86},{-51.6,86}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftBrachial1.cOut, leftProfundaBrachi.cIn) annotation (
                  Line(
                  points={{-32.4,54},{-37.6,54},{-37.6,52}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftBrachial1.cOut, leftBrachial2.cIn) annotation (Line(
                  points={{-32.4,54},{-34,54},{-34,50},{-35.6,50}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightAxilliary2.cOut, rightBrachial1.cIn) annotation (
                  Line(
                  points={{-88.4,54},{-93.6,54},{-93.6,52}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightInternalCarotid1.cOut, rightFacial.cIn) annotation (
                  Line(
                  points={{-64.4,78},{-69.6,78},{-69.6,80}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightInternalCarotid1.cOut, rightLingual.cIn) annotation (
                 Line(
                  points={{-64.4,78},{-69.6,78},{-69.6,82}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightInternalCarotid1.cOut, rightInternalCarotid2.cIn)
                annotation (Line(
                  points={{-64.4,78},{-66,78},{-66,84},{-67.6,84}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightCerebral.cIn, rightExternalCarotid.cOut) annotation (
                 Line(
                  points={{-75.6,76},{-66.4,76}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightExternalCarotid.cOut, rightOpthalmic.cIn)
                annotation (Line(
                  points={{-66.4,76},{-70,76},{-70,74},{-75.6,74}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightExternalCarotid.cOut, rightMiddleCerebral.cIn)
                annotation (Line(
                  points={{-66.4,76},{-70,76},{-70,78},{-75.6,78}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(thoracicAorta3.cOut, abdominalAorta1.cIn) annotation (
                  Line(
                  points={{-58,47.6},{-58,38.4}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(thoracicAorta3.cOut, coeliac.cIn) annotation (Line(
                  points={{-58,47.6},{-63.6,47.6},{-63.6,46}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftInternalCarotid1.cOut, leftLingual.cIn) annotation (
                  Line(
                  points={{-48.4,78},{-53.6,78},{-53.6,80}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftInternalCarotid1.cOut, leftFacial.cIn) annotation (
                  Line(
                  points={{-48.4,78},{-53.6,78},{-53.6,82}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftInternalCarotid1.cOut, leftInternalCarotid2.cIn)
                annotation (Line(
                  points={{-48.4,78},{-50,78},{-50,84},{-51.6,84}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftCerebral.cIn, leftExternalCarotid.cOut) annotation (
                  Line(
                  points={{-59.6,76},{-50.4,76}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftExternalCarotid.cOut, leftMiddleCerebral.cIn)
                annotation (Line(
                  points={{-50.4,76},{-54,76},{-54,74},{-59.6,74}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftExternalCarotid.cOut, leftOpthalmic.cIn) annotation (
                  Line(
                  points={{-50.4,76},{-54,76},{-54,78},{-59.6,78}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftAxilliary2.cOut, leftBrachial1.cIn) annotation (Line(
                  points={{-32.4,56},{-34,56},{-34,54},{-35.6,54}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightAxilliary1.cOut, rightCircumflexScapular.cIn)
                annotation (Line(
                  points={{-84.4,58},{-93.6,58}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightAxilliary1.cOut, rightThoracoacrominal.cIn)
                annotation (Line(
                  points={{-84.4,58},{-88,58},{-88,56},{-93.6,56}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightAxilliary1.cOut, rightSubscapular.cIn) annotation (
                  Line(
                  points={{-84.4,58},{-88,58},{-88,60},{-93.6,60}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightAxilliary1.cOut, rightAxilliary2.cIn) annotation (
                  Line(
                  points={{-84.4,58},{-91.6,58},{-91.6,54}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightCommonCarotid2.cOut, rightSuperiorThyroid.cIn)
                annotation (Line(
                  points={{-64.4,72},{-69.6,72},{-69.6,74}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightCommonCarotid2.cOut, rightExternalCarotid.cIn)
                annotation (Line(
                  points={{-64.4,72},{-69.6,72},{-69.6,76}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightCommonCarotid2.cOut, rightInternalCarotid1.cIn)
                annotation (Line(
                  points={{-64.4,72},{-66,72},{-66,78},{-67.6,78}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(thoracicAorta2.cOut, thoracicAorta3.cIn) annotation (Line(
                  points={{-56.4,50},{-58,50},{-58,44.4}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftCommonCarotid3.cOut, leftSuperiorThyroid.cIn)
                annotation (Line(
                  points={{-48.4,72},{-53.6,72},{-53.6,74}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftCommonCarotid3.cOut, leftExternalCarotid.cIn)
                annotation (Line(
                  points={{-48.4,72},{-53.6,72},{-53.6,76}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftCommonCarotid3.cOut, leftInternalCarotid1.cIn)
                annotation (Line(
                  points={{-48.4,72},{-50,72},{-50,78},{-51.6,78}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftAxilliary1.cOut, leftSubscapular.cIn) annotation (
                  Line(
                  points={{-35.6,64},{-35.6,62},{-37.6,62}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftAxilliary1.cOut, leftThoracoacrominal.cIn)
                annotation (Line(
                  points={{-35.6,64},{-37.6,64},{-37.6,60}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftAxilliary1.cOut, leftCircumflexScapular.cIn)
                annotation (Line(
                  points={{-35.6,64},{-37.6,64},{-37.6,58}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftAxilliary1.cOut, leftAxilliary2.cIn) annotation (Line(
                  points={{-35.6,64},{-35.6,64},{-35.6,56}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightSubclavian.cOut, rightAxilliary1.cIn) annotation (
                  Line(
                  points={{-78.4,58},{-87.6,58}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightSubclavian.cOut, rightCostocervical.cIn) annotation (
                 Line(
                  points={{-78.4,58},{-85.6,58},{-85.6,60}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightSubclavian.cOut, rightThyrocervical.cIn) annotation (
                 Line(
                  points={{-78.4,58},{-85.6,58},{-85.6,62}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightSubclavian.cOut, rightSuprascapular.cIn) annotation (
                 Line(
                  points={{-78.4,58},{-85.6,58},{-85.6,64}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightCommonCarotid2.cIn, rightCommonCarotid1.cOut)
                annotation (Line(
                  points={{-67.6,72},{-66,72},{-66,70},{-64.4,70}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(thoracicAorta1.cOut, thoracicAorta2.cIn) annotation (Line(
                  points={{-56.4,52},{-58,52},{-58,50},{-59.6,50}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftCommonCarotid2.cOut, leftCommonCarotid3.cIn)
                annotation (Line(
                  points={{-48.4,70},{-50,70},{-50,72},{-51.6,72}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftSubclavian2.cOut, leftAxilliary1.cIn) annotation (
                  Line(
                  points={{-45.6,64},{-32.4,64}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftSubclavian2.cOut, leftCostocervical.cIn) annotation (
                  Line(
                  points={{-45.6,64},{-41.6,64},{-41.6,66}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftSubclavian2.cOut, leftSuprascapular.cIn) annotation (
                  Line(
                  points={{-45.6,64},{-41.6,64},{-41.6,68}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftSubclavian2.cOut, leftThyrocervical.cIn) annotation (
                  Line(
                  points={{-45.6,64},{-41.6,64},{-41.6,70}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(aorticArch2.cOut, thoracicAorta1.cIn) annotation (Line(
                  points={{-58,57.6},{-58,52},{-59.6,52}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftCommonCarotid1.cOut, leftCommonCarotid2.cIn)
                annotation (Line(
                  points={{-48.4,68},{-50,68},{-50,70},{-51.6,70}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftSubclavian1.cOut, leftSubclavian2.cIn) annotation (
                  Line(
                  points={{-55.6,62},{-50,62},{-50,64},{-42.4,64}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftSubclavian1.cOut, leftInternalMammary.cIn)
                annotation (Line(
                  points={{-55.6,62},{-48,62},{-48,60},{-47.6,60}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftSubclavian1.cOut, leftVertebral.cIn) annotation (Line(
                  points={{-55.6,62},{-48,62},{-48,58},{-47.6,58}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(brachiocephalic.cOut, rightVertebral.cIn) annotation (
                  Line(
                  points={{-60.4,62},{-70,62},{-70,60},{-79.6,60}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(brachiocephalic.cOut, rightSubclavian.cIn) annotation (
                  Line(
                  points={{-60.4,62},{-70,62},{-70,58},{-81.6,58}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(brachiocephalic.cOut, righInternalMammary.cIn)
                annotation (Line(
                  points={{-60.4,62},{-70,62},{-70,56},{-79.6,56}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(brachiocephalic.cOut, rightCommonCarotid1.cIn)
                annotation (Line(
                  points={{-60.4,62},{-67.6,62},{-67.6,70}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(ascendingAorta.cIn, cIn) annotation (Line(
                  points={{-64.4,54},{-72,54},{-72,0},{-80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(aorticArch1.cIn, ascendingAorta.cOut) annotation (Line(
                  points={{-62.4,56},{-67.6,56},{-67.6,54}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(aorticArch1.cOut, brachiocephalic.cIn) annotation (Line(
                  points={{-65.6,56},{-62,56},{-62,62},{-63.6,62}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(aorticArch1.cOut, leftCommonCarotid1.cIn) annotation (
                  Line(
                  points={{-65.6,56},{-56,56},{-56,68},{-51.6,68}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(aorticArch1.cOut, aorticArch2.cIn) annotation (Line(
                  points={{-65.6,56},{-60,56},{-60,54.4},{-58,54.4}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(aorticArch1.cOut, leftSubclavian1.cIn) annotation (Line(
                  points={{-65.6,56},{-60,56},{-60,62},{-52.4,62}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightAnteriorTibial3.cOut, cOut) annotation (Line(
                  points={{-72.4,0},{-82,0},{-82,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightPeroneal2.cOut, cOut) annotation (Line(
                  points={{-70.4,-4},{-78,-4},{-78,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightPosteriorTibial2.cOut, cOut) annotation (Line(
                  points={{-64.4,-2},{-78,-2},{-78,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightProfundis.cOut, cOut) annotation (Line(
                  points={{-62.4,20},{-74,20},{-74,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightInternalIlliac.cOut, cOut) annotation (Line(
                  points={{-62.4,26},{-74,26},{-74,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftPeroneal2.cOut, cOut) annotation (Line(
                  points={{-54.4,-6},{-74,-6},{-74,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftAnteriorTibial3.cOut, cOut) annotation (Line(
                  points={{-48.4,-6},{-70,-6},{-70,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftPosteriorTibial2.cOut, cOut) annotation (Line(points=
                      {{-56.4,4},{-72,4},{-72,0},{80,0}}, smooth=Smooth.None));
              connect(leftProfundis.cOut, cOut) annotation (Line(
                  points={{-52.4,20},{-70,20},{-70,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftInternalIlliac.cOut, cOut) annotation (Line(
                  points={{-52.4,26},{-70,26},{-70,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(inferiorMesenteric.cOut, cOut) annotation (Line(
                  points={{-56.4,28},{-72,28},{-72,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(superiorMesenteric.cOut, cOut) annotation (Line(
                  points={{-60.4,38},{-74,38},{-74,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(gastric2.cOut, cOut) annotation (Line(
                  points={{-60.4,40},{-74,40},{-74,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(renal.cOut, cOut) annotation (Line(
                  points={{-60.4,42},{-74,42},{-74,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(hepatic.cOut, cOut) annotation (Line(
                  points={{-64.4,44},{-76,44},{-76,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(splenic.cOut, cOut) annotation (Line(
                  points={{-64.4,46},{-74,46},{-74,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(gastric1.cOut, cOut) annotation (Line(
                  points={{-64.4,48},{-76,48},{-76,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightUlnar3.cOut, cOut) annotation (Line(
                  points={{-88.4,30},{-90,30},{-90,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightInterossea.cOut, cOut) annotation (Line(
                  points={{-90.4,34},{80,34},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightRadial2.cOut, cOut) annotation (Line(
                  points={{-94.4,36},{-96,36},{-96,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightInferiorUlnarCollateral.cOut, cOut) annotation (Line(
                  points={{-92.4,42},{80,42},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightSuperiorUlnarCollateral.cOut, cOut) annotation (Line(
                  points={{-92.4,46},{80,46},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightProfundaBrachi.cOut, cOut) annotation (Line(
                  points={{-92.4,50},{80,50},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightThoracoacrominal.cOut, cOut) annotation (Line(
                  points={{-90.4,56},{80,56},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightCircumflexScapular.cOut, cOut) annotation (Line(
                  points={{-90.4,58},{80,58},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightSubscapular.cOut, cOut) annotation (Line(
                  points={{-90.4,60},{80,60},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightCostocervical.cOut, cOut) annotation (Line(
                  points={{-82.4,60},{-86,60},{-86,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightThyrocervical.cOut, cOut) annotation (Line(points={{
                      -82.4,62},{-86,62},{-86,0},{80,0}}, smooth=Smooth.None));
              connect(rightSuprascapular.cOut, cOut) annotation (Line(
                  points={{-82.4,64},{-86,64},{-86,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftUlnar3.cOut, cOut) annotation (Line(
                  points={{-30.4,34},{-56,34},{-56,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftInterossea.cOut, cOut) annotation (Line(
                  points={{-32.4,38},{-58,38},{-58,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftRadial2.cOut, cOut) annotation (Line(
                  points={{-38.4,38},{-60,38},{-60,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftInferiorUlnarCollateral.cOut, cOut) annotation (Line(
                  points={{-34.4,44},{-60,44},{-60,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftSuperiorUlnarCollateral.cOut, cOut) annotation (Line(
                  points={{-34.4,48},{-60,48},{-60,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftProfundaBrachi.cOut, cOut) annotation (Line(
                  points={{-34.4,52},{-60,52},{-60,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftCircumflexScapular.cOut, cOut) annotation (Line(
                  points={{-34.4,58},{-58,58},{-58,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftThoracoacrominal.cOut, cOut) annotation (Line(
                  points={{-34.4,60},{-60,60},{-60,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftSubscapular.cOut, cOut) annotation (Line(
                  points={{-34.4,62},{-60,62},{-60,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftCostocervical.cOut, cOut) annotation (Line(
                  points={{-38.4,66},{-62,66},{-62,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftSuprascapular.cOut, cOut) annotation (Line(
                  points={{-38.4,68},{-60,68},{-60,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftThyrocervical.cOut, cOut) annotation (Line(
                  points={{-38.4,70},{-62,70},{-62,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(righInternalMammary.cOut, cOut) annotation (Line(points={
                      {-76.4,56},{-82,56},{-82,6},{-86,6},{-86,0},{80,0}},
                    smooth=Smooth.None));
              connect(rightVertebral.cOut, cOut) annotation (Line(
                  points={{-76.4,60},{-82,60},{-82,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftVertebral.cOut, cOut) annotation (Line(points={{-44.4,
                      58},{-64,58},{-64,12},{-82,12},{-82,6},{-86,6},{-86,0},{
                      80,0}}, smooth=Smooth.None));
              connect(leftInternalMammary.cOut, cOut) annotation (Line(points={
                      {-44.4,60},{-64,60},{-64,10},{-82,10},{-82,6},{-86,6},{-86,
                      0},{80,0}}, smooth=Smooth.None));
              connect(rightSuperiorThyroid.cOut, cOut) annotation (Line(
                  points={{-66.4,74},{-78,74},{-78,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightOpthalmic.cOut, cOut) annotation (Line(
                  points={{-72.4,74},{-82,74},{-82,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightCerebral.cOut, cOut) annotation (Line(
                  points={{-72.4,76},{-82,76},{-82,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightMiddleCerebral.cOut, cOut) annotation (Line(
                  points={{-72.4,78},{-82,78},{-82,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightFacial.cOut, cOut) annotation (Line(
                  points={{-66.4,80},{-78,80},{-78,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightLingual.cOut, cOut) annotation (Line(
                  points={{-66.4,82},{-78,82},{-78,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightMaxilliary.cOut, cOut) annotation (Line(
                  points={{-66.4,88},{-78,88},{-78,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(rightSuperficialTemporal.cOut, cOut) annotation (Line(
                  points={{-64.4,90},{-78,90},{-78,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftSuperiorThyroid.cOut, cOut) annotation (Line(
                  points={{-50.4,74},{-70,74},{-70,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftCerebral.cOut, cOut) annotation (Line(
                  points={{-56.4,76},{-74,76},{-74,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftMiddleCerebral.cOut, cOut) annotation (Line(
                  points={{-56.4,74},{-74,74},{-74,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftOpthalmic.cOut, cOut) annotation (Line(
                  points={{-56.4,78},{-74,78},{-74,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftLingual.cOut, cOut) annotation (Line(
                  points={{-50.4,80},{-70,80},{-70,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftFacial.cOut, cOut) annotation (Line(
                  points={{-50.4,82},{-70,82},{-70,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftMaxilliary.cOut, cOut) annotation (Line(
                  points={{-50.4,88},{-70,88},{-70,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));
              connect(leftSuperficialTemporal.cOut, cOut) annotation (Line(
                  points={{-48.4,90},{-70,90},{-70,0},{80,0}},
                  color={0,0,0},
                  smooth=Smooth.None));

              annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics), Icon(graphics=
                     {Text(       extent={{-62,44},{46,24}},
                      lineColor={0,128,0},
                      lineThickness=1,
                      fillColor={255,0,0},
                      fillPattern=FillPattern.Solid,
                      textStyle={TextStyle.Bold},
                      textString="Derived Tree")}));
            end ComplexTree_Derived;
          end SystemicArteries;

          package ECMO "ECMO device and its components"
            model ECMO "ECMO circuit including cannulas"
              extends Cardiovascular.Icons.ECMO;
              extends Auxiliary.BlockKinds.Port;
              import
                Cardiovascular.Model.Complex.Components.Auxiliary.RLC.Tubes.*;
              import Cardiovascular.Model.Complex.Environment.*;
              import Cardiovascular.Types.*;
              import Physiolibrary.Hydraulic.Components.IdealValve;
              import Physiolibrary.Types.*;

              outer Environment.ComplexEnvironment settings
                "Everything is out there";

              parameter Boolean isEnabled=true "Whether ECMO is enabled";
              parameter Cardiovascular.Types.PulseShape pulseShapeRef=
                  PulseShape.pulseless
                "Reference pulse shape (or non-pulsatile)";
              parameter VolumeFlowRate qMeanRef=1 "Reference mean flow";
              parameter Time pulseStartTime=settings.supports.ECMO_pulseStartTime
                "Time delay behind the start of cardiac cycle";

              input Time pulseDuration=cycleDuration
                "Duration of pulse if using pulsatile ECMO";
              input Time cycleDuration "Duration of cardiac cycle";

              VolumeFlowRate qRef "Reference flow wave";
              Time t(start=-pulseStartTime)
                "Time with respect to the cardiac cycle, offset included";

            protected
              parameter Boolean _isEnabled=isEnabled and qMeanRef > 0
                "Whether the ECMO is really enabled - setting mean flow to zero while having ECMO connected is not desired as in reality";

              VolumeFlowRate qPeak "Peak flow in the parabolic pulse";
              Time tPeak=pulseDuration/2 "Time of peak of the parabolic pulse";
              Real scale "Parabola scaling coefficient";

            public
              Pump ecmoPump(qRef=qRef) if _isEnabled annotation (Placement(
                    transformation(extent={{-44,-16},{-8,16}})));
              Oxygenator ecmoOxygenator(
                fiberCount=80000,
                fiberLength=0.15,
                fiberDiameter(displayUnit="mm") = 0.0002,
                fiberThickness(displayUnit="mm") = 5e-05) if _isEnabled
                annotation (Placement(transformation(extent={{6,-20},{50,22}})));
              TubeR inflowTube(l=0.5, r=0.005) if _isEnabled annotation (
                  Placement(transformation(
                    extent={{-20.0263,-9.02613},{20.0263,9.02613}},
                    rotation=-60,
                    origin={-47.83,22.8302})));
              TubeR middleTube(l=0.2, r=0.005) if _isEnabled annotation (
                  Placement(transformation(extent={{-10,-10},{42,12}})));
              TubeR outflowTube(l=0.5, r=0.005) if _isEnabled annotation (
                  Placement(transformation(
                    extent={{-12.6602,-11.7321},{12.6602,11.7321}},
                    rotation=60,
                    origin={56.1699,28.8301})));
              IdealValve vInflow(_Goff=0, Pknee=0) if _isEnabled annotation (
                  Placement(transformation(
                    extent={{-6.59806,-8.23202},{6.59806,8.23202}},
                    rotation=60,
                    origin={-73.8301,21.8301})));
              IdealValve vOutflow(_Goff=0, Pknee=0) if _isEnabled annotation (
                  Placement(transformation(
                    extent={{-5.63393,-8.09807},{5.63393,8.09807}},
                    rotation=-60,
                    origin={78.1699,18.8301})));
              TubeR venousCannula(l=settings.supports.ECMO_cannulaLength, r=
                    settings.supports.ECMO_cannulaInnerDiameter/2) if
                _isEnabled annotation (Placement(transformation(
                    extent={{-6.23204,-6.86599},{6.23204,6.86599}},
                    rotation=60,
                    origin={-65.1699,35.1699})));
              TubeR arterialCannula(l=settings.supports.ECMO_cannulaLength, r=
                    settings.supports.ECMO_cannulaInnerDiameter/2) if
                _isEnabled annotation (Placement(transformation(
                    extent={{-6.99997,-8.4641},{6.99997,8.4641}},
                    rotation=-60,
                    origin={68.8301,30.1699})));

            equation
              if pulseShapeRef == PulseShape.pulseless then
                qRef = qMeanRef;
              elseif pulseShapeRef == PulseShape.square then
                qRef = if t >= 0 and t <= pulseDuration then qMeanRef*
                  cycleDuration/pulseDuration else 0;
              elseif pulseShapeRef == PulseShape.parabolic then
                qRef = max(0, qPeak - ((t - tPeak)^2*scale));
              else
                qRef = 0;
              end if;

              scale*tPeak^2 = qPeak;
              2*(qPeak*tPeak - scale*tPeak^3/3)/cycleDuration = qMeanRef;

              if not _isEnabled then
                cIn.q = -cOut.q;
                cIn.q = 0;
              end if;

              der(t) = 1;
              when t >= cycleDuration then
                reinit(t, t - cycleDuration);
              end when;

              connect(cOut, vOutflow.q_out) annotation (Line(
                  points={{80,0},{68,0},{68,6},{68,10},{80,10},{80,14},{80,
                      13.951},{80.9869,13.951}},
                  color={255,0,0},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(cIn, vInflow.q_in) annotation (Line(
                  points={{-80,0},{-66,0},{-66,10},{-77.1291,10},{-77.1291,
                      16.116}},
                  color={127,5,60},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(inflowTube.cOut, ecmoPump.cIn) annotation (Line(
                  points={{-39.8195,8.95557},{-46,8.95557},{-46,20},{-46,0},{-40.4,
                      0}},
                  color={127,5,60},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(middleTube.cIn, ecmoPump.cOut) annotation (Line(
                  points={{-4.8,1},{-10,1},{-10,0},{-11.6,0}},
                  color={127,5,60},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(middleTube.cOut, ecmoOxygenator.cIn) annotation (Line(
                  points={{36.8,1},{36.8,1},{10.4,1}},
                  color={127,5,60},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(ecmoOxygenator.cOut, outflowTube.cIn) annotation (Line(
                  points={{45.6,1},{45.6,2},{46,2},{46,2},{46,2},{52,2},{52,
                      20.0589},{51.1058,20.0589}},
                  color={255,0,0},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(vInflow.q_out, venousCannula.cIn) annotation (Line(
                  points={{-70.5311,27.5442},{-67.6627,27.5442},{-67.6627,
                      30.8522}},
                  color={127,5,60},
                  thickness=1,
                  smooth=Smooth.Bezier));
              connect(inflowTube.cIn, venousCannula.cOut) annotation (Line(
                  points={{-55.8405,36.7048},{-55.8405,39.4876},{-62.6771,
                      39.4876}},
                  color={127,5,60},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(outflowTube.cOut, arterialCannula.cIn) annotation (Line(
                  points={{61.234,37.6013},{66,37.6013},{66,34},{66.0301,34},{
                      66.0301,35.0196}},
                  color={255,0,0},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(vOutflow.q_in, arterialCannula.cOut) annotation (Line(
                  points={{75.3529,23.7092},{72,23.7092},{72,25.3202},{71.6301,
                      25.3202}},
                  color={255,0,0},
                  thickness=1,
                  smooth=Smooth.Bezier));

              annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics), Icon(
                    coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                        {100,100}})));
            end ECMO;

            model Pump
              "ECMO pump with pressure control according to flow feedback and reference flow"
              extends Cardiovascular.Icons.Screw;
              extends Auxiliary.BlockKinds.Port;
              import Cardiovascular.Model.Complex.Environment.*;
              import Physiolibrary.Types.*;

              outer Environment.ComplexEnvironment settings
                "Everything is out there";

              input VolumeFlowRate qRef "Reference flow wave";
              Real B=qRef;
              Pressure p "Pressure exerted by the pump";
              parameter VolumeFlowRate qRef2;
            equation
              cIn.q = -cOut.q;
              dp = -p;
              der(p) = (qRef2 - cIn.q)*settings.constants.ecmoPumpPressureAdaptationRate;

              annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics), Icon(
                    coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                        {100,100}})));
            end Pump;

            model Oxygenator "Resistive hollow-fiber oxygenator"
              extends Physiolibrary.Icons.PerfusionDO;
              extends Cardiovascular.Icons.O2;
              extends Auxiliary.BlockKinds.Port;
              import Cardiovascular.Model.Complex.Components.Auxiliary.RLC.*;
              import Cardiovascular.Constants.*;
              import Cardiovascular.Types.*;
              import Modelica.Constants.*;
              import Physiolibrary.Types.*;

              parameter Real fiberCount "Number of fibers";
              parameter Cardiovascular.Types.Length fiberLength
                "Length of each fiber";
              parameter Cardiovascular.Types.Length fiberDiameter
                "Fiber diameter";
              parameter Cardiovascular.Types.Length fiberThickness
                "Fiber thickness";

              Elements.R resistor(R=8*mu*fiberLength/pi/(0.5*fiberDiameter)^4/
                    fiberCount) annotation (Placement(transformation(extent={{-10,
                        -10},{10,10}})));

            equation
              connect(cIn, resistor.cIn) annotation (Line(
                  points={{-80,0},{-8,0}},
                  color={0,0,255},
                  smooth=Smooth.None));
              connect(cOut, resistor.cOut) annotation (Line(
                  points={{80,0},{8,0}},
                  color={0,0,255},
                  smooth=Smooth.None));

              annotation (Diagram(graphics), Icon(coordinateSystem(
                      preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
            end Oxygenator;

            model ECMO_bare "ECMO circuit including cannulas"
              extends Cardiovascular.Icons.ECMO;
              extends Auxiliary.BlockKinds.Port;
              import
                Cardiovascular.Model.Complex.Components.Auxiliary.RLC.Tubes.*;
              import Cardiovascular.Model.Complex.Environment.*;
              import Cardiovascular.Types.*;
              import Physiolibrary.Hydraulic.Components.IdealValve;
              import Physiolibrary.Types.*;

              outer Environment.ComplexEnvironment settings
                "Everything is out there";

              parameter Boolean isEnabled=true "Whether ECMO is enabled";
              parameter Cardiovascular.Types.PulseShape pulseShapeRef=
                  PulseShape.pulseless
                "Reference pulse shape (or non-pulsatile)";
              parameter VolumeFlowRate qMeanRef=1 "Reference mean flow";
              parameter Time pulseStartTime=settings.supports.ECMO_pulseStartTime
                "Time delay behind the start of cardiac cycle";

              input Time pulseDuration=cycleDuration
                "Duration of pulse if using pulsatile ECMO";
              input Time cycleDuration "Duration of cardiac cycle";

              VolumeFlowRate qRef "Reference flow wave";
              Time t(start=-pulseStartTime)
                "Time with respect to the cardiac cycle, offset included";

            protected
              parameter Boolean _isEnabled=isEnabled and qMeanRef > 0
                "Whether the ECMO is really enabled - setting mean flow to zero while having ECMO connected is not desired as in reality";

              VolumeFlowRate qPeak "Peak flow in the parabolic pulse";
              Time tPeak=pulseDuration/2 "Time of peak of the parabolic pulse";
              Real scale "Parabola scaling coefficient";

            public
              Pump ecmoPump(qRef=qRef) if _isEnabled annotation (Placement(
                    transformation(extent={{-44,-16},{-8,16}})));
              Oxygenator ecmoOxygenator(
                fiberCount=80000,
                fiberLength=0.15,
                fiberDiameter(displayUnit="mm") = 0.0002,
                fiberThickness(displayUnit="mm") = 5e-05) if _isEnabled
                annotation (Placement(transformation(extent={{6,-20},{50,22}})));
              TubeR inflowTube(l=0.5, r=0.005) if _isEnabled annotation (
                  Placement(transformation(
                    extent={{-20.0263,-9.02613},{20.0263,9.02613}},
                    rotation=-60,
                    origin={-47.83,22.8302})));
              TubeR middleTube(l=0.2, r=0.005) if _isEnabled annotation (
                  Placement(transformation(extent={{-10,-10},{42,12}})));
              TubeR outflowTube(l=0.5, r=0.005) if _isEnabled annotation (
                  Placement(transformation(
                    extent={{-12.6602,-11.7321},{12.6602,11.7321}},
                    rotation=60,
                    origin={56.1699,28.8301})));

            equation
              if pulseShapeRef == PulseShape.pulseless then
                qRef = qMeanRef;
              elseif pulseShapeRef == PulseShape.square then
                qRef = if t >= 0 and t <= pulseDuration then qMeanRef*
                  cycleDuration/pulseDuration else 0;
              elseif pulseShapeRef == PulseShape.parabolic then
                qRef = max(0, qPeak - ((t - tPeak)^2*scale));
              else
                qRef = 0;
              end if;

              scale*tPeak^2 = qPeak;
              2*(qPeak*tPeak - scale*tPeak^3/3)/cycleDuration = qMeanRef;

              if not _isEnabled then
                cIn.q = -cOut.q;
                cIn.q = 0;
              end if;

              der(t) = 1;
              when t >= cycleDuration then
                reinit(t, t - cycleDuration);
              end when;

              connect(inflowTube.cOut, ecmoPump.cIn) annotation (Line(
                  points={{-39.8195,8.95557},{-46,8.95557},{-46,20},{-46,0},{
                      -40.4,0}},
                  color={127,5,60},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(middleTube.cIn, ecmoPump.cOut) annotation (Line(
                  points={{-4.8,1},{-10,1},{-10,0},{-11.6,0}},
                  color={127,5,60},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(middleTube.cOut, ecmoOxygenator.cIn) annotation (Line(
                  points={{36.8,1},{36.8,1},{10.4,1}},
                  color={127,5,60},
                  smooth=Smooth.Bezier,
                  thickness=1));
              connect(ecmoOxygenator.cOut, outflowTube.cIn) annotation (Line(
                  points={{45.6,1},{45.6,2},{46,2},{46,2},{46,2},{52,2},{52,
                      20.0589},{51.1058,20.0589}},
                  color={255,0,0},
                  smooth=Smooth.Bezier,
                  thickness=1));

              connect(inflowTube.cIn, cIn) annotation (Line(points={{-55.8405,
                      36.7048},{-55.8405,18.3524},{-80,18.3524},{-80,0}}, color=
                     {127,0,0}));
              connect(outflowTube.cOut, cOut) annotation (Line(points={{61.234,
                      37.6013},{61.234,19.8007},{80,19.8007},{80,0}}, color={
                      229,133,64}));
              annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}})), Icon(coordinateSystem(
                      preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
            end ECMO_bare;
          end ECMO;
        end Main;

        model Heart
          extends Interfaces.Heart;
          import Physiolibrary.Types.*;
          replaceable Main.Heart.Heart heart(
            VPRef_init=settings.initialization.peri_VRef,
            pPRef=settings.initialization.peri_pRef,
            kP=settings.initialization.peri_k)
            annotation (Placement(transformation(extent={{-48,-38},{44,74}})));

          outer Environment.ComplexEnvironment settings
            "Everything is out there...";

        //   Averager avg_LV_pEjection(
        //     redeclare type T = Pressure,
        //     signal = heart. ventricles. pLV,
        //     condition = -heart. vSA. cOut. q > 0,
        //     control = stepCycle);
        //   Averager avg_cVSA_p(
        //     redeclare type T = Pressure,
        //     signal = heart. cVSA. pressure,
        //     control = stepCycle);
        //   Averager avg_cVSA_q(
        //     redeclare type T = VolumeFlowRate,
        //     signal = -heart. cVSA. q,
        //     control = stepCycle);
        //
        //   Maxer max_pP(
        //     redeclare type T = Pressure,
        //     signal = heart. pP,
        //     control = stepCycle);

          // Averager avg_LW_sigmaAPositive(
          //   redeclare type T = Pressure,
          //   init = 1,
          //   signal = max(0, heart. ventricles. LW. sigmaA),
          //   control = stepCycle);
          // Averager avg_LW_sigmaAPositiveLsc(
          //   redeclare type T = Real,
          //   init = 1,
          //   signal = max(0, heart. ventricles. LW. sigmaA) * 1e6 * heart. ventricles. LW.Lsc,
          //   control = stepCycle);
          // Maxer max_LW_sigmaP(
          //   redeclare type T = Pressure,
          //   init = 1,
          //   signal = max(0, heart. ventricles. LW. sigmaP),
          //   control = stepCycle);
          // Averager avg_LW_sigmaAPositiveNorm(
          //   redeclare type T = Real,
          //   init = 1,
          //   signal = max(0, heart. ventricles. LW. sigmaA) * (1e6 * heart. ventricles. LW. Lsc - avg_LW_sigmaAPositiveLsc. average / avg_LW_sigmaAPositive. average) ^ 2,
          //   control = stepCycle);
          // Averager avg_SW_sigmaAPositive(
          //   redeclare type T = Pressure,
          //   init = 1,
          //   signal = max(0, heart. ventricles. SW. sigmaA),
          //   control = stepCycle);
          // Averager avg_SW_sigmaAPositiveLsc(
          //   redeclare type T = Real,
          //   init = 1,
          //   signal = max(0, heart. ventricles. SW. sigmaA) * 1e6 * heart. ventricles. SW. Lsc,
          //   control = stepCycle);
          // Maxer max_SW_sigmaP(
          //   redeclare type T = Pressure,
          //   init = 1,
          //   signal = max(0, heart. ventricles. SW. sigmaP),
          //   control = stepCycle);
          // Averager avg_SW_sigmaAPositiveNorm(
          //   redeclare type T = Real,
          //   signal = max(0, heart. ventricles. SW. sigmaA) * (1e6 * heart. ventricles. SW. Lsc - avg_SW_sigmaAPositiveLsc. average / avg_SW_sigmaAPositive. average) ^ 2,
          //   control = stepCycle);
          // Averager avg_RW_sigmaAPositive(
          //   redeclare type T = Pressure,
          //   init = 1,
          //   signal = max(0, heart. ventricles. RW. sigmaA),
          //   control = stepCycle);
          // Averager avg_RW_sigmaAPositiveLsc(
          //   redeclare type T = Real,
          //   init = 1,
          //   signal = max(0, heart. ventricles. RW. sigmaA) * 1e6 * heart. ventricles. RW. Lsc,
          //   control = stepCycle);
          // Maxer max_RW_sigmaP(
          //   redeclare type T = Pressure,
          //   init = 1,
          //   signal = max(0, heart. ventricles. RW. sigmaP),
          //   control = stepCycle);
          // Averager avg_RW_sigmaAPositiveNorm(
          //   redeclare type T = Real,
          //   signal = max(0, heart. ventricles. RW. sigmaA) * (1e6 * heart. ventricles. RW. Lsc - avg_RW_sigmaAPositiveLsc. average / avg_RW_sigmaAPositive. average) ^ 2,
          //   control = stepCycle);
          // Averager avg_LA_sigmaAPositive(
          //   redeclare type T = Pressure,
          //   init = 1,
          //   signal = max(0, heart. LA. sigmaA),
          //   control = stepCycle);
          // Averager avg_LA_sigmaAPositiveLsc(
          //   redeclare type T = Real,
          //   init = 1,
          //   signal = max(0, heart. LA. sigmaA) * 1e6 * heart. LA. Lsc,
          //   control = stepCycle);
          // Maxer max_LA_sigmaP(
          //   redeclare type T = Pressure,
          //   init = 1,
          //   signal = max(0, heart. LA. sigmaP),
          //   control = stepCycle);
          // Averager avg_LA_sigmaAPositiveNorm(
          //   redeclare type T = Real,
          //   signal = max(0, heart. LA. sigmaA) * (1e6 * heart. LA. Lsc - avg_LA_sigmaAPositiveLsc. average / avg_LA_sigmaAPositive. average) ^ 2,
          //   control = stepCycle);
          // Averager avg_RA_sigmaAPositive(
          //   redeclare type T = Pressure,
          //   init = 1,
          //   signal = max(0, heart. RA. sigmaA),
          //   control = stepCycle);
          // Averager avg_RA_sigmaAPositiveLsc(
          //   redeclare type T = Real,
          //   init = 1,
          //   signal = max(0, heart. RA. sigmaA) * 1e6 * heart. RA. Lsc,
          //   control = stepCycle);
          // Maxer max_RA_sigmaP(
          //   redeclare type T = Pressure,
          //   init = 1,
          //   signal = max(0, heart. RA. sigmaP),
          //   control = stepCycle);
          // Averager avg_RA_sigmaAPositiveNorm(
          //   redeclare type T = Real,
          //   signal = max(0, heart. RA. sigmaA) * (1e6 * heart. RA. Lsc - avg_RA_sigmaAPositiveLsc. average / avg_RA_sigmaAPositive. average) ^ 2,
          //   control = stepCycle);

        equation
        //   V = heart. V;
          // MOVED FROM CARDIO:

          // DISABLING THE ADAPTATION
        //
        //   // Adaptation of valve diameters and dead mid-wall area of heart walls
        //   when change(stepCycle) and settings. condition. adaptValveDiameter then
        //     heart. vSA. ARef = if SA. isAdaptable then avg_SA_A. average else pre(heart. vSA. ARef);
        //     heart. vSV. ARef = avg_SV_A. average;
        //     heart. vPA. ARef = avg_PA_A. average;
        //     heart. vPV. ARef = avg_PV_A. average;
        //     heart. vLAV. ARef = 1.5 * heart. vSA. ARef;
        //     heart. vRAV. ARef = 1.5 * avg_PA_A. average;
        //     heart. ventricles. LW. Am0 = 1.5 * heart. vSA. ARef + heart. vSA. ARef;
        //     heart. ventricles. SW. Am0 = 0;
        //     heart. ventricles. RW. Am0 = 1.5 * avg_PA_A. average + avg_PA_A. average;
        //     heart. LA. Am0 = 1.5 * heart. vSA. ARef + avg_SV_A. average;
        //     heart. RA. Am0 = 1.5 * avg_PA_A. average + avg_PV_A. average;
        //   end when;


          // DISABLING THE ADAPTATION
        //   // Adaptation of correctional term for more appropriate wall geometry
        //   when change(stepCycle) and settings. condition. adaptTriSegJunction then
        //     heart. ventricles. LW. EAmRef = 0;
        //     heart. ventricles. SW. EAmRef = 5 * log(pre(heart. ventricles. LW. AmRef) * pre(heart. ventricles. RW. AmRef) / (pre(heart. ventricles. SW. AmRef) * (pre(heart. ventricles. LW. AmRef) + pre(heart. ventricles. RW. AmRef))));
        //     heart. ventricles. RW. EAmRef = 0;
        //   end when;

            // DISABLING THE ADAPTATION

        //   // Adaptation of wall volumes of heart walls
        //   when change(stepCycle) and settings. condition. adaptChamberWVolume then
        //     heart. ventricles. LW. VW = pre(heart. ventricles. LW. VW) * exp(0.3957 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_LW_sigmaAPositiveNorm. average / avg_LW_sigmaAPositive. average))) / 0.5))) - 0.3066 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. LW. EAmRef) / pre(max_LW_sigmaP. maximum)) / 0.5))) - 0.235 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_LW_sigmaAPositiveLsc. average / avg_LW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
        //     heart. ventricles. SW. VW = pre(heart. ventricles. SW. VW) * exp(0.3957 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_SW_sigmaAPositiveNorm. average / avg_SW_sigmaAPositive. average))) / 0.5))) - 0.3066 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. SW. EAmRef) / pre(max_SW_sigmaP. maximum)) / 0.5))) - 0.235 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_SW_sigmaAPositiveLsc. average / avg_SW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
        //     heart. ventricles. RW. VW = pre(heart. ventricles. RW. VW) * exp(0.3957 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_RW_sigmaAPositiveNorm. average / avg_RW_sigmaAPositive. average))) / 0.5))) - 0.3066 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. RW. EAmRef) / pre(max_RW_sigmaP. maximum)) / 0.5))) - 0.235 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_RW_sigmaAPositiveLsc. average / avg_RW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
        //     heart. LA. VW = pre(heart. LA. VW) * exp(0.3957 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_LA_sigmaAPositiveNorm. average / avg_LA_sigmaAPositive. average))) / 0.5))) - 0.3066 * log(exp(0.5 * tanh(log(settings. constants. atriumSigmaPAdapt / pre(max_LA_sigmaP. maximum)) / 0.5))) - 0.235 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_LA_sigmaAPositiveLsc. average / avg_LA_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
        //     heart. RA. VW = pre(heart. RA. VW) * exp(0.3957 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_RA_sigmaAPositiveNorm. average / avg_RA_sigmaAPositive. average))) / 0.5))) - 0.3066 * log(exp(0.5 * tanh(log(settings. constants. atriumSigmaPAdapt / pre(max_RA_sigmaP. maximum)) / 0.5))) - 0.235 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_RA_sigmaAPositiveLsc. average / avg_RA_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
        //   end when;
        //
        //   // Adaptation of reference cross-sectional area of heart walls
        //   when change(stepCycle) and settings. condition. adaptChamberWArea then
        //     heart. ventricles. LW. AmRef = pre(heart. ventricles. LW. AmRef) * exp(-0.4571 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_LW_sigmaAPositiveNorm. average / avg_LW_sigmaAPositive. average))) / 0.5))) - 0.0433 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. LW. EAmRef) / pre(max_LW_sigmaP. maximum)) / 0.5))) + 1.3028 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_LW_sigmaAPositiveLsc. average / avg_LW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
        //     heart. ventricles. SW. AmRef = pre(heart. ventricles. SW. AmRef) * exp(-0.4571 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_SW_sigmaAPositiveNorm. average / avg_SW_sigmaAPositive. average))) / 0.5))) - 0.0433 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. SW. EAmRef) / pre(max_SW_sigmaP. maximum)) / 0.5))) + 1.3028 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_SW_sigmaAPositiveLsc. average / avg_SW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
        //     heart. ventricles. RW. AmRef = pre(heart. ventricles. RW. AmRef) * exp(-0.4571 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_RW_sigmaAPositiveNorm. average / avg_RW_sigmaAPositive. average))) / 0.5))) - 0.0433 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. RW. EAmRef) / pre(max_RW_sigmaP. maximum)) / 0.5))) + 1.3028 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_RW_sigmaAPositiveLsc. average / avg_RW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
        //     heart. LA. AmRef = pre(heart. LA. AmRef) * exp(-0.4571 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_LA_sigmaAPositiveNorm. average / avg_LA_sigmaAPositive. average))) / 0.5))) - 0.0433 * log(exp(0.5 * tanh(log(settings. constants. atriumSigmaPAdapt / pre(max_LA_sigmaP. maximum)) / 0.5))) + 1.3028 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_LA_sigmaAPositiveLsc. average / avg_LA_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
        //     heart. RA. AmRef = pre(heart. RA. AmRef) * exp(-0.4571 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_RA_sigmaAPositiveNorm. average / avg_RA_sigmaAPositive. average))) / 0.5))) - 0.0433 * log(exp(0.5 * tanh(log(settings. constants. atriumSigmaPAdapt / pre(max_RA_sigmaP. maximum)) / 0.5))) + 1.3028 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_RA_sigmaAPositiveLsc. average / avg_RA_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
        //   end when;
        //
        //   // Adaptation of reference passive myofiber stress of heart walls
        //   when change(stepCycle) and settings. condition. adaptChamberEcmStress then
        //     heart. ventricles. LW. sigmaPRef = pre(heart. ventricles. LW. sigmaPRef) * exp(-0.3338 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_LW_sigmaAPositiveNorm. average / avg_LW_sigmaAPositive. average))) / 0.5))) + 0.2091 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. LW. EAmRef) / pre(max_LW_sigmaP. maximum)) / 0.5))) - 1.3101 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_LW_sigmaAPositiveLsc. average / avg_LW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
        //     heart. ventricles. SW. sigmaPRef = pre(heart. ventricles. SW. sigmaPRef) * exp(-0.3338 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_SW_sigmaAPositiveNorm. average / avg_SW_sigmaAPositive. average))) / 0.5))) + 0.2091 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. SW. EAmRef) / pre(max_SW_sigmaP. maximum)) / 0.5))) - 1.3101 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_SW_sigmaAPositiveLsc. average / avg_SW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
        //     heart. ventricles. RW. sigmaPRef = pre(heart. ventricles. RW. sigmaPRef) * exp(-0.3338 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_RW_sigmaAPositiveNorm. average / avg_RW_sigmaAPositive. average))) / 0.5))) + 0.2091 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. RW. EAmRef) / pre(max_RW_sigmaP. maximum)) / 0.5))) - 1.3101 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_RW_sigmaAPositiveLsc. average / avg_RW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
        //     heart. LA. sigmaPRef = pre(heart. LA. sigmaPRef) * exp(-0.3338 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_LA_sigmaAPositiveNorm. average / avg_LA_sigmaAPositive. average))) / 0.5))) + 0.2091 * log(exp(0.5 * tanh(log(settings. constants. atriumSigmaPAdapt / pre(max_LA_sigmaP. maximum)) / 0.5))) - 1.3101 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_LA_sigmaAPositiveLsc. average / avg_LA_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
        //     heart. RA. sigmaPRef = pre(heart. RA. sigmaPRef) * exp(-0.3338 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_RA_sigmaAPositiveNorm. average / avg_RA_sigmaAPositive. average))) / 0.5))) + 0.2091 * log(exp(0.5 * tanh(log(settings. constants. atriumSigmaPAdapt / pre(max_RA_sigmaP. maximum)) / 0.5))) - 1.3101 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_RA_sigmaAPositiveLsc. average / avg_RA_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
        //   end when;
        //
        //   // Adaptation of reference volume of pericardium
        //   when change(stepCycle) and settings. condition. adaptPericardium then
        //     heart. VPRef = pre(heart. VPRef) / ((heart. pPRef / pre(max_pP. maximum)) ^ (0.3 / heart. kP));
        //   end when;


          connect(rightHeartInflow, heart.cVSV) annotation (Line(
              points={{-100,40},{-64,40},{-64,38},{-21.32,38},{-21.32,31.44}},
              color={0,0,0},
              thickness=1));
          connect(leftHeartOutflow, heart.cVSA) annotation (Line(
              points={{-100,-20},{-56,-20},{-13.04,-20},{-13.04,40.4}},
              color={0,0,0},
              thickness=1));
          connect(leftHeartInflow, heart.cVPV) annotation (Line(
              points={{100,-20},{60,-20},{12.72,-20},{12.72,38.16}},
              color={0,0,0},
              thickness=1));
          connect(rightHeartOutflow, heart.cVPA) annotation (Line(
              points={{100,40},{100,40},{100,60},{0,60},{0,42.64},{-0.16,42.64}},
              color={0,0,0},
              thickness=1));

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}})), Icon(graphics={Text(
                  extent={{-100,20},{100,100}},
                  lineColor={0,0,0},
                  fontName="Bauhaus 93",
                  textStyle={TextStyle.Bold},
                  textString="COMPLEX")}));
        end Heart;

        model Systemic
          extends Interfaces.Systemic;
            import Cardiovascular.Model.Complex.Components.Auxiliary.Analyzers.*;
          import Physiolibrary.Types.*;
          import Cardiovascular.Model.Complex.Environment.*;

          outer Environment.ComplexEnvironment settings
            "Everything is out there...";

          replaceable Main.SystemicArteries.Original_CircAdapt  SA
                      constrainedby
            Cardiovascular.Model.Complex.Components.Main.SystemicArteries.Abstraction.SystemicArteries
            "Replaceable model of systemic arteries" annotation (
              choicesAllMatching=true, Placement(transformation(
                extent={{-25.149,25.1987},{25.149,-25.1987}},
                origin={60.851,14.8013},
                rotation=180)));
          Main.Vessels.AdaptableVeins SV(
            pRef_init=settings.initialization.SV_pRef,
            ARef_init=settings.initialization.SV_ARef,
            AW_init=settings.initialization.SV_AW,
            l=settings.initialization.SV_l,
            k=settings.initialization.SV_k) annotation (Placement(
                transformation(
                extent={{-25.5,-25.5},{25.5,25.5}},
                origin={-67.5,10.5},
                rotation=180)));
          Main.Vessels.ConsumingCapillaries SC(R(start=settings.initialization.SC_R))
            annotation (Placement(transformation(
                extent={{-30,33},{30,-33}},
                rotation=180,
                origin={-8,19})));

          Averager avg_SV_pInner(
            redeclare type T = Pressure,
            signal=SV.pInner,
            control=settings.stepCycle);
          Averager avg_SA_q(
            redeclare type T = VolumeFlowRate,
            signal=SA.cIn.q,
            control=settings.stepCycle);

        //     input Volume totalVolume;

        //     Volume V_filling( start = 0);
        //
        //     Real q_filling;
        //
        //     parameter Fraction speed_factor = 5;
        //
        //     parameter Volume V_init = 270e-6;

        //   Physiolibrary.Hydraulic.Sources.UnlimitedPump volumeControl(useSolutionFlowInput = true);

        //   Physiolibrary.Hydraulic.Sources.UnlimitedPump volumeControl_(useSolutionFlowInput = true);
        //
        //
        equation
        //   der(V_filling) = q_filling;
        //   q_filling/speed_factor = V_init - V_filling;// - der(V_filling);
        //     volumeControl_.solutionFlow = q_filling;
        //     connect(volumeControl_. q_out, q_in); // Homely component -> disabling vizualization, even for connection

        //   if V_filling < V_init then
        //   else
        //     volumeControl_.solutionFlow = 0;
        //   end if;

          // Setting blood volume to currently desired value
          // It is impractible to set the contents of all small arteries in the tree in other waz
          //   volumeControl. solutionFlow = 0;

          //(settings. condition. bloodVolumeRef * settings. condition. bloodVolumeRefScale - totalVolume) / settings. constants. bloodVolumeAdaptationRate;
        //   connect(volumeControl. q_out, q_in); // Homely component -> disabling vizualization, even for connection


        //   V = SV. V + SA. V;

            //  Adaptatioin of capillary resistance
          when change(settings.stepCycle) and settings.condition.adaptCapillaryResistance then
            reinit(SC.R, (settings.condition.aortalPressureRef - avg_SV_pInner.average)
              /settings.condition.aortalFlowRef*settings.constants.systemicResistanceScale);
          end when;

          connect(SC.cOut, SV.cIn) annotation (Line(
              points={{-32,19},{-32,19},{-46.1,19},{-46.1,10.5},{-47.1,10.5}},
              color={180,56,148},
              thickness=1,
              smooth=Smooth.Bezier));
          connect(SC.pOut, SV.pInner) annotation (Line(
              points={{-19.7,0.19},{-47.5,0.19},{-47.5,13.05},{-67.5,13.05}},
              color={0,0,127},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(SC.cIn, SA.cOut) annotation (Line(
              points={{16,19},{16,22},{40.7318,22},{40.7318,14.8013}},
              color={255,0,0},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(SA.pInner, SC.pIn) annotation (Line(
              points={{60.851,12.2814},{60.851,12.2814},{60.851,14},{3.7,14},{
                  3.7,0.19}},
              color={0,0,127},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(q_in, SA.cIn) annotation (Line(
              points={{100,0},{100,0},{100,2},{100,14.8013},{80.9702,14.8013}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.Bezier));

          connect(q_out, SV.cOut) annotation (Line(
              points={{-100,0},{-96,0},{-96,10},{-90,10},{-90,10.5},{-87.9,10.5}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.Bezier));

          connect(AortaCannulla, SA.cCannula) annotation (Line(
              points={{70,-90},{74,-90},{74,11.7775},{75.9404,11.7775}},
              color={0,0,0},
              thickness=1));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics={Text(
                  extent={{-24,42},{6,52}},
                  lineColor={0,0,0},
                  lineThickness=1,
                  fillColor={255,0,0},
                  fillPattern=FillPattern.Solid,
                  textStyle={TextStyle.Bold},
                          textString="Systemic Circuit")}), Icon(graphics={Text(
                  extent={{-100,20},{100,100}},
                  lineColor={0,0,0},
                  fontName="Bauhaus 93",
                  textStyle={TextStyle.Bold},
                  textString="COMPLEX"), Polygon(
                  points={{52,4},{52,-24},{64,-92},{66,-84},{56,-22},{52,4}},
                  lineColor={28,108,200},
                  fillColor={28,108,200},
                  fillPattern=FillPattern.Solid)}));
        end Systemic;

        model Pulmonary
          extends Interfaces.Pulmonary;
          import Cardiovascular.Model.Complex.Components.Auxiliary.Analyzers.*;
          import Physiolibrary.Types.*;
          import Cardiovascular.Model.Complex.Environment.*;

          outer Environment.ComplexEnvironment settings
            "Everything is out there...";




          Main.Vessels.AdaptableArteries PA(
            pRef_init=settings.initialization.PA_pRef,
            ARef_init=settings.initialization.PA_ARef,
            AW_init=settings.initialization.PA_AW,
            l=settings.initialization.PA_l,
            k=settings.initialization.PA_k) annotation (Placement(
                transformation(extent={{-17.2253,-19.9627},{17.2253,19.9627}},
                origin={-67.3498,0.6412})));
          Main.Vessels.AdaptableVeins PV(
            pRef_init=settings.initialization.PV_pRef,
            ARef_init=settings.initialization.PV_ARef,
            AW_init=settings.initialization.PV_AW,
            l=settings.initialization.PV_l,
            k=settings.initialization.PV_k) annotation (Placement(
                transformation(
                extent={{19.5906,23.336},{-19.5906,-23.336}},
                origin={61.2282,1.6095},
                rotation=180)));
          Main.Vessels.OxygenatingCapillaries PC(R(start=settings.initialization.PC_R),
              nonlinearity=settings.condition.pulmonaryPressureDropRef/PC.dp)
            annotation (Placement(transformation(extent={{-28,-16},{6,14}})));


        protected
            Averager avg_PC_q(
            redeclare type T = VolumeFlowRate,
            signal=PC.cIn.q,
            control=settings.stepCycle);

            Averager avg_PC_dp(
            redeclare type T = Pressure,
            signal=PC.dp,
            control=settings.stepCycle);

          Averager avg_PA_q(
            redeclare type T = VolumeFlowRate,
            signal=PA.cIn.q,
            control=settings.stepCycle);
          Averager avg_PV_q(
            redeclare type T = VolumeFlowRate,
            signal=PV.cIn.q,
            control=settings.stepCycle);
        equation

        //   V = PV. V + PA. V;

            //  Adaptatioin of capillary resistance
          when change(settings.stepCycle) and settings.condition.adaptCapillaryResistance then
            reinit(PC.R_R, settings.condition.pulmonaryPressureDropRef/avg_PC_q.average);
          end when;


          connect(PA.cOut, PC.cIn) annotation (Line(
              points={{-53.5696,0.6412},{-53.5696,-1},{-24.6,-1}},
              color={102,6,44},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(PC.cOut, PV.cIn) annotation (Line(
              points={{2.6,-1},{45.5557,-1},{45.5557,1.6095}},
              color={255,0,0},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(PA.pInner, PC.pIn) annotation (Line(
              points={{-67.3498,-1.35507},{-67.3498,-17.3551},{-42,-17.3551},{-42,
                  -9.55},{-17.63,-9.55}},
              color={0,0,127},
              smooth=Smooth.Bezier,
              thickness=0.5));
          connect(PC.pOut, PV.pInner) annotation (Line(
              points={{-4.37,-9.55},{-4.37,-8},{-4,-8},{28,-8},{28,-18},{46,-18},
                  {46,-0.7241},{61.2282,-0.7241}},
              color={0,0,127},
              smooth=Smooth.Bezier,
              thickness=0.5));
          connect(q_in, PA.cIn) annotation (Line(
              points={{-100,0},{-90,0},{-90,0.6412},{-81.13,0.6412}},
              color={0,0,0},
              thickness=1));
          connect(q_out, PV.cOut) annotation (Line(
              points={{100,0},{90,0},{90,1.6095},{76.9007,1.6095}},
              color={0,0,0},
              thickness=1));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics={Text(
                  extent={{-26,8},{4,18}},
                  lineColor={0,0,0},
                  lineThickness=1,
                  fillColor={255,0,0},
                  fillPattern=FillPattern.Solid,
                  textString="Pulmonary Circuit",
                          textStyle={TextStyle.Bold})}), Icon(graphics={Text(
                  extent={{-100,20},{100,100}},
                  lineColor={0,0,0},
                  fontName="Bauhaus 93",
                  textStyle={TextStyle.Bold},
                  textString="COMPLEX")}));
        end Pulmonary;

        model HeartCannulated
          extends Heart(redeclare Main.Heart.HeartLVCannulated heart);
        end HeartCannulated;
      end Components;

      model Cardio
        extends Cardiovascular.System(
          redeclare Components.Pulmonary  pulmonaryCirculation,
          redeclare Components.Heart heart,
          redeclare Components.Systemic systemicCirculation(redeclare
              Components.Main.SystemicArteries.Original_CircAdapt SA));
          extends Cardiovascular.Icons.Runnable_System;
        import Cardiovascular.Model.Complex.Components.Auxiliary.Analyzers.*;
        import Cardiovascular.Constants.*;
        import Cardiovascular.Types.*;
        import Physiolibrary.Hydraulic.Sources.*;
        import Physiolibrary.Types.*;

        inner Environment.ComplexEnvironment settings(
          redeclare Environment.Supports.No supports,
          redeclare Environment.Conditions.Rest_MinimalAdapt condition,
          redeclare Environment.Initialization.PhysiologicalAdapted
            initialization,
          redeclare Environment.ModelConstants.Standard constants)
          annotation (Placement(transformation(extent={{-22,26},{-6,40}})));

      // protected
      //   Averager avg_V(
      //     redeclare type T = Volume,
      //     signal = V,
      //     control = settings. stepCycle);

        Components.Main.ECMO.ECMO ecmo(
          cycleDuration=settings.supports.ECMO_cycleDuration,
          pulseDuration=settings.supports.ECMO_pulseDuration,
          pulseShapeRef=settings.supports.ECMO_pulseShapeRef,
          qMeanRef=settings.supports.ECMO_qMeanRef,
          isEnabled=settings.supports.ECMO_isEnabled)
          annotation (Placement(transformation(extent={{-12,-72},{12,-48}})));
      equation
        connect(systemicCirculation.q_out, heart.rightHeartInflow) annotation (
            Line(
            points={{-10,-26},{-14,-26},{-14,-1.6},{-9.84,-1.6}},
            color={0,0,0},
            thickness=1));
        connect(systemicCirculation.q_out, ecmo.cIn) annotation (Line(
            points={{-10,-26},{-14,-26},{-14,-60},{-9.6,-60}},
            color={0,0,0},
            thickness=1));
        connect(systemicCirculation.AortaCannulla, ecmo.cOut) annotation (Line(
            points={{7,-35},{14,-35},{14,-60},{9.6,-60}},
            color={0,0,0},
            thickness=1));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-20,-80},{
                  20,40}})),
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-20,-80},
                  {20,40}})),
          experiment(
            StartTime=400,
            StopTime=415,
            Tolerance=1e-006,
            __Dymola_Algorithm="Sdirk34hw"));
      end Cardio;
      annotation (Documentation(info="<html>
<p>Complex combined model, as presented in [1], made compatible with the simple models.</p>
<p><br><span style=\"font-family: Times New Roman; font-size: 10pt;\"><a name=\"docs-internal-guid-c7f7882d-1492-9270-5abc-b09ff77c8742\">[</a><span style=\"background-color: #000000;\">1]	<a href=\"http://paperpile.com/b/74sbye/FfEpD\">Kaleck&yacute; K. Relationship of heart&rsquo;s pumping function and pressure-flow patterns in reduced arterial tree. Czech Technical Unversity; 2015.</a> Available at </span>https://dspace.cvut.cz/bitstream/handle/10467/61792/F3-DP-2015-Kalecky-Karel-Karel&percnt;20Kalecky&percnt;20-&percnt;20Relationship&percnt;20of&percnt;20Heart&percnt;27s&percnt;20Pumping&percnt;20Function&percnt;20and&percnt;20Pressure-Flow&percnt;20Patterns&percnt;20in&percnt;20Reduced&percnt;20Arterial&percnt;20Tree&percnt;20&percnt;282015&percnt;29.pdf</p>
</html>"));
    end Complex;

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
  redBloodCells.RBC.state:=redBloodCells.InitialPopulation.y;")}), Icon(
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
  end Model;

  package Constants "Physical constants used in the model"
    import Physiolibrary.Types.*;

    constant Density rho=1060 "Density of blood";
    constant Real mu=0.004 "Dynamic viscosity of blood";

  end Constants;

  package Types
    package Constants
      block FrequencyControl "External signal of type Frequency"
        Physiolibrary.Types.RealIO.FrequencyOutput y
          "HydraulicCompliance constant" annotation (Placement(transformation(
                extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},
                  {60,10}})));
        Physiolibrary.Types.RealIO.FrequencyInput c annotation (Placement(
              transformation(extent={{-40,-20},{0,20}}), iconTransformation(
                extent={{-40,-20},{0,20}})));
        parameter Physiolibrary.Types.Frequency k;
        //ignored for this component
        //TODO add switch between constant default signal and input control signal
      equation
        y = c;
        annotation (
          defaultComponentName="hydraulicCompliance",
          Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
          Icon(coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=
                 false), graphics={Rectangle(
                      extent={{-40,40},{40,-40}},
                      lineColor={0,0,0},
                      radius=10,
                      fillColor={236,236,236},
                      fillPattern=FillPattern.Solid),Text(
                      extent={{-100,-44},{100,-64}},
                      lineColor={0,0,0},
                      fillColor={236,236,236},
                      fillPattern=FillPattern.Solid,
                      textString="%name")}));
      end FrequencyControl;
    end Constants;

    type Area = Modelica.SIunits.Area (displayUnit="cm2",nominal=1e-4)
      "Type for area";
    type Length = Modelica.SIunits.Length (displayUnit="cm",nominal=1e-2)
      "Type for length and radius";
    type PulseShape = enumeration(
        pulseless,
        parabolic,
        square) "Reference shape of ECMO pulse";
    type CannulaPlacement = enumeration(
        ascendingAorta,
        aorticArch1,
        aorticArch2,
        thoracicAorta1,
        thoracicAorta2) "Location of inserted ECMO cannula";
    package IO "Real types as input and output connectors"
      import Physiolibrary.Types.*;

      connector HydraulicResistanceInput = input HydraulicResistance
        "Input HydraulicResistance as connector" annotation (
        defaultComponentName="resistance",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                    fillPattern=FillPattern.Solid)}, coordinateSystem(
            extent={{-100,-100},{100,100}},
            preserveAspectRatio=true,
            initialScale=0.2)),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                    fillPattern=FillPattern.Solid),Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type HydraulicResistance.
    </p>
    </html>"));

      connector HydraulicResistanceOutput = output HydraulicResistance
        "Output HydraulicResistance as connector" annotation (
        defaultComponentName="resistance",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type HydraulicResistance.
  </p>
  </html>"));

    end IO;
  end Types;

  package Icons
    model Arteries

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Bitmap(
                  extent={{-87.243,-87.3037},{87.243,87.3037}},
                  fileName=
                "modelica://Cardiovascular/Resources/Icons/Arteries.png",
              origin={4.25124,18.8661},
                  rotation=75)}), Diagram(coordinateSystem(preserveAspectRatio=
                false)));

    end Arteries;

    class Atrium

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Bitmap(extent={{-100,-100},{100,100}}, fileName=
              "modelica://Cardiovascular/Resources/Icons/Atrium.png")}),
          Diagram(coordinateSystem(preserveAspectRatio=false)));
    end Atrium;

    class Cardio

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Bitmap(extent={{-100,-100},{100,100}}, fileName=
              "modelica://Cardiovascular/Resources/Icons/Cardio.png"),Bitmap(
              extent={{-50,-38},{52,62}}, fileName=
              "modelica://Cardiovascular/Resources/Icons/Cross.png")}), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Cardio;

    class ECMO

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Bitmap(extent={{-100,-100},{100,100}}, fileName=
                  "modelica://Cardiovascular/Resources/Icons/ECMO.png")}),
          Diagram(coordinateSystem(preserveAspectRatio=false)));
    end ECMO;

    class Heart_detailed

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Bitmap(extent={{-100,-100},{100,100}}, fileName=
              "modelica://Cardiovascular/Resources/Icons/Heart_detailed.png")}),
          Diagram(coordinateSystem(preserveAspectRatio=false)));
    end Heart_detailed;

    class O2

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Bitmap(extent={{-100,-100},{100,100}}, fileName=
              "modelica://Cardiovascular/Resources/Icons/O2.png")}), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end O2;

    class Screw

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Bitmap(
              extent={{-100,-100},{100,100}},
                  fileName=
                "modelica://Cardiovascular/Resources/Icons/Screw.png",
              origin={2,-4},
              rotation=90)}), Diagram(coordinateSystem(preserveAspectRatio=
                false)));
    end Screw;

    class Settings

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Bitmap(extent={{-100,-100},{100,100}}, fileName=
                  "modelica://Cardiovascular/Resources/Icons/Settings.png")}),
          Diagram(coordinateSystem(preserveAspectRatio=false)));
    end Settings;

      class Valve

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Bitmap(extent={{-100,-100},{100,100}}, fileName=
              "modelica://Cardiovascular/Resources/Icons/Valve.png")}), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
      end Valve;

      class Ventricle

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Bitmap(extent={{-100,-100},{100,100}}, fileName=
              "modelica://Cardiovascular/Resources/Icons/Ventricle.png")}),
          Diagram(coordinateSystem(preserveAspectRatio=false)));
      end Ventricle;

      class Vessels

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Bitmap(
              extent={{-130.465,-88.1195},{130.465,88.1195}},
              origin={0.99971,8.9994},
              rotation=-68,
                  fileName=
                "modelica://Cardiovascular/Resources/Icons/Vessels.png")}),
          Diagram(coordinateSystem(preserveAspectRatio=false)));

      end Vessels;

    model Runnable_System

      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-20,-40},{
                20,40}}), graphics),
        Icon(coordinateSystem(extent={{-20,-40},{20,40}}, preserveAspectRatio=
                false), graphics={
            Text(
              extent={{-40,-42},{40,-50}},
              lineColor={0,0,255},
              textString="%name"),
            Ellipse(lineColor={75,138,73}, extent={{-20,-20},{20,20}}),
            Polygon(
              lineColor={0,0,255},
              fillColor={75,138,73},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              points={{-8,12},{12,0},{-8,-12},{-8,12}})}),
        Documentation(info="<html>
<p>Architectural model of cardiovascular subsystems. The partial subsystems are meant to be redeclared by the implemented submodels.</p>
</html>"));
    end Runnable_System;

    model Runnable_Shallow
      annotation (
        Diagram(coordinateSystem(extent={{-280,-140},{280,180}},
              preserveAspectRatio=false), graphics),
        Icon(coordinateSystem(extent={{-280,-140},{280,180}},
              preserveAspectRatio=false), graphics={Ellipse(
                  lineColor={75,138,73},
                    fillColor={255,255,255},
                  fillPattern=FillPattern.Solid,
                  extent={{-156,-140},{164,180}}),Polygon(
                  lineColor={0,0,255},
                  fillColor={75,138,73},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.Solid,
                    points={{-68,118},{104,16},{-68,-82},{-68,118}})}),
        experiment(StopTime=5, __Dymola_NumberOfIntervals=5000),
        Documentation(info="<html>
<p>Cardiovascular model implemented per description of Meurs et al.</p>
<p>[9] J. A. Goodwin, W. L. van Meurs, C. D. S a Couto, J. E. W. Beneken, S. A. Graves, A Model for Educational Simulation of Infant Cardiovascular Physiology, Anesthesia &AMP; Analgesia 99 (6) (2004) 1655&ndash;1664. doi:10.1213/01.ANE.0000134797.52793.AF.</p>
<p>[10] C. D. S a Couto, W. L. van Meurs, J. A. Goodwin, P. Andriessen, A Model for Educational Simulation of Neonatal Cardiovascular Pathophysiology, Simulation in Healthcare 1 (Inaugural) (2006) 4&ndash;12.</p>
<p>[11] W. van Meurs, Modeling and Simulation in Biomedical Engineering: Applications in Cardiorespiratory Physiology, McGraw-Hill Professional, 2011.</p>
</html>"));
    end Runnable_Shallow;
  end Icons;

  package Experiments

    model CatheterDataFitting
      Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR LongerDrain(r=0.0018,
          l=0.31)
        annotation (Placement(transformation(extent={{42,2},{22,22}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(
          useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-30,22},{-10,2}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume
        annotation (Placement(transformation(extent={{100,-20},{80,0}})));
      Modelica.Blocks.Sources.Ramp ramp(height=0.00012,duration=1)
        annotation (Placement(transformation(extent={{-88,-12},{-68,8}})));
      Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR ShorterOutflow(l=0.22,
          r=0.0014)
        annotation (Placement(transformation(extent={{44,-26},{24,-6}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump1(
          useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-30,-26},{-10,-6}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump2(
          useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-28,72},{-8,52}})));
      Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR LVDrainExtension(l=1.2,
          r=0.0018)
        annotation (Placement(transformation(extent={{44,52},{24,72}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump3(
          useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-28,98},{-8,78}})));
      Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR VenousDrain(l=0.33, r=
            0.0021)
        annotation (Placement(transformation(extent={{42,78},{22,98}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump ECMOExp(
          useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-30,-170},{-10,-150}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump4(
          useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-22,-76},{-2,-96}})));
      Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
        LVDrainExp(Base=5.53E+11, Exp=1.771662)
        annotation (Placement(transformation(extent={{28,-96},{48,-76}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump5(
          useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-22,-50},{-2,-70}})));
      Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
        VenousDrainExp(Base=6.2e11, Exp=1.855311)
        annotation (Placement(transformation(extent={{28,-70},{48,-50}})));
      Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
        VenousDrainECMOExp(Base=6.2e11, Exp=1.855311)
        annotation (Placement(transformation(extent={{20,-168},{40,-148}})));
      Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
        LVDrainECMOExp(Exp=1.771662, Base=4*5.53E+11)
        annotation (Placement(transformation(extent={{40,-192},{20,-172}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump ECMOLin(
          useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-32,-216},{-12,-196}})));
      Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR LVDrainECMOLin(l=1.2,
          r=0.0018)
        annotation (Placement(transformation(extent={{40,-240},{20,-220}})));
      Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR VenousDrainECMOLin(l=
            0.33, r=0.0021)
        annotation (Placement(transformation(extent={{40,-214},{20,-194}})));
    equation
      connect(ramp.y, unlimitedPump.solutionFlow)
        annotation (Line(points={{-67,-2},{-20,-2},{-20,5}}, color={0,0,127}));
      connect(unlimitedPump.q_out, LongerDrain.cOut) annotation (Line(
          points={{-10,12},{24,12}},
          color={0,0,0},
          thickness=1));
      connect(LongerDrain.cIn, unlimitedVolume.y) annotation (Line(points={{40,
              12},{60,12},{60,-10},{80,-10}}, color={127,0,0}));
      connect(ShorterOutflow.cIn, unlimitedVolume.y) annotation (Line(points={{
              42,-16},{62,-16},{62,-10},{80,-10}}, color={127,0,0}));
      connect(unlimitedPump1.q_out, ShorterOutflow.cOut) annotation (Line(
          points={{-10,-16},{26,-16}},
          color={0,0,0},
          thickness=1));
      connect(unlimitedPump1.solutionFlow, unlimitedPump.solutionFlow)
        annotation (Line(points={{-20,-9},{-32,-9},{-32,-2},{-20,-2},{-20,5}},
            color={0,0,127}));
      connect(ramp.y, unlimitedPump2.solutionFlow) annotation (Line(points={{-67,
              -2},{-42,-2},{-42,55},{-18,55}}, color={0,0,127}));
      connect(unlimitedPump2.q_out, LVDrainExtension.cOut) annotation (Line(
          points={{-8,62},{26,62}},
          color={0,0,0},
          thickness=1));
      connect(LVDrainExtension.cIn, unlimitedVolume.y) annotation (Line(points=
              {{42,62},{56,62},{56,60},{80,60},{80,-10}}, color={127,0,0}));
      connect(unlimitedPump3.q_out, VenousDrain.cOut) annotation (Line(
          points={{-8,88},{24,88}},
          color={0,0,0},
          thickness=1));
      connect(VenousDrain.cIn, unlimitedVolume.y) annotation (Line(points={{40,
              88},{56,88},{56,86},{80,86},{80,-10}}, color={127,0,0}));
      connect(unlimitedPump3.solutionFlow, unlimitedPump2.solutionFlow)
        annotation (Line(points={{-18,81},{-18,55}}, color={0,0,127}));
      connect(ramp.y, unlimitedPump4.solutionFlow) annotation (Line(points={{-67,
              -2},{-46,-2},{-46,-93},{-12,-93}}, color={0,0,127}));
      connect(unlimitedPump5.solutionFlow, unlimitedPump4.solutionFlow)
        annotation (Line(points={{-12,-67},{-12,-70},{-2,-70},{-2,-74},{-12,-74},
              {-12,-93}}, color={0,0,127}));
      connect(ECMOExp.solutionFlow, unlimitedPump4.solutionFlow) annotation (
          Line(
          points={{-20,-153},{-14,-153},{-14,-93},{-12,-93}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(unlimitedPump5.q_out, VenousDrainExp.cIn) annotation (Line(
          points={{-2,-60},{30,-60}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(unlimitedPump4.q_out, LVDrainExp.cIn) annotation (Line(
          points={{-2,-86},{30,-86}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(ECMOExp.q_out, VenousDrainECMOExp.cIn) annotation (Line(
          points={{-10,-160},{8,-160},{8,-158},{22,-158}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(VenousDrainECMOExp.cOut, LVDrainExp.cOut) annotation (Line(
          points={{38,-158},{46,-158},{46,-86}},
          color={229,133,64},
          smooth=Smooth.Bezier));
      connect(LVDrainExp.cOut, VenousDrainExp.cOut) annotation (Line(
          points={{46,-86},{46,-60}},
          color={229,133,64},
          smooth=Smooth.Bezier));
      connect(VenousDrainExp.cOut, unlimitedVolume.y) annotation (Line(
          points={{46,-60},{66,-60},{66,-10},{80,-10}},
          color={229,133,64},
          smooth=Smooth.Bezier));
      connect(ECMOLin.solutionFlow, ECMOExp.solutionFlow) annotation (Line(
          points={{-22,-199},{-22,-153},{-20,-153}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(LVDrainECMOLin.cIn, unlimitedVolume.y) annotation (Line(points={{
              38,-230},{80,-230},{80,-10}}, color={127,0,0}));
      connect(VenousDrainECMOLin.cIn, unlimitedVolume.y) annotation (Line(
            points={{38,-204},{80,-204},{80,-10}}, color={127,0,0}));
      connect(ECMOLin.q_out, VenousDrainECMOLin.cOut) annotation (Line(
          points={{-12,-206},{22,-206},{22,-204}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(ECMOLin.q_out, LVDrainECMOLin.cOut) annotation (Line(
          points={{-12,-206},{4,-206},{4,-230},{22,-230}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(ECMOExp.q_out, LVDrainECMOExp.cOut) annotation (Line(
          points={{-10,-160},{6,-160},{6,-182},{22,-182}},
          color={0,0,0},
          thickness=1));
      connect(LVDrainECMOExp.cIn, VenousDrainECMOExp.cOut)
        annotation (Line(points={{38,-182},{38,-158}}, color={127,0,0}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -240},{100,100}})), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-240},{100,100}}),
            graphics={Polygon(
                  points={{-44,44},{-44,-36},{76,-36},{76,44},{-44,44}},
              lineColor={28,108,200},
              lineThickness=1,
              fillPattern=FillPattern.Sphere,
                  fillColor={255,255,255}),Text(
              extent={{-44,28},{58,38}},
              lineColor={28,108,200},
              lineThickness=1,
              fillPattern=FillPattern.Sphere,
              fillColor={255,255,255},
                  textString="Maquet catheter"),Polygon(
                  points={{-50,-40},{-50,-120},{70,-120},{70,-40},{-50,-40}},
                  lineColor={28,108,200},
                  lineThickness=1,
                  fillPattern=FillPattern.Sphere,
                  fillColor={255,255,255}),Text(
                  extent={{-42,-114},{60,-104}},
                  lineColor={28,108,200},
                  lineThickness=1,
                  fillPattern=FillPattern.Sphere,
                  fillColor={255,255,255},
                  textString="Non-linear venous drain and LV drain catheters"),
              Polygon(
                  points={{-48,-122},{-48,-190},{72,-190},{72,-122},{-48,-122}},
                  lineColor={28,108,200},
                  lineThickness=1,
                  fillPattern=FillPattern.Sphere,
                  fillColor={255,255,255}),Polygon(
                  points={{-52,-198},{-52,-266},{68,-266},{68,-198},{-52,-198}},
                  lineColor={28,108,200},
                  lineThickness=1,
                  fillPattern=FillPattern.Sphere,
                  fillColor={255,255,255}),Text(
                  extent={{-46,-138},{56,-128}},
                  lineColor={28,108,200},
                  lineThickness=1,
                  fillPattern=FillPattern.Sphere,
                  fillColor={255,255,255},
                  textString="Non-linear venous drain divider"),Text(
                  extent={{-44,-264},{58,-254}},
                  lineColor={28,108,200},
                  lineThickness=1,
                  fillPattern=FillPattern.Sphere,
                  fillColor={255,255,255},
                  textString="Linear venous drain divider")}));
    end CatheterDataFitting;

    model LVUnloading
      extends Cardiovascular.System(
        redeclare Model.Smith2004.Parts.Pulmonary    pulmonaryCirculation,
        redeclare Model.Smith2004.Parts.Heart              heart(useLVCannula=
              true),
        redeclare Model.Smith2004.Parts.Systemic    systemicCirculation(
            useAortalCanulla=true));
      extends Cardiovascular.Icons.Runnable_System;
      import Cardiovascular.Model.Complex.Components.Auxiliary.Analyzers.*;
      import Cardiovascular.Constants.*;
      import Cardiovascular.Types.*;
      import Physiolibrary.Hydraulic.Sources.*;
      import Physiolibrary.Types.*;
      inner Model.Complex.Environment.ComplexEnvironment settings(redeclare
          Model.Complex.Environment.Conditions.Rest_MinimalAdapt condition)
        annotation (Placement(transformation(extent={{-20,34},{-14,40}})));

      // protected
      //   Averager avg_V(
      //     redeclare type T = Volume,
      //     signal = V,
      //     control = settings. stepCycle);

    equation
      connect(systemicCirculation.q_out, heart.rightHeartInflow) annotation (
          Line(
          points={{-10,-26},{-14,-26},{-14,-1.6},{-9.84,-1.6}},
          color={0,0,0},
          thickness=1));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-20,-80},{20,
                40}})),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-20,-80},{
                20,40}})),
        experiment(
          StopTime=15,
          Tolerance=1e-006,
          __Dymola_Algorithm="Sdirk34hw"));
    end LVUnloading;

    package LVUnload_states
      model Healthy_noEcmo
        extends LVUnloading;
        annotation (experiment(
            StopTime=15,
            Tolerance=1e-006,
            __Dymola_Algorithm="Sdirk34hw"));
      end Healthy_noEcmo;

      model LVFailure_noEcmo
        extends LVUnloading(settings(redeclare
              Model.Complex.Environment.ModelConstants.LVFailure constants));
        annotation (experiment(StopTime=15, __Dymola_Algorithm="Sdirk34hw"));
      end LVFailure_noEcmo;

      model LVFailure_Ecmo
        extends LVUnloading(settings(redeclare
              Model.Complex.Environment.ModelConstants.LVFailure constants,
              redeclare Model.Complex.Environment.Supports.ECMO_Nonpulsatile
              supports));
        Model.Complex.Components.Main.ECMO.ECMO_bare ecmo(
          cycleDuration=settings.supports.ECMO_cycleDuration,
          pulseDuration=settings.supports.ECMO_pulseDuration,
          pulseShapeRef=settings.supports.ECMO_pulseShapeRef,
          qMeanRef=settings.supports.ECMO_qMeanRef,
          isEnabled=settings.supports.ECMO_isEnabled,
          ecmoPump(qRef2=1.6666666666667e-06))
          annotation (Placement(transformation(extent={{-12,-72},{12,-48}})));
        Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR arterialInfusion(l=
              0.22, r=0.0021) annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={18,-46})));
        Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
          VenousDrainECMOExp(Base=6.2e11, Exp=1.855311) annotation (Placement(
              transformation(
              extent={{4,4},{-4,-4}},
              rotation=90,
              origin={-12,-46})));
      equation
        connect(VenousDrainECMOExp.cOut, ecmo.cIn) annotation (Line(
            points={{-12,-49.2},{-12,-60},{-9.6,-60}},
            color={28,108,200},
            thickness=1));
        connect(systemicCirculation.q_out, VenousDrainECMOExp.cIn) annotation (
            Line(
            points={{-10,-26},{-12,-26},{-12,-42.8}},
            color={28,108,200},
            thickness=1));
        connect(systemicCirculation.AortaCannulla, arterialInfusion.cOut)
          annotation (Line(
            points={{7,-35},{18,-35},{18,-42.8}},
            color={217,67,180},
            thickness=1));
        connect(ecmo.cOut, arterialInfusion.cIn) annotation (Line(
            points={{9.6,-60},{18,-60},{18,-49.2}},
            color={217,67,180},
            thickness=1));
        annotation (experiment(StopTime=15, __Dymola_Algorithm="Cvode"));
      end LVFailure_Ecmo;

      model LVFailure_Ecmo_LVDrain
        extends LVUnloading(settings(redeclare
              Model.Complex.Environment.ModelConstants.LVFailure constants,
              redeclare Model.Complex.Environment.Supports.ECMO_Nonpulsatile
              supports));
        Model.Complex.Components.Main.ECMO.ECMO_bare ecmo(
          cycleDuration=settings.supports.ECMO_cycleDuration,
          pulseDuration=settings.supports.ECMO_pulseDuration,
          pulseShapeRef=settings.supports.ECMO_pulseShapeRef,
          isEnabled=settings.supports.ECMO_isEnabled,
          qMeanRef(displayUnit="l/min") = 8.3333333333333e-05)
          annotation (Placement(transformation(extent={{-12,-72},{12,-48}})));
        Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR arterialInfusion(l=
              0.22, r=0.0021) annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={18,-46})));
        Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR VenousDrainECMOLin(l=
             0.33, r=0.0021) annotation (Placement(transformation(
              extent={{4,-4},{-4,4}},
              rotation=90,
              origin={-12,-46})));
        Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR LVDrainECMOLin(l=1.2,
            r=0.0018) annotation (Placement(transformation(
              extent={{4,-4},{-4,4}},
              rotation=90,
              origin={14,-46})));
      equation

        connect(systemicCirculation.AortaCannulla, arterialInfusion.cOut)
          annotation (Line(
            points={{7,-35},{18,-35},{18,-42.8}},
            color={217,67,180},
            thickness=1));
        connect(ecmo.cOut, arterialInfusion.cIn) annotation (Line(
            points={{9.6,-60},{18,-60},{18,-49.2}},
            color={217,67,180},
            thickness=1));
        connect(VenousDrainECMOLin.cIn, systemicCirculation.q_out) annotation (
            Line(
            points={{-12,-42.8},{-12,-26},{-10,-26}},
            color={28,108,200},
            thickness=1));
        connect(VenousDrainECMOLin.cOut, ecmo.cIn) annotation (Line(
            points={{-12,-49.2},{-12,-60},{-9.6,-60}},
            color={28,108,200},
            thickness=1));
        connect(heart.LVCannula, LVDrainECMOLin.cIn) annotation (Line(
            points={{4.56,-4.8},{4.56,-4},{14,-4},{14,-42.8}},
            color={28,108,200},
            thickness=1));
        connect(LVDrainECMOLin.cOut, ecmo.cIn) annotation (Line(
            points={{14,-49.2},{14,-52},{-12,-52},{-12,-60},{-9.6,-60}},
            color={28,108,200},
            thickness=1));
        annotation (experiment(StopTime=15, __Dymola_Algorithm="Cvode"));
      end LVFailure_Ecmo_LVDrain;

      model LVFailure_Ecmo_LVDrainNonLin
        extends LVUnloading(settings(redeclare
              Model.Complex.Environment.ModelConstants.LVFailure constants,
              redeclare Model.Complex.Environment.Supports.ECMO_Nonpulsatile
              supports));
        Model.Complex.Components.Main.ECMO.ECMO_bare ecmo(
          cycleDuration=settings.supports.ECMO_cycleDuration,
          pulseDuration=settings.supports.ECMO_pulseDuration,
          pulseShapeRef=settings.supports.ECMO_pulseShapeRef,
          isEnabled=settings.supports.ECMO_isEnabled,
          qMeanRef(displayUnit="l/min") = 1.6666666666667e-06,
          ecmoPump(qRef2=8.3333333333333e-05))
          annotation (Placement(transformation(extent={{-12,-72},{12,-48}})));
        Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR arterialInfusion(l=
              0.22, r=0.0021) annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={18,-46})));
        Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
          VenousDrainECMOExp(Base=6.2e11, Exp=1.855311) annotation (Placement(
              transformation(
              extent={{4,4},{-4,-4}},
              rotation=90,
              origin={-12,-46})));
        Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
          LVDrainECMOExp(Exp=1.771662, Base=4*5.53E+11) annotation (Placement(
              transformation(
              extent={{4,4},{-4,-4}},
              rotation=90,
              origin={14,-46})));


      equation

        connect(systemicCirculation.AortaCannulla, arterialInfusion.cOut)
          annotation (Line(
            points={{7,-35},{18,-35},{18,-42.8}},
            color={217,67,180},
            thickness=1));
        connect(ecmo.cOut, arterialInfusion.cIn) annotation (Line(
            points={{9.6,-60},{18,-60},{18,-49.2}},
            color={217,67,180},
            thickness=1));
        connect(VenousDrainECMOExp.cIn, systemicCirculation.q_out) annotation (
            Line(
            points={{-12,-42.8},{-12,-26},{-10,-26}},
            color={28,108,200},
            thickness=1));
        connect(VenousDrainECMOExp.cOut, ecmo.cIn) annotation (Line(
            points={{-12,-49.2},{-12,-60},{-9.6,-60}},
            color={28,108,200},
            thickness=1));
        connect(heart.LVCannula, LVDrainECMOExp.cIn) annotation (Line(
            points={{0.88,-3.52},{0.88,-4},{14,-4},{14,-42.8}},
            color={28,108,200},
            thickness=1));
        connect(LVDrainECMOExp.cOut, ecmo.cIn) annotation (Line(
            points={{14,-49.2},{14,-52},{-12,-52},{-12,-60},{-9.6,-60}},
            color={28,108,200},
            thickness=1));
        annotation (experiment(StopTime=15, __Dymola_Algorithm="Cvode"));
      end LVFailure_Ecmo_LVDrainNonLin;

      model LVFailure_Ecmo_LVDrainNonLin10Fr
        extends LVUnloading(settings(redeclare
              Model.Complex.Environment.ModelConstants.LVFailure constants,
              redeclare Model.Complex.Environment.Supports.ECMO_Nonpulsatile
              supports));
        Model.Complex.Components.Main.ECMO.ECMO_bare ecmo(
          cycleDuration=settings.supports.ECMO_cycleDuration,
          pulseDuration=settings.supports.ECMO_pulseDuration,
          pulseShapeRef=settings.supports.ECMO_pulseShapeRef,
          isEnabled=settings.supports.ECMO_isEnabled,
          qMeanRef(displayUnit="l/min") = 1.6666666666667e-06,
          ecmoPump(qRef2=8.3333333333333e-05))
          annotation (Placement(transformation(extent={{-12,-72},{12,-48}})));
        Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR arterialInfusion(l=
              0.22, r=0.0021) annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={18,-46})));
        Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
          VenousDrainECMOExp(Base=6.2e11, Exp=1.855311) annotation (Placement(
              transformation(
              extent={{4,4},{-4,-4}},
              rotation=90,
              origin={-12,-46})));
        Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
          LVDrainECMOExp(Base=1.22E+14, Exp=1.919743)   annotation (Placement(
              transformation(
              extent={{4,4},{-4,-4}},
              rotation=90,
              origin={14,-46})));

      equation

        connect(systemicCirculation.AortaCannulla, arterialInfusion.cOut)
          annotation (Line(
            points={{7,-35},{18,-35},{18,-42.8}},
            color={217,67,180},
            thickness=1));
        connect(ecmo.cOut, arterialInfusion.cIn) annotation (Line(
            points={{9.6,-60},{18,-60},{18,-49.2}},
            color={217,67,180},
            thickness=1));
        connect(VenousDrainECMOExp.cIn, systemicCirculation.q_out) annotation (
            Line(
            points={{-12,-42.8},{-12,-26},{-10,-26}},
            color={28,108,200},
            thickness=1));
        connect(VenousDrainECMOExp.cOut, ecmo.cIn) annotation (Line(
            points={{-12,-49.2},{-12,-60},{-9.6,-60}},
            color={28,108,200},
            thickness=1));
        connect(heart.LVCannula, LVDrainECMOExp.cIn) annotation (Line(
            points={{4.56,-4.8},{4.56,-4},{14,-4},{14,-42.8}},
            color={28,108,200},
            thickness=1));
        connect(LVDrainECMOExp.cOut, ecmo.cIn) annotation (Line(
            points={{14,-49.2},{14,-52},{-12,-52},{-12,-60},{-9.6,-60}},
            color={28,108,200},
            thickness=1));
        annotation (experiment(StopTime=15, __Dymola_Algorithm="Cvode"));
      end LVFailure_Ecmo_LVDrainNonLin10Fr;

      model LVAD_smith
        extends LVFailure_Ecmo_LVDrainNonLin10Fr(
          ecmo(ecmoPump(qRef2=0)),
          LVDrainECMOExp(closed=false),
          heart(ventricularInteraction_flat(Eslv=38394200.0)),
          pulmonaryCirculation(pulmonaryVeins(ZeroPressureVolume(displayUnit=
                    "ml") = 0)));
        annotation (experiment(
            StopTime=30,
            Tolerance=1e-07,
            __Dymola_Algorithm="Cvode"));
      end LVAD_smith;
    end LVUnload_states;
  end Experiments;

  package Visualization
    model MergedSmith
      parameter Physiolibrary.Types.Frequency HR = 1.2;
      parameter Physiolibrary.Types.HydraulicElastance Eslv = 383941811;
      parameter Physiolibrary.Types.Volume VeinsZPV = 0;
      parameter Physiolibrary.Types.VolumeFlowRate qRef = 0;
      Experiments.LVUnload_states.LVAD_smith VA_ECMO(
        heart(HR(k=HR), ventricularInteraction_flat(Eslv=Eslv)),
        pulmonaryCirculation(pulmonaryVeins(ZeroPressureVolume=VeinsZPV)),
        ecmo(ecmoPump(qRef2=qRef)),
        LVDrainECMOExp(closed=true))
        annotation (Placement(transformation(extent={{-70,-44},{-40,60}})));
      Experiments.LVUnload_states.LVAD_smith VA_ECMO_DLAC_UNLOAD(
        heart(HR(k=HR), ventricularInteraction_flat(Eslv=Eslv)),
        pulmonaryCirculation(pulmonaryVeins(ZeroPressureVolume=VeinsZPV)),
        ecmo(ecmoPump(qRef2=qRef)),
        LVDrainECMOExp(closed=false))
        annotation (Placement(transformation(extent={{2,-20},{40,68}})));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        experiment(
          StopTime=30,
          __Dymola_NumberOfIntervals=1500,
          Tolerance=1e-08,
          __Dymola_Algorithm="Cvode"));
    end MergedSmith;
  end Visualization;
  annotation (uses(Physiolibrary(version="2.3.2-beta"), Modelica(version=
            "3.2.3")));
end Cardiovascular;
