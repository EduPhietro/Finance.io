<mxfile>
  <diagram name="modelo-logico" id="9kqqZqJ4iYid_5uceyjT">
    <mxGraphModel grid="1" page="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" pageScale="1" pageWidth="2500" pageHeight="2100" background="#FFFFFF" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="WPUb9v3IqM6d1RAyFusB-1" parent="1" style="shape=table;startSize=30;container=1;collapsible=1;childLayout=tableLayout;fixedRows=1;rowLines=0;fontStyle=1;align=center;resizeLast=1;labelBackgroundColor=none;fillColor=#DDEEFF;strokeColor=#A7C5E6;fontColor=#29415C;fontSize=15;shadow=0;" value="users" vertex="1">
          <mxGeometry height="270" width="307" x="100" y="160" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-2" parent="WPUb9v3IqM6d1RAyFusB-1" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#E5F1FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="307" y="30" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-3" parent="WPUb9v3IqM6d1RAyFusB-2" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;fontStyle=1;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="PK" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-4" parent="WPUb9v3IqM6d1RAyFusB-2" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;fontStyle=5;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="id UUID " vertex="1">
          <mxGeometry height="30" width="277" x="30" as="geometry">
            <mxRectangle height="30" width="277" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-5" parent="WPUb9v3IqM6d1RAyFusB-1" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#EAF4FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="307" y="60" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-6" parent="WPUb9v3IqM6d1RAyFusB-5" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-7" parent="WPUb9v3IqM6d1RAyFusB-5" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="full_name VARCHAR(100) NOT NULL" vertex="1">
          <mxGeometry height="30" width="277" x="30" as="geometry">
            <mxRectangle height="30" width="277" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-8" parent="WPUb9v3IqM6d1RAyFusB-1" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="307" y="90" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-9" parent="WPUb9v3IqM6d1RAyFusB-8" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-10" parent="WPUb9v3IqM6d1RAyFusB-8" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="username VARCHAR(100) NOT NULL UNIQUE" vertex="1">
          <mxGeometry height="30" width="277" x="30" as="geometry">
            <mxRectangle height="30" width="277" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-11" parent="WPUb9v3IqM6d1RAyFusB-1" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#EAF4FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="307" y="120" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-12" parent="WPUb9v3IqM6d1RAyFusB-11" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-13" parent="WPUb9v3IqM6d1RAyFusB-11" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="email VARCHAR(100) NOT NULL UNIQUE" vertex="1">
          <mxGeometry height="30" width="277" x="30" as="geometry">
            <mxRectangle height="30" width="277" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-14" parent="WPUb9v3IqM6d1RAyFusB-1" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="307" y="150" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-15" parent="WPUb9v3IqM6d1RAyFusB-14" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-16" parent="WPUb9v3IqM6d1RAyFusB-14" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="password_hash VARCHAR(255) NOT NULL" vertex="1">
          <mxGeometry height="30" width="277" x="30" as="geometry">
            <mxRectangle height="30" width="277" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-17" parent="WPUb9v3IqM6d1RAyFusB-1" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#EAF4FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="307" y="180" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-18" parent="WPUb9v3IqM6d1RAyFusB-17" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-19" parent="WPUb9v3IqM6d1RAyFusB-17" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="created_at TIMESTAMP NOT NULL" vertex="1">
          <mxGeometry height="30" width="277" x="30" as="geometry">
            <mxRectangle height="30" width="277" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-20" parent="WPUb9v3IqM6d1RAyFusB-1" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="307" y="210" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-21" parent="WPUb9v3IqM6d1RAyFusB-20" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-22" parent="WPUb9v3IqM6d1RAyFusB-20" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="updated_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="277" x="30" as="geometry">
            <mxRectangle height="30" width="277" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-23" parent="WPUb9v3IqM6d1RAyFusB-1" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#EAF4FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="307" y="240" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-24" parent="WPUb9v3IqM6d1RAyFusB-23" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-25" parent="WPUb9v3IqM6d1RAyFusB-23" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="deleted_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="277" x="30" as="geometry">
            <mxRectangle height="30" width="277" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-26" parent="1" style="shape=table;startSize=30;container=1;collapsible=1;childLayout=tableLayout;fixedRows=1;rowLines=0;fontStyle=1;align=center;resizeLast=1;labelBackgroundColor=none;fillColor=#E2F4FF;strokeColor=#B4D7EA;fontColor=#29415C;fontSize=15;shadow=0;" value="addresses" vertex="1">
          <mxGeometry height="480" width="320" x="100" y="560" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-27" parent="WPUb9v3IqM6d1RAyFusB-26" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#E5F1FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="30" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-28" parent="WPUb9v3IqM6d1RAyFusB-27" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;fontStyle=1;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="PK" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-29" parent="WPUb9v3IqM6d1RAyFusB-27" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;fontStyle=5;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="id UUID " vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-30" parent="WPUb9v3IqM6d1RAyFusB-26" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F0F9FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="60" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-31" parent="WPUb9v3IqM6d1RAyFusB-30" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-32" parent="WPUb9v3IqM6d1RAyFusB-30" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="user_id UUID NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-33" parent="WPUb9v3IqM6d1RAyFusB-26" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="90" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-34" parent="WPUb9v3IqM6d1RAyFusB-33" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-35" parent="WPUb9v3IqM6d1RAyFusB-33" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="postal_code VARCHAR(8)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-36" parent="WPUb9v3IqM6d1RAyFusB-26" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F0F9FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="120" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-37" parent="WPUb9v3IqM6d1RAyFusB-36" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-38" parent="WPUb9v3IqM6d1RAyFusB-36" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="street VARCHAR(150) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-39" parent="WPUb9v3IqM6d1RAyFusB-26" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="150" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-40" parent="WPUb9v3IqM6d1RAyFusB-39" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-41" parent="WPUb9v3IqM6d1RAyFusB-39" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="number VARCHAR(10)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-42" parent="WPUb9v3IqM6d1RAyFusB-26" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F0F9FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="180" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-43" parent="WPUb9v3IqM6d1RAyFusB-42" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-44" parent="WPUb9v3IqM6d1RAyFusB-42" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="complement VARCHAR(100)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-45" parent="WPUb9v3IqM6d1RAyFusB-26" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="210" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-46" parent="WPUb9v3IqM6d1RAyFusB-45" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-47" parent="WPUb9v3IqM6d1RAyFusB-45" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="district VARCHAR(100) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-48" parent="WPUb9v3IqM6d1RAyFusB-26" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F0F9FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="240" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-49" parent="WPUb9v3IqM6d1RAyFusB-48" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-50" parent="WPUb9v3IqM6d1RAyFusB-48" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="city VARCHAR(100) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-51" parent="WPUb9v3IqM6d1RAyFusB-26" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="270" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-52" parent="WPUb9v3IqM6d1RAyFusB-51" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-53" parent="WPUb9v3IqM6d1RAyFusB-51" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="state CHAR(2) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-54" parent="WPUb9v3IqM6d1RAyFusB-26" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F0F9FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="300" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-55" parent="WPUb9v3IqM6d1RAyFusB-54" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-56" parent="WPUb9v3IqM6d1RAyFusB-54" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="reference VARCHAR(250)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-57" parent="WPUb9v3IqM6d1RAyFusB-26" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="330" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-58" parent="WPUb9v3IqM6d1RAyFusB-57" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-59" parent="WPUb9v3IqM6d1RAyFusB-57" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="is_main_residence BOOLEAN NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-60" parent="WPUb9v3IqM6d1RAyFusB-26" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F0F9FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="360" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-61" parent="WPUb9v3IqM6d1RAyFusB-60" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-62" parent="WPUb9v3IqM6d1RAyFusB-60" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="created_at TIMESTAMP NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-63" parent="WPUb9v3IqM6d1RAyFusB-26" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="390" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-64" parent="WPUb9v3IqM6d1RAyFusB-63" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-65" parent="WPUb9v3IqM6d1RAyFusB-63" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="updated_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-66" parent="WPUb9v3IqM6d1RAyFusB-26" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F0F9FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="420" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-67" parent="WPUb9v3IqM6d1RAyFusB-66" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-68" parent="WPUb9v3IqM6d1RAyFusB-66" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="deleted_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-69" parent="WPUb9v3IqM6d1RAyFusB-26" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="450" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-70" parent="WPUb9v3IqM6d1RAyFusB-69" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-71" parent="WPUb9v3IqM6d1RAyFusB-69" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (user_id) REFERENCES users(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-72" parent="1" style="shape=table;startSize=30;container=1;collapsible=1;childLayout=tableLayout;fixedRows=1;rowLines=0;fontStyle=1;align=center;resizeLast=1;labelBackgroundColor=none;fillColor=#E0F4E7;strokeColor=#B3D9BF;fontColor=#29415C;fontSize=15;shadow=0;" value="bank_accounts" vertex="1">
          <mxGeometry height="480" width="320" x="710" y="160" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-73" parent="WPUb9v3IqM6d1RAyFusB-72" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#E5F1FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="30" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-74" parent="WPUb9v3IqM6d1RAyFusB-73" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;fontStyle=1;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="PK" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-75" parent="WPUb9v3IqM6d1RAyFusB-73" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;fontStyle=5;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="id UUID " vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-76" parent="WPUb9v3IqM6d1RAyFusB-72" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F0FAF3;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="60" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-77" parent="WPUb9v3IqM6d1RAyFusB-76" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-78" parent="WPUb9v3IqM6d1RAyFusB-76" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="user_id UUID NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-79" parent="WPUb9v3IqM6d1RAyFusB-72" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="90" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-80" parent="WPUb9v3IqM6d1RAyFusB-79" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-81" parent="WPUb9v3IqM6d1RAyFusB-79" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="nickname VARCHAR(100) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-82" parent="WPUb9v3IqM6d1RAyFusB-72" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F0FAF3;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="120" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-83" parent="WPUb9v3IqM6d1RAyFusB-82" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-84" parent="WPUb9v3IqM6d1RAyFusB-82" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="bank_name VARCHAR(100) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-85" parent="WPUb9v3IqM6d1RAyFusB-72" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="150" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-86" parent="WPUb9v3IqM6d1RAyFusB-85" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-87" parent="WPUb9v3IqM6d1RAyFusB-85" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="branch_number VARCHAR(20) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-88" parent="WPUb9v3IqM6d1RAyFusB-72" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F0FAF3;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="180" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-89" parent="WPUb9v3IqM6d1RAyFusB-88" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-90" parent="WPUb9v3IqM6d1RAyFusB-88" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="account_number VARCHAR(30) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-91" parent="WPUb9v3IqM6d1RAyFusB-72" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="210" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-92" parent="WPUb9v3IqM6d1RAyFusB-91" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-93" parent="WPUb9v3IqM6d1RAyFusB-91" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="account_type VARCHAR(20) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-94" parent="WPUb9v3IqM6d1RAyFusB-72" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F0FAF3;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="240" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-95" parent="WPUb9v3IqM6d1RAyFusB-94" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-96" parent="WPUb9v3IqM6d1RAyFusB-94" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="identification_color VARCHAR(7)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-97" parent="WPUb9v3IqM6d1RAyFusB-72" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="270" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-98" parent="WPUb9v3IqM6d1RAyFusB-97" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-99" parent="WPUb9v3IqM6d1RAyFusB-97" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="initial_balance NUMERIC(14, 2) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-100" parent="WPUb9v3IqM6d1RAyFusB-72" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F0FAF3;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="300" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-101" parent="WPUb9v3IqM6d1RAyFusB-100" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-102" parent="WPUb9v3IqM6d1RAyFusB-100" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="is_active BOOLEAN NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-103" parent="WPUb9v3IqM6d1RAyFusB-72" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="330" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-104" parent="WPUb9v3IqM6d1RAyFusB-103" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-105" parent="WPUb9v3IqM6d1RAyFusB-103" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="created_at TIMESTAMP NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-106" parent="WPUb9v3IqM6d1RAyFusB-72" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F0FAF3;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="360" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-107" parent="WPUb9v3IqM6d1RAyFusB-106" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-108" parent="WPUb9v3IqM6d1RAyFusB-106" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="updated_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-109" parent="WPUb9v3IqM6d1RAyFusB-72" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="390" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-110" parent="WPUb9v3IqM6d1RAyFusB-109" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-111" parent="WPUb9v3IqM6d1RAyFusB-109" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="deleted_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-112" parent="WPUb9v3IqM6d1RAyFusB-72" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F0FAF3;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="420" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-113" parent="WPUb9v3IqM6d1RAyFusB-112" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-114" parent="WPUb9v3IqM6d1RAyFusB-112" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="UNIQUE (user_id, bank_name, branch_number, account_number)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-115" parent="WPUb9v3IqM6d1RAyFusB-72" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="450" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-116" parent="WPUb9v3IqM6d1RAyFusB-115" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-117" parent="WPUb9v3IqM6d1RAyFusB-115" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (user_id) REFERENCES users(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-118" parent="1" style="shape=table;startSize=30;container=1;collapsible=1;childLayout=tableLayout;fixedRows=1;rowLines=0;fontStyle=1;align=center;resizeLast=1;labelBackgroundColor=none;fillColor=#EBF6E4;strokeColor=#C6DDB8;fontColor=#29415C;fontSize=15;shadow=0;" value="cards" vertex="1">
          <mxGeometry height="480" width="320" x="710" y="850" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-119" parent="WPUb9v3IqM6d1RAyFusB-118" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#E5F1FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="30" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-120" parent="WPUb9v3IqM6d1RAyFusB-119" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;fontStyle=1;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="PK" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-121" parent="WPUb9v3IqM6d1RAyFusB-119" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;fontStyle=5;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="id UUID " vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-122" parent="WPUb9v3IqM6d1RAyFusB-118" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F6FBF1;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="60" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-123" parent="WPUb9v3IqM6d1RAyFusB-122" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-124" parent="WPUb9v3IqM6d1RAyFusB-122" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="account_id UUID NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-125" parent="WPUb9v3IqM6d1RAyFusB-118" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="90" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-126" parent="WPUb9v3IqM6d1RAyFusB-125" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-127" parent="WPUb9v3IqM6d1RAyFusB-125" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="nickname VARCHAR(100) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-128" parent="WPUb9v3IqM6d1RAyFusB-118" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F6FBF1;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="120" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-129" parent="WPUb9v3IqM6d1RAyFusB-128" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-130" parent="WPUb9v3IqM6d1RAyFusB-128" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="last_four_digits CHAR(4) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-131" parent="WPUb9v3IqM6d1RAyFusB-118" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="150" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-132" parent="WPUb9v3IqM6d1RAyFusB-131" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-133" parent="WPUb9v3IqM6d1RAyFusB-131" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="expiration_date DATE NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-134" parent="WPUb9v3IqM6d1RAyFusB-118" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F6FBF1;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="180" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-135" parent="WPUb9v3IqM6d1RAyFusB-134" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-136" parent="WPUb9v3IqM6d1RAyFusB-134" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="card_type VARCHAR(10) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-137" parent="WPUb9v3IqM6d1RAyFusB-118" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="210" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-138" parent="WPUb9v3IqM6d1RAyFusB-137" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-139" parent="WPUb9v3IqM6d1RAyFusB-137" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="credit_limit NUMERIC(14, 2)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-140" parent="WPUb9v3IqM6d1RAyFusB-118" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F6FBF1;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="240" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-141" parent="WPUb9v3IqM6d1RAyFusB-140" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-142" parent="WPUb9v3IqM6d1RAyFusB-140" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="identification_color VARCHAR(7)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-143" parent="WPUb9v3IqM6d1RAyFusB-118" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="270" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-144" parent="WPUb9v3IqM6d1RAyFusB-143" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-145" parent="WPUb9v3IqM6d1RAyFusB-143" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="is_active BOOLEAN NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-146" parent="WPUb9v3IqM6d1RAyFusB-118" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F6FBF1;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="300" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-147" parent="WPUb9v3IqM6d1RAyFusB-146" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-148" parent="WPUb9v3IqM6d1RAyFusB-146" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="created_at TIMESTAMP NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-149" parent="WPUb9v3IqM6d1RAyFusB-118" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="330" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-150" parent="WPUb9v3IqM6d1RAyFusB-149" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-151" parent="WPUb9v3IqM6d1RAyFusB-149" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="updated_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-152" parent="WPUb9v3IqM6d1RAyFusB-118" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F6FBF1;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="360" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-153" parent="WPUb9v3IqM6d1RAyFusB-152" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-154" parent="WPUb9v3IqM6d1RAyFusB-152" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="deleted_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-155" parent="WPUb9v3IqM6d1RAyFusB-118" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="390" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-156" parent="WPUb9v3IqM6d1RAyFusB-155" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-157" parent="WPUb9v3IqM6d1RAyFusB-155" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (account_id) REFERENCES bank_accounts(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-158" parent="1" style="shape=table;startSize=30;container=1;collapsible=1;childLayout=tableLayout;fixedRows=1;rowLines=0;fontStyle=1;align=center;resizeLast=1;labelBackgroundColor=none;fillColor=#E3F5F2;strokeColor=#B7DCD4;fontColor=#29415C;fontSize=15;shadow=0;" value="categories" vertex="1">
          <mxGeometry height="360" width="320" x="100" y="1290" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-159" parent="WPUb9v3IqM6d1RAyFusB-158" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#E5F1FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="30" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-160" parent="WPUb9v3IqM6d1RAyFusB-159" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;fontStyle=1;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="PK" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-161" parent="WPUb9v3IqM6d1RAyFusB-159" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;fontStyle=5;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="id UUID " vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-162" parent="WPUb9v3IqM6d1RAyFusB-158" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F2FAF8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="60" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-163" parent="WPUb9v3IqM6d1RAyFusB-162" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-164" parent="WPUb9v3IqM6d1RAyFusB-162" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="user_id UUID NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-165" parent="WPUb9v3IqM6d1RAyFusB-158" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="90" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-166" parent="WPUb9v3IqM6d1RAyFusB-165" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-167" parent="WPUb9v3IqM6d1RAyFusB-165" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="name VARCHAR(100) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-168" parent="WPUb9v3IqM6d1RAyFusB-158" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F2FAF8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="120" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-169" parent="WPUb9v3IqM6d1RAyFusB-168" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-170" parent="WPUb9v3IqM6d1RAyFusB-168" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="category_type VARCHAR(10) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-171" parent="WPUb9v3IqM6d1RAyFusB-158" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="150" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-172" parent="WPUb9v3IqM6d1RAyFusB-171" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-173" parent="WPUb9v3IqM6d1RAyFusB-171" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="identification_color VARCHAR(7)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-174" parent="WPUb9v3IqM6d1RAyFusB-158" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F2FAF8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="180" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-175" parent="WPUb9v3IqM6d1RAyFusB-174" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-176" parent="WPUb9v3IqM6d1RAyFusB-174" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="is_active BOOLEAN NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-177" parent="WPUb9v3IqM6d1RAyFusB-158" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="210" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-178" parent="WPUb9v3IqM6d1RAyFusB-177" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-179" parent="WPUb9v3IqM6d1RAyFusB-177" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="created_at TIMESTAMP NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-180" parent="WPUb9v3IqM6d1RAyFusB-158" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F2FAF8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="240" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-181" parent="WPUb9v3IqM6d1RAyFusB-180" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-182" parent="WPUb9v3IqM6d1RAyFusB-180" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="updated_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-183" parent="WPUb9v3IqM6d1RAyFusB-158" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="270" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-184" parent="WPUb9v3IqM6d1RAyFusB-183" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-185" parent="WPUb9v3IqM6d1RAyFusB-183" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="deleted_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-186" parent="WPUb9v3IqM6d1RAyFusB-158" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F2FAF8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="300" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-187" parent="WPUb9v3IqM6d1RAyFusB-186" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-188" parent="WPUb9v3IqM6d1RAyFusB-186" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="UNIQUE (user_id, name, category_type)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-189" parent="WPUb9v3IqM6d1RAyFusB-158" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="330" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-190" parent="WPUb9v3IqM6d1RAyFusB-189" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-191" parent="WPUb9v3IqM6d1RAyFusB-189" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (user_id) REFERENCES users(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-192" parent="1" style="shape=table;startSize=30;container=1;collapsible=1;childLayout=tableLayout;fixedRows=1;rowLines=0;fontStyle=1;align=center;resizeLast=1;labelBackgroundColor=none;fillColor=#EEE8FC;strokeColor=#CEC1E8;fontColor=#29415C;fontSize=15;shadow=0;" value="recurrence_rules" vertex="1">
          <mxGeometry height="780" width="320" x="2010" y="160" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-193" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#E5F1FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="30" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-194" parent="WPUb9v3IqM6d1RAyFusB-193" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;fontStyle=1;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="PK" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-195" parent="WPUb9v3IqM6d1RAyFusB-193" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;fontStyle=5;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="id UUID " vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-196" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F8F5FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="60" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-197" parent="WPUb9v3IqM6d1RAyFusB-196" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-198" parent="WPUb9v3IqM6d1RAyFusB-196" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="user_id UUID NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-199" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="90" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-200" parent="WPUb9v3IqM6d1RAyFusB-199" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-201" parent="WPUb9v3IqM6d1RAyFusB-199" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="category_id UUID NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-202" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F8F5FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="120" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-203" parent="WPUb9v3IqM6d1RAyFusB-202" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-204" parent="WPUb9v3IqM6d1RAyFusB-202" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="account_id UUID" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-205" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="150" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-206" parent="WPUb9v3IqM6d1RAyFusB-205" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-207" parent="WPUb9v3IqM6d1RAyFusB-205" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="card_id UUID" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-208" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F8F5FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="180" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-209" parent="WPUb9v3IqM6d1RAyFusB-208" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-210" parent="WPUb9v3IqM6d1RAyFusB-208" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="transaction_type VARCHAR(10) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-211" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="210" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-212" parent="WPUb9v3IqM6d1RAyFusB-211" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-213" parent="WPUb9v3IqM6d1RAyFusB-211" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="title VARCHAR(150) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-214" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F8F5FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="240" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-215" parent="WPUb9v3IqM6d1RAyFusB-214" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-216" parent="WPUb9v3IqM6d1RAyFusB-214" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="description VARCHAR(500)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-217" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="270" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-218" parent="WPUb9v3IqM6d1RAyFusB-217" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-219" parent="WPUb9v3IqM6d1RAyFusB-217" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="amount NUMERIC(14, 2) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-220" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F8F5FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="300" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-221" parent="WPUb9v3IqM6d1RAyFusB-220" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-222" parent="WPUb9v3IqM6d1RAyFusB-220" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="income_source VARCHAR(30)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-223" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="330" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-224" parent="WPUb9v3IqM6d1RAyFusB-223" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-225" parent="WPUb9v3IqM6d1RAyFusB-223" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="payment_method VARCHAR(20)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-226" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F8F5FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="360" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-227" parent="WPUb9v3IqM6d1RAyFusB-226" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-228" parent="WPUb9v3IqM6d1RAyFusB-226" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="frequency VARCHAR(10) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-229" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="390" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-230" parent="WPUb9v3IqM6d1RAyFusB-229" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-231" parent="WPUb9v3IqM6d1RAyFusB-229" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="schedule_mode VARCHAR(20) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-232" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F8F5FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="420" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-233" parent="WPUb9v3IqM6d1RAyFusB-232" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-234" parent="WPUb9v3IqM6d1RAyFusB-232" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="scheduled_date DATE NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-235" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="450" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-236" parent="WPUb9v3IqM6d1RAyFusB-235" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-237" parent="WPUb9v3IqM6d1RAyFusB-235" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="business_day_ordinal SMALLINT" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-238" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F8F5FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="480" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-239" parent="WPUb9v3IqM6d1RAyFusB-238" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-240" parent="WPUb9v3IqM6d1RAyFusB-238" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="starts_at DATE NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-241" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="510" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-242" parent="WPUb9v3IqM6d1RAyFusB-241" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-243" parent="WPUb9v3IqM6d1RAyFusB-241" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="ends_at DATE" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-244" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F8F5FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="540" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-245" parent="WPUb9v3IqM6d1RAyFusB-244" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-246" parent="WPUb9v3IqM6d1RAyFusB-244" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="is_active BOOLEAN NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-247" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="570" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-248" parent="WPUb9v3IqM6d1RAyFusB-247" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-249" parent="WPUb9v3IqM6d1RAyFusB-247" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="created_at TIMESTAMP NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-250" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#F8F5FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="600" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-251" parent="WPUb9v3IqM6d1RAyFusB-250" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-252" parent="WPUb9v3IqM6d1RAyFusB-250" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="updated_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-253" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="630" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-254" parent="WPUb9v3IqM6d1RAyFusB-253" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-255" parent="WPUb9v3IqM6d1RAyFusB-253" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="deleted_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-256" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="660" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-257" parent="WPUb9v3IqM6d1RAyFusB-256" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-258" parent="WPUb9v3IqM6d1RAyFusB-256" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (user_id) REFERENCES users(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-259" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="690" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-260" parent="WPUb9v3IqM6d1RAyFusB-259" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-261" parent="WPUb9v3IqM6d1RAyFusB-259" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (category_id) REFERENCES categories(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-262" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="720" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-263" parent="WPUb9v3IqM6d1RAyFusB-262" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-264" parent="WPUb9v3IqM6d1RAyFusB-262" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (account_id) REFERENCES bank_accounts(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-265" parent="WPUb9v3IqM6d1RAyFusB-192" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="750" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-266" parent="WPUb9v3IqM6d1RAyFusB-265" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-267" parent="WPUb9v3IqM6d1RAyFusB-265" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (card_id) REFERENCES cards(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-268" parent="1" style="shape=table;startSize=30;container=1;collapsible=1;childLayout=tableLayout;fixedRows=1;rowLines=0;fontStyle=1;align=center;resizeLast=1;labelBackgroundColor=none;fillColor=#F7EBF7;strokeColor=#DEBEDC;fontColor=#29415C;fontSize=15;shadow=0;" value="installment_plans" vertex="1">
          <mxGeometry height="537" width="320" x="2010" y="1140" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-269" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#E5F1FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="30" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-270" parent="WPUb9v3IqM6d1RAyFusB-269" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;fontStyle=1;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="PK" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-271" parent="WPUb9v3IqM6d1RAyFusB-269" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;fontStyle=5;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="id UUID " vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-272" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FCF7FC;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="60" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-273" parent="WPUb9v3IqM6d1RAyFusB-272" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-274" parent="WPUb9v3IqM6d1RAyFusB-272" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="user_id UUID NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-275" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="90" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-276" parent="WPUb9v3IqM6d1RAyFusB-275" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-277" parent="WPUb9v3IqM6d1RAyFusB-275" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="category_id UUID NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-278" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FCF7FC;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="27" width="320" y="120" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-279" parent="WPUb9v3IqM6d1RAyFusB-278" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="27" width="30" as="geometry">
            <mxRectangle height="27" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-280" parent="WPUb9v3IqM6d1RAyFusB-278" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="account_id UUID" vertex="1">
          <mxGeometry height="27" width="290" x="30" as="geometry">
            <mxRectangle height="27" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-281" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="147" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-282" parent="WPUb9v3IqM6d1RAyFusB-281" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-283" parent="WPUb9v3IqM6d1RAyFusB-281" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="card_id UUID" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-284" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FCF7FC;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="177" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-285" parent="WPUb9v3IqM6d1RAyFusB-284" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-286" parent="WPUb9v3IqM6d1RAyFusB-284" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="description VARCHAR(500) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-287" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="207" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-288" parent="WPUb9v3IqM6d1RAyFusB-287" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-289" parent="WPUb9v3IqM6d1RAyFusB-287" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="total_amount NUMERIC(14, 2) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-290" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FCF7FC;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="237" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-291" parent="WPUb9v3IqM6d1RAyFusB-290" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-292" parent="WPUb9v3IqM6d1RAyFusB-290" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="installment_count SMALLINT NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-293" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="267" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-294" parent="WPUb9v3IqM6d1RAyFusB-293" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-295" parent="WPUb9v3IqM6d1RAyFusB-293" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="purchase_date DATE NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-296" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FCF7FC;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="297" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-297" parent="WPUb9v3IqM6d1RAyFusB-296" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-298" parent="WPUb9v3IqM6d1RAyFusB-296" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="payment_method VARCHAR(20) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-299" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="327" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-300" parent="WPUb9v3IqM6d1RAyFusB-299" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-301" parent="WPUb9v3IqM6d1RAyFusB-299" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="created_at TIMESTAMP NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-302" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FCF7FC;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="357" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-303" parent="WPUb9v3IqM6d1RAyFusB-302" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-304" parent="WPUb9v3IqM6d1RAyFusB-302" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="updated_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-305" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="387" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-306" parent="WPUb9v3IqM6d1RAyFusB-305" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-307" parent="WPUb9v3IqM6d1RAyFusB-305" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="deleted_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-308" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="417" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-309" parent="WPUb9v3IqM6d1RAyFusB-308" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-310" parent="WPUb9v3IqM6d1RAyFusB-308" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (user_id) REFERENCES users(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-311" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="447" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-312" parent="WPUb9v3IqM6d1RAyFusB-311" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-313" parent="WPUb9v3IqM6d1RAyFusB-311" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (category_id) REFERENCES categories(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-314" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="477" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-315" parent="WPUb9v3IqM6d1RAyFusB-314" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-316" parent="WPUb9v3IqM6d1RAyFusB-314" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (account_id) REFERENCES bank_accounts(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-317" parent="WPUb9v3IqM6d1RAyFusB-268" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="507" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-318" parent="WPUb9v3IqM6d1RAyFusB-317" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-319" parent="WPUb9v3IqM6d1RAyFusB-317" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (card_id) REFERENCES cards(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-320" parent="1" style="shape=table;startSize=30;container=1;collapsible=1;childLayout=tableLayout;fixedRows=1;rowLines=0;fontStyle=1;align=center;resizeLast=1;labelBackgroundColor=none;fillColor=#FFF1E0;strokeColor=#E8CAA3;fontColor=#29415C;fontSize=15;shadow=0;" value="transactions" vertex="1">
          <mxGeometry height="853.5172413793107" width="320" x="1340" y="160" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-321" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#E5F1FF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="30" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-322" parent="WPUb9v3IqM6d1RAyFusB-321" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;fontStyle=1;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="PK" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-323" parent="WPUb9v3IqM6d1RAyFusB-321" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;fontStyle=5;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="id UUID " vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-324" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF9F0;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="37" width="320" y="60" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-325" parent="WPUb9v3IqM6d1RAyFusB-324" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="37" width="30" as="geometry">
            <mxRectangle height="37" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-326" parent="WPUb9v3IqM6d1RAyFusB-324" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="user_id UUID NOT NULL" vertex="1">
          <mxGeometry height="37" width="290" x="30" as="geometry">
            <mxRectangle height="37" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-327" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="36" width="320" y="97" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-328" parent="WPUb9v3IqM6d1RAyFusB-327" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="36" width="30" as="geometry">
            <mxRectangle height="36" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-329" parent="WPUb9v3IqM6d1RAyFusB-327" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="category_id UUID NOT NULL" vertex="1">
          <mxGeometry height="36" width="290" x="30" as="geometry">
            <mxRectangle height="36" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-330" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF9F0;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="133" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-331" parent="WPUb9v3IqM6d1RAyFusB-330" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-332" parent="WPUb9v3IqM6d1RAyFusB-330" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="account_id UUID" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-333" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="163" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-334" parent="WPUb9v3IqM6d1RAyFusB-333" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-335" parent="WPUb9v3IqM6d1RAyFusB-333" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="card_id UUID" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-336" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF9F0;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="193" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-337" parent="WPUb9v3IqM6d1RAyFusB-336" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-338" parent="WPUb9v3IqM6d1RAyFusB-336" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="recurrence_rule_id UUID" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-339" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="223" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-340" parent="WPUb9v3IqM6d1RAyFusB-339" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-341" parent="WPUb9v3IqM6d1RAyFusB-339" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="installment_plan_id UUID" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-342" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF9F0;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="253" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-343" parent="WPUb9v3IqM6d1RAyFusB-342" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-344" parent="WPUb9v3IqM6d1RAyFusB-342" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="transaction_type VARCHAR(10) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-345" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="283" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-346" parent="WPUb9v3IqM6d1RAyFusB-345" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-347" parent="WPUb9v3IqM6d1RAyFusB-345" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="title VARCHAR(150) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-348" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF9F0;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="313" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-349" parent="WPUb9v3IqM6d1RAyFusB-348" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-350" parent="WPUb9v3IqM6d1RAyFusB-348" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="description VARCHAR(500)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-351" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="343" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-352" parent="WPUb9v3IqM6d1RAyFusB-351" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-353" parent="WPUb9v3IqM6d1RAyFusB-351" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="amount NUMERIC(14, 2) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-354" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF9F0;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="373" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-355" parent="WPUb9v3IqM6d1RAyFusB-354" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-356" parent="WPUb9v3IqM6d1RAyFusB-354" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="occurred_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-357" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="403" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-358" parent="WPUb9v3IqM6d1RAyFusB-357" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-359" parent="WPUb9v3IqM6d1RAyFusB-357" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="scheduled_for DATE" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-360" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF9F0;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="433" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-361" parent="WPUb9v3IqM6d1RAyFusB-360" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-362" parent="WPUb9v3IqM6d1RAyFusB-360" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="status VARCHAR(15) NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-363" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="463" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-364" parent="WPUb9v3IqM6d1RAyFusB-363" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-365" parent="WPUb9v3IqM6d1RAyFusB-363" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="income_source VARCHAR(30)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-366" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF9F0;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="493" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-367" parent="WPUb9v3IqM6d1RAyFusB-366" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-368" parent="WPUb9v3IqM6d1RAyFusB-366" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="payment_method VARCHAR(20)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-369" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="523" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-370" parent="WPUb9v3IqM6d1RAyFusB-369" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-371" parent="WPUb9v3IqM6d1RAyFusB-369" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="installment_number SMALLINT" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-372" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF9F0;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="553" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-373" parent="WPUb9v3IqM6d1RAyFusB-372" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-374" parent="WPUb9v3IqM6d1RAyFusB-372" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="total_installments SMALLINT" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-375" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="583" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-376" parent="WPUb9v3IqM6d1RAyFusB-375" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-377" parent="WPUb9v3IqM6d1RAyFusB-375" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="created_at TIMESTAMP NOT NULL" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-378" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF9F0;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="613" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-379" parent="WPUb9v3IqM6d1RAyFusB-378" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-380" parent="WPUb9v3IqM6d1RAyFusB-378" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="updated_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-381" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFFFFF;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="643" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-382" parent="WPUb9v3IqM6d1RAyFusB-381" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-383" parent="WPUb9v3IqM6d1RAyFusB-381" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="deleted_at TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-384" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="673" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-385" parent="WPUb9v3IqM6d1RAyFusB-384" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-386" parent="WPUb9v3IqM6d1RAyFusB-384" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (user_id) REFERENCES users(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-387" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="703" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-388" parent="WPUb9v3IqM6d1RAyFusB-387" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-389" parent="WPUb9v3IqM6d1RAyFusB-387" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (category_id) REFERENCES categories(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-390" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="733" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-391" parent="WPUb9v3IqM6d1RAyFusB-390" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-392" parent="WPUb9v3IqM6d1RAyFusB-390" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (account_id) REFERENCES bank_accounts(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-393" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="763" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-394" parent="WPUb9v3IqM6d1RAyFusB-393" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-395" parent="WPUb9v3IqM6d1RAyFusB-393" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (card_id) REFERENCES cards(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-396" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="793" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-397" parent="WPUb9v3IqM6d1RAyFusB-396" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-398" parent="WPUb9v3IqM6d1RAyFusB-396" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (recurrence_rule_id) REFERENCES recurrence_rules(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-399" parent="WPUb9v3IqM6d1RAyFusB-320" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=#FFF4E8;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;strokeColor=#DAE4EC;top=0;left=0;right=0;bottom=1;labelBackgroundColor=none;fontColor=#354A61;" value="" vertex="1">
          <mxGeometry height="30" width="320" y="823" as="geometry" />
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-400" parent="WPUb9v3IqM6d1RAyFusB-399" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="" vertex="1">
          <mxGeometry height="30" width="30" as="geometry">
            <mxRectangle height="30" width="30" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-401" parent="WPUb9v3IqM6d1RAyFusB-399" style="shape=partialRectangle;overflow=hidden;connectable=0;fillColor=none;align=left;strokeColor=#DAE4EC;top=0;left=0;bottom=0;right=0;spacingLeft=6;labelBackgroundColor=none;fontColor=#354A61;fontSize=11;" value="FOREIGN KEY (installment_plan_id) REFERENCES installment_plans(id)" vertex="1">
          <mxGeometry height="30" width="290" x="30" as="geometry">
            <mxRectangle height="30" width="290" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-449" edge="1" parent="1" source="WPUb9v3IqM6d1RAyFusB-30" style="orthogonalLoop=1;html=1;fontColor=#61768B;defaultLabelBackgroundColor=page;labelPadding=0 4;libavoidRouting=1;startArrow=none;startFill=0;endArrow=none;endFill=0;labelBackgroundColor=#FFFFFF;edgeStyle=orthogonalEdgeStyle;rounded=0;jettySize=0;strokeColor=#849BB0;strokeWidth=1.7;exitX=1;exitY=0.5;entryX=1;entryY=0.5;exitDx=0;exitDy=0;entryDx=0;entryDy=0;" target="WPUb9v3IqM6d1RAyFusB-2">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="456" y="635" />
              <mxPoint x="460" y="640" />
              <mxPoint x="460" y="200" />
              <mxPoint x="440" y="200" />
              <mxPoint x="443" y="205" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-450" edge="1" parent="1" source="WPUb9v3IqM6d1RAyFusB-2" style="orthogonalLoop=1;html=1;fontColor=#61768B;defaultLabelBackgroundColor=page;labelPadding=0 4;startArrow=none;startFill=0;endArrow=none;endFill=0;libavoidRouting=1;labelBackgroundColor=#FFFFFF;edgeStyle=orthogonalEdgeStyle;rounded=0;jettySize=0;strokeColor=#849BB0;strokeWidth=1.7;exitX=1;exitY=0.5;entryX=0;entryY=0.5;exitDx=0;exitDy=0;entryDx=0;entryDy=0;" target="WPUb9v3IqM6d1RAyFusB-76">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="443" y="205" />
              <mxPoint x="440" y="200" />
              <mxPoint x="440" y="160" />
              <mxPoint x="660" y="160" />
              <mxPoint x="660" y="240" />
              <mxPoint x="680" y="240" />
              <mxPoint x="674" y="235" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-452" edge="1" parent="1" source="WPUb9v3IqM6d1RAyFusB-73" style="orthogonalLoop=1;html=1;fontColor=#61768B;defaultLabelBackgroundColor=page;labelPadding=0 4;startArrow=none;startFill=0;endArrow=none;endFill=0;libavoidRouting=1;curved=1;curveGeometry=1;labelBackgroundColor=#FFFFFF;edgeStyle=orthogonalEdgeStyle;rounded=0;jettySize=0;strokeColor=#849BB0;strokeWidth=1.7;exitX=1;exitY=0.5;entryX=1;entryY=0.5;exitDx=0;exitDy=0;entryDx=0;entryDy=0;" target="WPUb9v3IqM6d1RAyFusB-122">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1066" y="205" />
              <mxPoint x="1060" y="200" />
              <mxPoint x="1100" y="200" />
              <mxPoint x="1100" y="920" />
              <mxPoint x="1060" y="920" />
              <mxPoint x="1066" y="925" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-453" edge="1" parent="1" source="WPUb9v3IqM6d1RAyFusB-2" style="orthogonalLoop=1;html=1;fontColor=#61768B;defaultLabelBackgroundColor=page;labelPadding=0 4;endArrow=none;endFill=0;startArrow=none;startFill=0;labelBackgroundColor=#FFFFFF;edgeStyle=orthogonalEdgeStyle;rounded=0;jettySize=0;strokeColor=#849BB0;strokeWidth=1.7;exitX=1;exitY=0.5;entryX=1;entryY=0.5;exitDx=0;exitDy=0;entryDx=0;entryDy=0;" target="WPUb9v3IqM6d1RAyFusB-162">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="443" y="205" />
              <mxPoint x="440" y="200" />
              <mxPoint x="440" y="180" />
              <mxPoint x="480" y="180" />
              <mxPoint x="480" y="1400" />
              <mxPoint x="460" y="1400" />
              <mxPoint x="460" y="1360" />
              <mxPoint x="456" y="1365" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-454" edge="1" parent="1" source="WPUb9v3IqM6d1RAyFusB-5" style="orthogonalLoop=1;html=1;fontColor=#61768B;defaultLabelBackgroundColor=page;labelPadding=0 4;libavoidRouting=1;startArrow=none;startFill=0;endArrow=none;endFill=0;labelBackgroundColor=#FFFFFF;edgeStyle=orthogonalEdgeStyle;rounded=0;jettySize=0;strokeColor=#849BB0;strokeWidth=1.7;exitX=1;exitY=0.5;entryX=0;entryY=0.5;exitDx=0;exitDy=0;entryDx=0;entryDy=0;" target="WPUb9v3IqM6d1RAyFusB-196">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="443" y="235" />
              <mxPoint x="440" y="240" />
              <mxPoint x="420" y="240" />
              <mxPoint x="420" y="140" />
              <mxPoint x="1980" y="140" />
              <mxPoint x="1980" y="240" />
              <mxPoint x="1974" y="235" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-455" edge="1" parent="1" source="WPUb9v3IqM6d1RAyFusB-159" style="orthogonalLoop=1;html=1;fontColor=#61768B;defaultLabelBackgroundColor=page;labelPadding=0 4;libavoidRouting=1;startArrow=none;startFill=0;endArrow=none;endFill=0;labelBackgroundColor=#FFFFFF;edgeStyle=orthogonalEdgeStyle;rounded=0;jettySize=0;strokeColor=#849BB0;strokeWidth=1.7;exitX=1;exitY=0.5;entryX=0;entryY=0.5;exitDx=0;exitDy=0;entryDx=0;entryDy=0;" target="WPUb9v3IqM6d1RAyFusB-199">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="456" y="1335" />
              <mxPoint x="460" y="1340" />
              <mxPoint x="460" y="1360" />
              <mxPoint x="1980" y="1360" />
              <mxPoint x="1980" y="260" />
              <mxPoint x="1974" y="265" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-457" edge="1" parent="1" source="WPUb9v3IqM6d1RAyFusB-73" style="orthogonalLoop=1;html=1;fontColor=#61768B;defaultLabelBackgroundColor=page;labelPadding=0 4;libavoidRouting=1;startArrow=none;startFill=0;endArrow=none;endFill=0;labelBackgroundColor=#FFFFFF;edgeStyle=orthogonalEdgeStyle;rounded=0;jettySize=0;strokeColor=#849BB0;strokeWidth=1.7;exitX=1;exitY=0.5;entryX=0;entryY=0.5;exitDx=0;exitDy=0;entryDx=0;entryDy=0;" target="WPUb9v3IqM6d1RAyFusB-202">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1066" y="205" />
              <mxPoint x="1060" y="200" />
              <mxPoint x="1060" y="120" />
              <mxPoint x="1960" y="120" />
              <mxPoint x="1960" y="300" />
              <mxPoint x="1980" y="300" />
              <mxPoint x="1974" y="295" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-458" edge="1" parent="1" source="WPUb9v3IqM6d1RAyFusB-119" style="orthogonalLoop=1;html=1;fontColor=#61768B;defaultLabelBackgroundColor=page;labelPadding=0 4;libavoidRouting=1;startArrow=none;startFill=0;endArrow=none;endFill=0;labelBackgroundColor=#FFFFFF;edgeStyle=orthogonalEdgeStyle;rounded=0;jettySize=0;strokeColor=#849BB0;strokeWidth=1.7;exitX=1;exitY=0.5;entryX=0;entryY=0.5;exitDx=0;exitDy=0;entryDx=0;entryDy=0;" target="WPUb9v3IqM6d1RAyFusB-205">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1066" y="895" />
              <mxPoint x="1060" y="900" />
              <mxPoint x="1300" y="900" />
              <mxPoint x="1300" y="1040" />
              <mxPoint x="1960" y="1040" />
              <mxPoint x="1960" y="320" />
              <mxPoint x="1980" y="320" />
              <mxPoint x="1974" y="325" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-460" edge="1" parent="1" source="WPUb9v3IqM6d1RAyFusB-2" style="orthogonalLoop=1;html=1;fontColor=#61768B;defaultLabelBackgroundColor=page;labelPadding=0 4;endArrow=none;endFill=0;startArrow=none;startFill=0;labelBackgroundColor=#FFFFFF;edgeStyle=orthogonalEdgeStyle;rounded=0;jettySize=0;strokeColor=#849BB0;strokeWidth=1.7;exitX=1;exitY=0.5;entryX=0;entryY=0.5;exitDx=0;exitDy=0;entryDx=0;entryDy=0;" target="WPUb9v3IqM6d1RAyFusB-272" value="&amp;nbsp; ">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="443" y="205" />
              <mxPoint x="440" y="200" />
              <mxPoint x="440" y="820" />
              <mxPoint x="1320" y="820" />
              <mxPoint x="1320" y="1220" />
              <mxPoint x="1980" y="1220" />
              <mxPoint x="1974" y="1215" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-461" edge="1" parent="1" source="WPUb9v3IqM6d1RAyFusB-159" style="orthogonalLoop=1;html=1;fontColor=#61768B;defaultLabelBackgroundColor=page;labelPadding=0 4;startArrow=none;startFill=0;endArrow=none;endFill=0;labelBackgroundColor=#FFFFFF;edgeStyle=orthogonalEdgeStyle;rounded=0;jettySize=0;strokeColor=#849BB0;strokeWidth=1.7;exitX=1;exitY=0.5;entryX=0;entryY=0.5;exitDx=0;exitDy=0;entryDx=0;entryDy=0;" target="WPUb9v3IqM6d1RAyFusB-275">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="456" y="1335" />
              <mxPoint x="460" y="1340" />
              <mxPoint x="440" y="1340" />
              <mxPoint x="440" y="1380" />
              <mxPoint x="1960" y="1380" />
              <mxPoint x="1960" y="1240" />
              <mxPoint x="1980" y="1240" />
              <mxPoint x="1974" y="1245" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-462" edge="1" parent="1" source="WPUb9v3IqM6d1RAyFusB-73" style="orthogonalLoop=1;html=1;fontColor=#61768B;defaultLabelBackgroundColor=page;labelPadding=0 4;endArrow=none;endFill=0;startArrow=none;startFill=0;labelBackgroundColor=#FFFFFF;edgeStyle=orthogonalEdgeStyle;rounded=0;jettySize=0;strokeColor=#849BB0;strokeWidth=1.7;exitX=1;exitY=0.5;entryX=0;entryY=0.5;exitDx=0;exitDy=0;entryDx=0;entryDy=0;" target="WPUb9v3IqM6d1RAyFusB-278">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1066" y="205" />
              <mxPoint x="1060" y="200" />
              <mxPoint x="1060" y="1280" />
              <mxPoint x="1980" y="1280" />
              <mxPoint x="1974" y="1275" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-463" edge="1" parent="1" source="WPUb9v3IqM6d1RAyFusB-119" style="orthogonalLoop=1;html=1;fontColor=#61768B;defaultLabelBackgroundColor=page;labelPadding=0 4;startArrow=none;startFill=0;endArrow=none;endFill=0;labelBackgroundColor=#FFFFFF;edgeStyle=orthogonalEdgeStyle;rounded=0;jettySize=0;strokeColor=#849BB0;strokeWidth=1.7;exitX=1;exitY=0.5;entryX=0;entryY=0.5;exitDx=0;exitDy=0;entryDx=0;entryDy=0;" target="WPUb9v3IqM6d1RAyFusB-281">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1066" y="895" />
              <mxPoint x="1060" y="900" />
              <mxPoint x="1080" y="900" />
              <mxPoint x="1080" y="1300" />
              <mxPoint x="1980" y="1300" />
              <mxPoint x="1974" y="1302" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-464" edge="1" parent="1" source="WPUb9v3IqM6d1RAyFusB-2" style="orthogonalLoop=1;html=1;fontColor=#61768B;defaultLabelBackgroundColor=page;labelPadding=0 4;libavoidRouting=1;endArrow=none;endFill=0;startArrow=none;startFill=0;labelBackgroundColor=#FFFFFF;edgeStyle=orthogonalEdgeStyle;rounded=0;jettySize=0;strokeColor=#849BB0;strokeWidth=1.7;exitX=1;exitY=0.5;entryX=0;entryY=0.5;exitDx=0;exitDy=0;entryDx=0;entryDy=0;" target="WPUb9v3IqM6d1RAyFusB-324">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="443" y="205" />
              <mxPoint x="440" y="200" />
              <mxPoint x="680" y="200" />
              <mxPoint x="680" y="100" />
              <mxPoint x="1300" y="100" />
              <mxPoint x="1300" y="240" />
              <mxPoint x="1304" y="235" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-465" edge="1" parent="1" source="WPUb9v3IqM6d1RAyFusB-159" style="orthogonalLoop=1;html=1;fontColor=#61768B;defaultLabelBackgroundColor=page;labelPadding=0 4;libavoidRouting=1;endArrow=none;endFill=0;startArrow=none;startFill=0;labelBackgroundColor=#FFFFFF;edgeStyle=orthogonalEdgeStyle;rounded=0;jettySize=0;strokeColor=#849BB0;strokeWidth=1.7;exitX=1;exitY=0.5;entryX=0;entryY=0.5;exitDx=0;exitDy=0;entryDx=0;entryDy=0;" target="WPUb9v3IqM6d1RAyFusB-327">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="456" y="1335" />
              <mxPoint x="460" y="1340" />
              <mxPoint x="460" y="660" />
              <mxPoint x="1300" y="660" />
              <mxPoint x="1300" y="280" />
              <mxPoint x="1304" y="272" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WPUb9v3IqM6d1RAyFusB-466" edge="1" parent="1" source="WPUb9v3IqM6d1RAyFusB-73" style="orthogonalLoop=1;html=1;fontColor=#61768B;defaultLabelBackgroundColor=page;labelPadding=0 4;endArrow=none;startArrow=none;labelBackgroundColor=#FFFFFF;edgeStyle=orthogonalEdgeStyle;rounded=0;jettySize=0;strokeColor=#849BB0;strokeWidth=1.7;exitX=1;exitY=0.5;entryX=0;entryY=0.5;exitDx=0;exitDy=0;entryDx=0;entryDy=0;" target="WPUb9v3IqM6d1RAyFusB-330">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1066" y="205" />
              <mxPoint x="1060" y="200" />
              <mxPoint x="1060" y="180" />
              <mxPoint x="1280" y="180" />
              <mxPoint x="1280" y="300" />
              <mxPoint x="1300" y="300" />
              <mxPoint x="1304" y="308" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="financeio_header_v2" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=29;fontStyle=1;fontColor=#354A61;strokeColor=none;fillColor=none;" value="FINANCE.IO  |  MODELO LÓGICO RELACIONAL" vertex="1">
          <mxGeometry height="65" width="1450" x="70" y="25" as="geometry" />
        </mxCell>
        <mxCell id="financeio_caption_v2" parent="1" style="text;html=1;align=left;verticalAlign=middle;fontSize=15;fontColor=#6D8195;strokeColor=none;fillColor=none;" value="Tabelas agrupadas por domínio  •  PK em azul claro  •  Linhas ortogonais em cinza-azulado" vertex="1">
          <mxGeometry height="36" width="1900" x="70" y="87" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
  <diagram id="finance-conceptual-v1" name="modelo-conceitual">
    <mxGraphModel grid="1" page="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" pageScale="1" pageWidth="2760" pageHeight="1780" background="#FFFFFF" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="relation-1" edge="1" parent="1" source="entity-users" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-addresses" value="possui  [1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-2" edge="1" parent="1" source="entity-users" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-bank_accounts" value="mantém  [1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-3" edge="1" parent="1" source="entity-bank_accounts" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-cards" value="vincula  [1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-4" edge="1" parent="1" source="entity-users" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-categories" value="define  [1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-5" edge="1" parent="1" source="entity-users" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-recurrence_rules" value="programa  [1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-6" edge="1" parent="1" source="entity-categories" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-recurrence_rules" value="classifica  [1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-7" edge="1" parent="1" source="entity-bank_accounts" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-recurrence_rules" value="financia  [0..1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-8" edge="1" parent="1" source="entity-cards" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-recurrence_rules" value="paga  [0..1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-9" edge="1" parent="1" source="entity-users" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-installment_plans" value="registra  [1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-10" edge="1" parent="1" source="entity-categories" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-installment_plans" value="classifica  [1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-11" edge="1" parent="1" source="entity-bank_accounts" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-installment_plans" value="financia  [0..1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-12" edge="1" parent="1" source="entity-cards" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-installment_plans" value="paga  [0..1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-13" edge="1" parent="1" source="entity-users" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-transactions" value="registra  [1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-14" edge="1" parent="1" source="entity-categories" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-transactions" value="classifica  [1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-15" edge="1" parent="1" source="entity-bank_accounts" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-transactions" value="movimenta  [0..1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-16" edge="1" parent="1" source="entity-cards" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-transactions" value="paga  [0..1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-17" edge="1" parent="1" source="entity-recurrence_rules" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-transactions" value="origina  [0..1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="relation-18" edge="1" parent="1" source="entity-installment_plans" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=26;html=1;strokeColor=#A1B4C4;strokeWidth=1.35;fontColor=#5C6D7F;fontSize=11;labelBackgroundColor=#FFFFFF;endArrow=none;startArrow=none;startSize=7;endSize=7;" target="entity-transactions" value="desdobra  [0..1 : 0..N]">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="title-concept" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=27;fontStyle=1;fontColor=#25435D;strokeColor=none;fillColor=none;" value="FINANCE.IO  |  MODELO CONCEITUAL" vertex="1">
          <mxGeometry height="55" width="950" x="100" y="32" as="geometry" />
        </mxCell>
        <mxCell id="subtitle-concept" parent="1" style="text;html=1;whiteSpace=wrap;align=left;fontSize=14;fontColor=#64748B;strokeColor=none;fillColor=none;" value="Entidades de negócio, atributos e associações • 1 : N e 0 : N representam cardinalidades inferidas das chaves estrangeiras" vertex="1">
          <mxGeometry height="28" width="1600" x="100" y="88" as="geometry" />
        </mxCell>
        <mxCell id="entity-users" parent="1" style="rounded=1;arcSize=10;whiteSpace=wrap;html=1;align=left;verticalAlign=top;spacing=12;fillColor=#FFFFFF;strokeColor=#99BDDF;strokeWidth=1.5;shadow=0;fontColor=#334155;" value="" vertex="1">
          <mxGeometry height="168" width="335" x="80" y="180" as="geometry" />
        </mxCell>
        <mxCell id="header-users" parent="1" style="rounded=1;arcSize=9;whiteSpace=wrap;html=1;align=center;verticalAlign=middle;fillColor=#E3F0FE;strokeColor=#99BDDF;fontStyle=1;fontSize=17;fontColor=#2D4356;" value="USUÁRIO" vertex="1">
          <mxGeometry height="45" width="335" x="80" y="180" as="geometry" />
        </mxCell>
        <mxCell id="attr-users-0" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Nome completo" vertex="1">
          <mxGeometry height="25" width="307" x="98" y="232" as="geometry" />
        </mxCell>
        <mxCell id="attr-users-1" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Nome de usuário" vertex="1">
          <mxGeometry height="25" width="307" x="98" y="259" as="geometry" />
        </mxCell>
        <mxCell id="attr-users-2" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="E-mail" vertex="1">
          <mxGeometry height="25" width="307" x="98" y="286" as="geometry" />
        </mxCell>
        <mxCell id="attr-users-3" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Senha de acesso" vertex="1">
          <mxGeometry height="25" width="307" x="98" y="313" as="geometry" />
        </mxCell>
        <mxCell id="entity-addresses" parent="1" style="rounded=1;arcSize=10;whiteSpace=wrap;html=1;align=left;verticalAlign=top;spacing=12;fillColor=#FFFFFF;strokeColor=#99BDDF;strokeWidth=1.5;shadow=0;fontColor=#334155;" value="" vertex="1">
          <mxGeometry height="303" width="335" x="80" y="680" as="geometry" />
        </mxCell>
        <mxCell id="header-addresses" parent="1" style="rounded=1;arcSize=9;whiteSpace=wrap;html=1;align=center;verticalAlign=middle;fillColor=#E3F0FE;strokeColor=#99BDDF;fontStyle=1;fontSize=17;fontColor=#2D4356;" value="ENDEREÇO" vertex="1">
          <mxGeometry height="45" width="335" x="80" y="680" as="geometry" />
        </mxCell>
        <mxCell id="attr-addresses-0" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="CEP" vertex="1">
          <mxGeometry height="25" width="307" x="98" y="732" as="geometry" />
        </mxCell>
        <mxCell id="attr-addresses-1" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Logradouro" vertex="1">
          <mxGeometry height="25" width="307" x="98" y="759" as="geometry" />
        </mxCell>
        <mxCell id="attr-addresses-2" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Número" vertex="1">
          <mxGeometry height="25" width="307" x="98" y="786" as="geometry" />
        </mxCell>
        <mxCell id="attr-addresses-3" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Complemento" vertex="1">
          <mxGeometry height="25" width="307" x="98" y="813" as="geometry" />
        </mxCell>
        <mxCell id="attr-addresses-4" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Bairro" vertex="1">
          <mxGeometry height="25" width="307" x="98" y="840" as="geometry" />
        </mxCell>
        <mxCell id="attr-addresses-5" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Cidade" vertex="1">
          <mxGeometry height="25" width="307" x="98" y="867" as="geometry" />
        </mxCell>
        <mxCell id="attr-addresses-6" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Estado" vertex="1">
          <mxGeometry height="25" width="307" x="98" y="894" as="geometry" />
        </mxCell>
        <mxCell id="attr-addresses-7" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Referência" vertex="1">
          <mxGeometry height="25" width="307" x="98" y="921" as="geometry" />
        </mxCell>
        <mxCell id="attr-addresses-8" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Residência principal" vertex="1">
          <mxGeometry height="25" width="307" x="98" y="948" as="geometry" />
        </mxCell>
        <mxCell id="entity-bank_accounts" parent="1" style="rounded=1;arcSize=10;whiteSpace=wrap;html=1;align=left;verticalAlign=top;spacing=12;fillColor=#FFFFFF;strokeColor=#A8D7B7;strokeWidth=1.5;shadow=0;fontColor=#334155;" value="" vertex="1">
          <mxGeometry height="276" width="335" x="650" y="180" as="geometry" />
        </mxCell>
        <mxCell id="header-bank_accounts" parent="1" style="rounded=1;arcSize=9;whiteSpace=wrap;html=1;align=center;verticalAlign=middle;fillColor=#E6F6EC;strokeColor=#A8D7B7;fontStyle=1;fontSize=17;fontColor=#2D4356;" value="CONTA BANCÁRIA" vertex="1">
          <mxGeometry height="45" width="335" x="650" y="180" as="geometry" />
        </mxCell>
        <mxCell id="attr-bank_accounts-0" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Apelido" vertex="1">
          <mxGeometry height="25" width="307" x="668" y="232" as="geometry" />
        </mxCell>
        <mxCell id="attr-bank_accounts-1" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Banco" vertex="1">
          <mxGeometry height="25" width="307" x="668" y="259" as="geometry" />
        </mxCell>
        <mxCell id="attr-bank_accounts-2" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Agência" vertex="1">
          <mxGeometry height="25" width="307" x="668" y="286" as="geometry" />
        </mxCell>
        <mxCell id="attr-bank_accounts-3" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Número da conta" vertex="1">
          <mxGeometry height="25" width="307" x="668" y="313" as="geometry" />
        </mxCell>
        <mxCell id="attr-bank_accounts-4" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Tipo de conta" vertex="1">
          <mxGeometry height="25" width="307" x="668" y="340" as="geometry" />
        </mxCell>
        <mxCell id="attr-bank_accounts-5" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Saldo inicial" vertex="1">
          <mxGeometry height="25" width="307" x="668" y="367" as="geometry" />
        </mxCell>
        <mxCell id="attr-bank_accounts-6" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Cor de identificação" vertex="1">
          <mxGeometry height="25" width="307" x="668" y="394" as="geometry" />
        </mxCell>
        <mxCell id="attr-bank_accounts-7" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Ativa" vertex="1">
          <mxGeometry height="25" width="307" x="668" y="421" as="geometry" />
        </mxCell>
        <mxCell id="entity-cards" parent="1" style="rounded=1;arcSize=10;whiteSpace=wrap;html=1;align=left;verticalAlign=top;spacing=12;fillColor=#FFFFFF;strokeColor=#A8D7B7;strokeWidth=1.5;shadow=0;fontColor=#334155;" value="" vertex="1">
          <mxGeometry height="249" width="335" x="650" y="710" as="geometry" />
        </mxCell>
        <mxCell id="header-cards" parent="1" style="rounded=1;arcSize=9;whiteSpace=wrap;html=1;align=center;verticalAlign=middle;fillColor=#E6F6EC;strokeColor=#A8D7B7;fontStyle=1;fontSize=17;fontColor=#2D4356;" value="CARTÃO" vertex="1">
          <mxGeometry height="45" width="335" x="650" y="710" as="geometry" />
        </mxCell>
        <mxCell id="attr-cards-0" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Apelido" vertex="1">
          <mxGeometry height="25" width="307" x="668" y="762" as="geometry" />
        </mxCell>
        <mxCell id="attr-cards-1" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Últimos quatro dígitos" vertex="1">
          <mxGeometry height="25" width="307" x="668" y="789" as="geometry" />
        </mxCell>
        <mxCell id="attr-cards-2" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Validade" vertex="1">
          <mxGeometry height="25" width="307" x="668" y="816" as="geometry" />
        </mxCell>
        <mxCell id="attr-cards-3" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Tipo" vertex="1">
          <mxGeometry height="25" width="307" x="668" y="843" as="geometry" />
        </mxCell>
        <mxCell id="attr-cards-4" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Limite de crédito" vertex="1">
          <mxGeometry height="25" width="307" x="668" y="870" as="geometry" />
        </mxCell>
        <mxCell id="attr-cards-5" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Cor de identificação" vertex="1">
          <mxGeometry height="25" width="307" x="668" y="897" as="geometry" />
        </mxCell>
        <mxCell id="attr-cards-6" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Ativo" vertex="1">
          <mxGeometry height="25" width="307" x="668" y="924" as="geometry" />
        </mxCell>
        <mxCell id="entity-categories" parent="1" style="rounded=1;arcSize=10;whiteSpace=wrap;html=1;align=left;verticalAlign=top;spacing=12;fillColor=#FFFFFF;strokeColor=#E6CBA4;strokeWidth=1.5;shadow=0;fontColor=#334155;" value="" vertex="1">
          <mxGeometry height="168" width="335" x="1260" y="180" as="geometry" />
        </mxCell>
        <mxCell id="header-categories" parent="1" style="rounded=1;arcSize=9;whiteSpace=wrap;html=1;align=center;verticalAlign=middle;fillColor=#FFF2DF;strokeColor=#E6CBA4;fontStyle=1;fontSize=17;fontColor=#2D4356;" value="CATEGORIA" vertex="1">
          <mxGeometry height="45" width="335" x="1260" y="180" as="geometry" />
        </mxCell>
        <mxCell id="attr-categories-0" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Nome" vertex="1">
          <mxGeometry height="25" width="307" x="1278" y="232" as="geometry" />
        </mxCell>
        <mxCell id="attr-categories-1" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Tipo de categoria" vertex="1">
          <mxGeometry height="25" width="307" x="1278" y="259" as="geometry" />
        </mxCell>
        <mxCell id="attr-categories-2" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Cor de identificação" vertex="1">
          <mxGeometry height="25" width="307" x="1278" y="286" as="geometry" />
        </mxCell>
        <mxCell id="attr-categories-3" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Ativa" vertex="1">
          <mxGeometry height="25" width="307" x="1278" y="313" as="geometry" />
        </mxCell>
        <mxCell id="entity-recurrence_rules" parent="1" style="rounded=1;arcSize=10;whiteSpace=wrap;html=1;align=left;verticalAlign=top;spacing=12;fillColor=#FFFFFF;strokeColor=#CAB5E9;strokeWidth=1.5;shadow=0;fontColor=#334155;" value="" vertex="1">
          <mxGeometry height="411" width="335" x="1920" y="180" as="geometry" />
        </mxCell>
        <mxCell id="header-recurrence_rules" parent="1" style="rounded=1;arcSize=9;whiteSpace=wrap;html=1;align=center;verticalAlign=middle;fillColor=#F0E9FF;strokeColor=#CAB5E9;fontStyle=1;fontSize=17;fontColor=#2D4356;" value="REGRA DE RECORRÊNCIA" vertex="1">
          <mxGeometry height="45" width="335" x="1920" y="180" as="geometry" />
        </mxCell>
        <mxCell id="attr-recurrence_rules-0" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Título" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="232" as="geometry" />
        </mxCell>
        <mxCell id="attr-recurrence_rules-1" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Descrição" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="259" as="geometry" />
        </mxCell>
        <mxCell id="attr-recurrence_rules-2" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Tipo de movimentação" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="286" as="geometry" />
        </mxCell>
        <mxCell id="attr-recurrence_rules-3" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Valor" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="313" as="geometry" />
        </mxCell>
        <mxCell id="attr-recurrence_rules-4" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Fonte de receita" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="340" as="geometry" />
        </mxCell>
        <mxCell id="attr-recurrence_rules-5" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Meio de pagamento" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="367" as="geometry" />
        </mxCell>
        <mxCell id="attr-recurrence_rules-6" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Frequência" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="394" as="geometry" />
        </mxCell>
        <mxCell id="attr-recurrence_rules-7" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Modo de agendamento" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="421" as="geometry" />
        </mxCell>
        <mxCell id="attr-recurrence_rules-8" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Data programada" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="448" as="geometry" />
        </mxCell>
        <mxCell id="attr-recurrence_rules-9" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Ordem de dia útil" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="475" as="geometry" />
        </mxCell>
        <mxCell id="attr-recurrence_rules-10" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Início" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="502" as="geometry" />
        </mxCell>
        <mxCell id="attr-recurrence_rules-11" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Término" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="529" as="geometry" />
        </mxCell>
        <mxCell id="attr-recurrence_rules-12" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Ativa" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="556" as="geometry" />
        </mxCell>
        <mxCell id="entity-installment_plans" parent="1" style="rounded=1;arcSize=10;whiteSpace=wrap;html=1;align=left;verticalAlign=top;spacing=12;fillColor=#FFFFFF;strokeColor=#CAB5E9;strokeWidth=1.5;shadow=0;fontColor=#334155;" value="" vertex="1">
          <mxGeometry height="195" width="335" x="1260" y="710" as="geometry" />
        </mxCell>
        <mxCell id="header-installment_plans" parent="1" style="rounded=1;arcSize=9;whiteSpace=wrap;html=1;align=center;verticalAlign=middle;fillColor=#F0E9FF;strokeColor=#CAB5E9;fontStyle=1;fontSize=17;fontColor=#2D4356;" value="PLANO DE PARCELAMENTO" vertex="1">
          <mxGeometry height="45" width="335" x="1260" y="710" as="geometry" />
        </mxCell>
        <mxCell id="attr-installment_plans-0" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Descrição" vertex="1">
          <mxGeometry height="25" width="307" x="1278" y="762" as="geometry" />
        </mxCell>
        <mxCell id="attr-installment_plans-1" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Valor total" vertex="1">
          <mxGeometry height="25" width="307" x="1278" y="789" as="geometry" />
        </mxCell>
        <mxCell id="attr-installment_plans-2" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Quantidade de parcelas" vertex="1">
          <mxGeometry height="25" width="307" x="1278" y="816" as="geometry" />
        </mxCell>
        <mxCell id="attr-installment_plans-3" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Data da compra" vertex="1">
          <mxGeometry height="25" width="307" x="1278" y="843" as="geometry" />
        </mxCell>
        <mxCell id="attr-installment_plans-4" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Meio de pagamento" vertex="1">
          <mxGeometry height="25" width="307" x="1278" y="870" as="geometry" />
        </mxCell>
        <mxCell id="entity-transactions" parent="1" style="rounded=1;arcSize=10;whiteSpace=wrap;html=1;align=left;verticalAlign=top;spacing=12;fillColor=#FFFFFF;strokeColor=#E8B6C5;strokeWidth=1.5;shadow=0;fontColor=#334155;" value="" vertex="1">
          <mxGeometry height="357" width="335" x="1920" y="900" as="geometry" />
        </mxCell>
        <mxCell id="header-transactions" parent="1" style="rounded=1;arcSize=9;whiteSpace=wrap;html=1;align=center;verticalAlign=middle;fillColor=#FCEAF0;strokeColor=#E8B6C5;fontStyle=1;fontSize=17;fontColor=#2D4356;" value="TRANSAÇÃO" vertex="1">
          <mxGeometry height="45" width="335" x="1920" y="900" as="geometry" />
        </mxCell>
        <mxCell id="attr-transactions-0" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Título" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="952" as="geometry" />
        </mxCell>
        <mxCell id="attr-transactions-1" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Descrição" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="979" as="geometry" />
        </mxCell>
        <mxCell id="attr-transactions-2" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Tipo" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="1006" as="geometry" />
        </mxCell>
        <mxCell id="attr-transactions-3" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Valor" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="1033" as="geometry" />
        </mxCell>
        <mxCell id="attr-transactions-4" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Ocorrência" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="1060" as="geometry" />
        </mxCell>
        <mxCell id="attr-transactions-5" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Data programada" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="1087" as="geometry" />
        </mxCell>
        <mxCell id="attr-transactions-6" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Situação" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="1114" as="geometry" />
        </mxCell>
        <mxCell id="attr-transactions-7" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Fonte de receita" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="1141" as="geometry" />
        </mxCell>
        <mxCell id="attr-transactions-8" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Meio de pagamento" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="1168" as="geometry" />
        </mxCell>
        <mxCell id="attr-transactions-9" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Número da parcela" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="1195" as="geometry" />
        </mxCell>
        <mxCell id="attr-transactions-10" parent="1" style="text;html=1;whiteSpace=wrap;align=left;verticalAlign=middle;fontSize=13;fontColor=#405569;fillColor=none;strokeColor=none;spacingLeft=0;" value="Total de parcelas" vertex="1">
          <mxGeometry height="25" width="307" x="1938" y="1222" as="geometry" />
        </mxCell>
        <mxCell id="legend" parent="1" style="text;html=1;whiteSpace=wrap;align=left;fontSize=12;fontColor=#64748B;fillColor=none;strokeColor=none;" value="Notação: [1 : 0..N] = uma entidade pode estar relacionada a zero ou muitas instâncias da outra. Associações opcionais são inferidas das FKs anuláveis." vertex="1">
          <mxGeometry height="46" width="1800" x="95" y="1580" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
  <diagram name="01 - Modelo lógico completo" id="kVXzKhFtxHElT-ilfQYv">
    <mxGraphModel grid="1" page="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" pageScale="1" pageWidth="1970" pageHeight="1840" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="main_title" parent="1" style="text;html=1;align=left;verticalAlign=middle;fontFamily=Helvetica;fontSize=30;fontStyle=1;fontColor=#17283C;" value="Finance.io  |  MODELO LÓGICO RELACIONAL" vertex="1">
          <mxGeometry height="50" width="1300" x="45" y="22" as="geometry" />
        </mxCell>
        <mxCell id="subtitle" parent="1" style="text;html=1;align=left;fontFamily=Helvetica;fontSize=15;fontColor=#617086;" value="8 entidades  •  Chaves primárias, estrangeiras e restrições preservadas  •  Organizado por domínio" vertex="1">
          <mxGeometry height="30" width="1780" x="45" y="76" as="geometry" />
        </mxCell>
        <mxCell id="header_users" parent="1" style="rounded=1;arcSize=8;whiteSpace=wrap;html=1;align=left;spacingLeft=15;verticalAlign=middle;fontFamily=Helvetica;fontStyle=1;fontSize=18;fontColor=#FFFFFF;fillColor=#12304E;strokeColor=#12304E;" value="USERS  ·  8 campos" vertex="1">
          <mxGeometry height="44" width="435" x="45" y="125" as="geometry" />
        </mxCell>
        <mxCell id="field_users_0" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#E5EFFB;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;PK&lt;/b&gt;   &lt;b&gt;id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="169" as="geometry" />
        </mxCell>
        <mxCell id="field_users_1" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;full_name&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(100) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="196" as="geometry" />
        </mxCell>
        <mxCell id="field_users_2" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;username&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(100) NOT NULL UNIQUE&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="223" as="geometry" />
        </mxCell>
        <mxCell id="field_users_3" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;email&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(100) NOT NULL UNIQUE&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="250" as="geometry" />
        </mxCell>
        <mxCell id="field_users_4" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;password_hash&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(255) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="277" as="geometry" />
        </mxCell>
        <mxCell id="field_users_5" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;created_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="304" as="geometry" />
        </mxCell>
        <mxCell id="field_users_6" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;updated_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="331" as="geometry" />
        </mxCell>
        <mxCell id="field_users_7" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;deleted_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="358" as="geometry" />
        </mxCell>
        <mxCell id="header_addresses" parent="1" style="rounded=1;arcSize=8;whiteSpace=wrap;html=1;align=left;spacingLeft=15;verticalAlign=middle;fontFamily=Helvetica;fontStyle=1;fontSize=18;fontColor=#FFFFFF;fillColor=#17657A;strokeColor=#17657A;" value="ADDRESSES  ·  14 campos" vertex="1">
          <mxGeometry height="44" width="435" x="45" y="500" as="geometry" />
        </mxCell>
        <mxCell id="field_addresses_0" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#E5EFFB;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;PK&lt;/b&gt;   &lt;b&gt;id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="544" as="geometry" />
        </mxCell>
        <mxCell id="field_addresses_1" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;user_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="571" as="geometry" />
        </mxCell>
        <mxCell id="field_addresses_2" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;postal_code&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(8)&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="598" as="geometry" />
        </mxCell>
        <mxCell id="field_addresses_3" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;street&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(150) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="625" as="geometry" />
        </mxCell>
        <mxCell id="field_addresses_4" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;number&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(10)&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="652" as="geometry" />
        </mxCell>
        <mxCell id="field_addresses_5" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;complement&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(100)&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="679" as="geometry" />
        </mxCell>
        <mxCell id="field_addresses_6" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;district&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(100) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="706" as="geometry" />
        </mxCell>
        <mxCell id="field_addresses_7" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;city&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(100) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="733" as="geometry" />
        </mxCell>
        <mxCell id="field_addresses_8" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;state&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;CHAR(2) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="760" as="geometry" />
        </mxCell>
        <mxCell id="field_addresses_9" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;reference&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(250)&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="787" as="geometry" />
        </mxCell>
        <mxCell id="field_addresses_10" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;is_main_residence&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;BOOLEAN NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="814" as="geometry" />
        </mxCell>
        <mxCell id="field_addresses_11" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;created_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="841" as="geometry" />
        </mxCell>
        <mxCell id="field_addresses_12" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;updated_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="868" as="geometry" />
        </mxCell>
        <mxCell id="field_addresses_13" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;deleted_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="895" as="geometry" />
        </mxCell>
        <mxCell id="conslabel_addresses" parent="1" style="rounded=0;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontSize=11;fontStyle=1;fontColor=#17657A;fillColor=#E8F7FA;strokeColor=#DDE5ED;" value="RESTRIÇÕES / REFERÊNCIAS" vertex="1">
          <mxGeometry height="23" width="435" x="45" y="922" as="geometry" />
        </mxCell>
        <mxCell id="constraint_addresses_0" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (user_id) REFERENCES users(id)" vertex="1">
          <mxGeometry height="23" width="435" x="45" y="945" as="geometry" />
        </mxCell>
        <mxCell id="header_bank_accounts" parent="1" style="rounded=1;arcSize=8;whiteSpace=wrap;html=1;align=left;spacingLeft=15;verticalAlign=middle;fontFamily=Helvetica;fontStyle=1;fontSize=18;fontColor=#FFFFFF;fillColor=#245E4B;strokeColor=#245E4B;" value="BANK_ACCOUNTS  ·  13 campos" vertex="1">
          <mxGeometry height="44" width="435" x="525" y="125" as="geometry" />
        </mxCell>
        <mxCell id="field_bank_accounts_0" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#E5EFFB;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;PK&lt;/b&gt;   &lt;b&gt;id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="169" as="geometry" />
        </mxCell>
        <mxCell id="field_bank_accounts_1" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;user_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="196" as="geometry" />
        </mxCell>
        <mxCell id="field_bank_accounts_2" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;nickname&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(100) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="223" as="geometry" />
        </mxCell>
        <mxCell id="field_bank_accounts_3" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;bank_name&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(100) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="250" as="geometry" />
        </mxCell>
        <mxCell id="field_bank_accounts_4" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;branch_number&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(20) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="277" as="geometry" />
        </mxCell>
        <mxCell id="field_bank_accounts_5" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;account_number&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(30) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="304" as="geometry" />
        </mxCell>
        <mxCell id="field_bank_accounts_6" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;account_type&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(20) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="331" as="geometry" />
        </mxCell>
        <mxCell id="field_bank_accounts_7" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;identification_color&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(7)&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="358" as="geometry" />
        </mxCell>
        <mxCell id="field_bank_accounts_8" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;initial_balance&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;NUMERIC(14, 2) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="385" as="geometry" />
        </mxCell>
        <mxCell id="field_bank_accounts_9" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;is_active&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;BOOLEAN NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="412" as="geometry" />
        </mxCell>
        <mxCell id="field_bank_accounts_10" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;created_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="439" as="geometry" />
        </mxCell>
        <mxCell id="field_bank_accounts_11" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;updated_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="466" as="geometry" />
        </mxCell>
        <mxCell id="field_bank_accounts_12" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;deleted_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="493" as="geometry" />
        </mxCell>
        <mxCell id="conslabel_bank_accounts" parent="1" style="rounded=0;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontSize=11;fontStyle=1;fontColor=#245E4B;fillColor=#EAF6F0;strokeColor=#DDE5ED;" value="RESTRIÇÕES / REFERÊNCIAS" vertex="1">
          <mxGeometry height="23" width="435" x="525" y="520" as="geometry" />
        </mxCell>
        <mxCell id="constraint_bank_accounts_0" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="UNIQUE (user_id, bank_name, branch_number, account_number)" vertex="1">
          <mxGeometry height="23" width="435" x="525" y="543" as="geometry" />
        </mxCell>
        <mxCell id="constraint_bank_accounts_1" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (user_id) REFERENCES users(id)" vertex="1">
          <mxGeometry height="23" width="435" x="525" y="566" as="geometry" />
        </mxCell>
        <mxCell id="header_cards" parent="1" style="rounded=1;arcSize=8;whiteSpace=wrap;html=1;align=left;spacingLeft=15;verticalAlign=middle;fontFamily=Helvetica;fontStyle=1;fontSize=18;fontColor=#FFFFFF;fillColor=#245E4B;strokeColor=#245E4B;" value="CARDS  ·  12 campos" vertex="1">
          <mxGeometry height="44" width="435" x="525" y="740" as="geometry" />
        </mxCell>
        <mxCell id="field_cards_0" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#E5EFFB;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;PK&lt;/b&gt;   &lt;b&gt;id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="784" as="geometry" />
        </mxCell>
        <mxCell id="field_cards_1" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;account_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="811" as="geometry" />
        </mxCell>
        <mxCell id="field_cards_2" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;nickname&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(100) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="838" as="geometry" />
        </mxCell>
        <mxCell id="field_cards_3" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;last_four_digits&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;CHAR(4) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="865" as="geometry" />
        </mxCell>
        <mxCell id="field_cards_4" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;expiration_date&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;DATE NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="892" as="geometry" />
        </mxCell>
        <mxCell id="field_cards_5" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;card_type&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(10) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="919" as="geometry" />
        </mxCell>
        <mxCell id="field_cards_6" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;credit_limit&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;NUMERIC(14, 2)&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="946" as="geometry" />
        </mxCell>
        <mxCell id="field_cards_7" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;identification_color&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(7)&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="973" as="geometry" />
        </mxCell>
        <mxCell id="field_cards_8" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;is_active&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;BOOLEAN NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="1000" as="geometry" />
        </mxCell>
        <mxCell id="field_cards_9" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;created_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="1027" as="geometry" />
        </mxCell>
        <mxCell id="field_cards_10" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;updated_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="1054" as="geometry" />
        </mxCell>
        <mxCell id="field_cards_11" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;deleted_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="525" y="1081" as="geometry" />
        </mxCell>
        <mxCell id="conslabel_cards" parent="1" style="rounded=0;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontSize=11;fontStyle=1;fontColor=#245E4B;fillColor=#EAF6F0;strokeColor=#DDE5ED;" value="RESTRIÇÕES / REFERÊNCIAS" vertex="1">
          <mxGeometry height="23" width="435" x="525" y="1108" as="geometry" />
        </mxCell>
        <mxCell id="constraint_cards_0" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (account_id) REFERENCES bank_accounts(id)" vertex="1">
          <mxGeometry height="23" width="435" x="525" y="1131" as="geometry" />
        </mxCell>
        <mxCell id="header_categories" parent="1" style="rounded=1;arcSize=8;whiteSpace=wrap;html=1;align=left;spacingLeft=15;verticalAlign=middle;fontFamily=Helvetica;fontStyle=1;fontSize=18;fontColor=#FFFFFF;fillColor=#17657A;strokeColor=#17657A;" value="CATEGORIES  ·  9 campos" vertex="1">
          <mxGeometry height="44" width="435" x="45" y="1140" as="geometry" />
        </mxCell>
        <mxCell id="field_categories_0" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#E5EFFB;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;PK&lt;/b&gt;   &lt;b&gt;id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="1184" as="geometry" />
        </mxCell>
        <mxCell id="field_categories_1" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;user_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="1211" as="geometry" />
        </mxCell>
        <mxCell id="field_categories_2" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;name&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(100) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="1238" as="geometry" />
        </mxCell>
        <mxCell id="field_categories_3" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;category_type&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(10) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="1265" as="geometry" />
        </mxCell>
        <mxCell id="field_categories_4" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;identification_color&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(7)&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="1292" as="geometry" />
        </mxCell>
        <mxCell id="field_categories_5" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;is_active&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;BOOLEAN NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="1319" as="geometry" />
        </mxCell>
        <mxCell id="field_categories_6" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;created_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="1346" as="geometry" />
        </mxCell>
        <mxCell id="field_categories_7" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;updated_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="1373" as="geometry" />
        </mxCell>
        <mxCell id="field_categories_8" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;deleted_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="45" y="1400" as="geometry" />
        </mxCell>
        <mxCell id="conslabel_categories" parent="1" style="rounded=0;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontSize=11;fontStyle=1;fontColor=#17657A;fillColor=#E8F7FA;strokeColor=#DDE5ED;" value="RESTRIÇÕES / REFERÊNCIAS" vertex="1">
          <mxGeometry height="23" width="435" x="45" y="1427" as="geometry" />
        </mxCell>
        <mxCell id="constraint_categories_0" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="UNIQUE (user_id, name, category_type)" vertex="1">
          <mxGeometry height="23" width="435" x="45" y="1450" as="geometry" />
        </mxCell>
        <mxCell id="constraint_categories_1" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (user_id) REFERENCES users(id)" vertex="1">
          <mxGeometry height="23" width="435" x="45" y="1473" as="geometry" />
        </mxCell>
        <mxCell id="header_recurrence_rules" parent="1" style="rounded=1;arcSize=8;whiteSpace=wrap;html=1;align=left;spacingLeft=15;verticalAlign=middle;fontFamily=Helvetica;fontStyle=1;fontSize=18;fontColor=#FFFFFF;fillColor=#674D96;strokeColor=#674D96;" value="RECURRENCE_RULES  ·  21 campos" vertex="1">
          <mxGeometry height="44" width="435" x="1005" y="125" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_0" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#E5EFFB;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;PK&lt;/b&gt;   &lt;b&gt;id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="169" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_1" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;user_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="196" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_2" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;category_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="223" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_3" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;account_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="250" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_4" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;card_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="277" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_5" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;transaction_type&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(10) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="304" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_6" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;title&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(150) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="331" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_7" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;description&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(500)&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="358" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_8" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;amount&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;NUMERIC(14, 2) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="385" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_9" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;income_source&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(30)&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="412" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_10" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;payment_method&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(20)&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="439" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_11" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;frequency&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(10) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="466" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_12" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;schedule_mode&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(20) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="493" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_13" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;scheduled_date&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;DATE NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="520" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_14" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;business_day_ordinal&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;SMALLINT&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="547" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_15" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;starts_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;DATE NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="574" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_16" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;ends_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;DATE&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="601" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_17" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;is_active&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;BOOLEAN NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="628" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_18" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;created_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="655" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_19" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;updated_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="682" as="geometry" />
        </mxCell>
        <mxCell id="field_recurrence_rules_20" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;deleted_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="709" as="geometry" />
        </mxCell>
        <mxCell id="conslabel_recurrence_rules" parent="1" style="rounded=0;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontSize=11;fontStyle=1;fontColor=#674D96;fillColor=#F4EFFB;strokeColor=#DDE5ED;" value="RESTRIÇÕES / REFERÊNCIAS" vertex="1">
          <mxGeometry height="23" width="435" x="1005" y="736" as="geometry" />
        </mxCell>
        <mxCell id="constraint_recurrence_rules_0" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (user_id) REFERENCES users(id)" vertex="1">
          <mxGeometry height="23" width="435" x="1005" y="759" as="geometry" />
        </mxCell>
        <mxCell id="constraint_recurrence_rules_1" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (category_id) REFERENCES categories(id)" vertex="1">
          <mxGeometry height="23" width="435" x="1005" y="782" as="geometry" />
        </mxCell>
        <mxCell id="constraint_recurrence_rules_2" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (account_id) REFERENCES bank_accounts(id)" vertex="1">
          <mxGeometry height="23" width="435" x="1005" y="805" as="geometry" />
        </mxCell>
        <mxCell id="constraint_recurrence_rules_3" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (card_id) REFERENCES cards(id)" vertex="1">
          <mxGeometry height="23" width="435" x="1005" y="828" as="geometry" />
        </mxCell>
        <mxCell id="header_installment_plans" parent="1" style="rounded=1;arcSize=8;whiteSpace=wrap;html=1;align=left;spacingLeft=15;verticalAlign=middle;fontFamily=Helvetica;fontStyle=1;fontSize=18;fontColor=#FFFFFF;fillColor=#674D96;strokeColor=#674D96;" value="INSTALLMENT_PLANS  ·  13 campos" vertex="1">
          <mxGeometry height="44" width="435" x="1005" y="900" as="geometry" />
        </mxCell>
        <mxCell id="field_installment_plans_0" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#E5EFFB;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;PK&lt;/b&gt;   &lt;b&gt;id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="944" as="geometry" />
        </mxCell>
        <mxCell id="field_installment_plans_1" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;user_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="971" as="geometry" />
        </mxCell>
        <mxCell id="field_installment_plans_2" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;category_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="998" as="geometry" />
        </mxCell>
        <mxCell id="field_installment_plans_3" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;account_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="1025" as="geometry" />
        </mxCell>
        <mxCell id="field_installment_plans_4" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;card_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="1052" as="geometry" />
        </mxCell>
        <mxCell id="field_installment_plans_5" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;description&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(500) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="1079" as="geometry" />
        </mxCell>
        <mxCell id="field_installment_plans_6" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;total_amount&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;NUMERIC(14, 2) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="1106" as="geometry" />
        </mxCell>
        <mxCell id="field_installment_plans_7" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;installment_count&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;SMALLINT NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="1133" as="geometry" />
        </mxCell>
        <mxCell id="field_installment_plans_8" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;purchase_date&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;DATE NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="1160" as="geometry" />
        </mxCell>
        <mxCell id="field_installment_plans_9" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;payment_method&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(20) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="1187" as="geometry" />
        </mxCell>
        <mxCell id="field_installment_plans_10" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;created_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="1214" as="geometry" />
        </mxCell>
        <mxCell id="field_installment_plans_11" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;updated_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="1241" as="geometry" />
        </mxCell>
        <mxCell id="field_installment_plans_12" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;deleted_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1005" y="1268" as="geometry" />
        </mxCell>
        <mxCell id="conslabel_installment_plans" parent="1" style="rounded=0;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontSize=11;fontStyle=1;fontColor=#674D96;fillColor=#F4EFFB;strokeColor=#DDE5ED;" value="RESTRIÇÕES / REFERÊNCIAS" vertex="1">
          <mxGeometry height="23" width="435" x="1005" y="1295" as="geometry" />
        </mxCell>
        <mxCell id="constraint_installment_plans_0" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (user_id) REFERENCES users(id)" vertex="1">
          <mxGeometry height="23" width="435" x="1005" y="1318" as="geometry" />
        </mxCell>
        <mxCell id="constraint_installment_plans_1" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (category_id) REFERENCES categories(id)" vertex="1">
          <mxGeometry height="23" width="435" x="1005" y="1341" as="geometry" />
        </mxCell>
        <mxCell id="constraint_installment_plans_2" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (account_id) REFERENCES bank_accounts(id)" vertex="1">
          <mxGeometry height="23" width="435" x="1005" y="1364" as="geometry" />
        </mxCell>
        <mxCell id="constraint_installment_plans_3" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (card_id) REFERENCES cards(id)" vertex="1">
          <mxGeometry height="23" width="435" x="1005" y="1387" as="geometry" />
        </mxCell>
        <mxCell id="header_transactions" parent="1" style="rounded=1;arcSize=8;whiteSpace=wrap;html=1;align=left;spacingLeft=15;verticalAlign=middle;fontFamily=Helvetica;fontStyle=1;fontSize=18;fontColor=#FFFFFF;fillColor=#B15D2C;strokeColor=#B15D2C;" value="TRANSACTIONS  ·  21 campos" vertex="1">
          <mxGeometry height="44" width="435" x="1485" y="125" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_0" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#E5EFFB;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;PK&lt;/b&gt;   &lt;b&gt;id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="169" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_1" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;user_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="196" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_2" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;category_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="223" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_3" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;account_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="250" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_4" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;card_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="277" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_5" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;recurrence_rule_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="304" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_6" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFF3E7;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;FK&lt;/b&gt;   &lt;b&gt;installment_plan_id&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;UUID&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="331" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_7" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;transaction_type&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(10) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="358" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_8" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;title&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(150) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="385" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_9" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;description&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(500)&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="412" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_10" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;amount&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;NUMERIC(14, 2) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="439" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_11" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;occurred_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="466" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_12" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;scheduled_for&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;DATE&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="493" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_13" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;status&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(15) NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="520" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_14" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;income_source&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(30)&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="547" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_15" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;payment_method&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;VARCHAR(20)&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="574" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_16" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;installment_number&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;SMALLINT&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="601" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_17" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;total_installments&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;SMALLINT&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="628" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_18" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;created_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP NOT NULL&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="655" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_19" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#F7F9FC;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;updated_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="682" as="geometry" />
        </mxCell>
        <mxCell id="field_transactions_20" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=12;fontColor=#26374B;fillColor=#FFFFFF;strokeColor=#DFE5EB;strokeWidth=0.5;" value="&lt;b&gt;  &lt;/b&gt;   &lt;b&gt;deleted_at&lt;/b&gt;  &lt;font color=&quot;#637387&quot;&gt;TIMESTAMP&lt;/font&gt;" vertex="1">
          <mxGeometry height="27" width="435" x="1485" y="709" as="geometry" />
        </mxCell>
        <mxCell id="conslabel_transactions" parent="1" style="rounded=0;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontSize=11;fontStyle=1;fontColor=#B15D2C;fillColor=#FFF5E9;strokeColor=#DDE5ED;" value="RESTRIÇÕES / REFERÊNCIAS" vertex="1">
          <mxGeometry height="23" width="435" x="1485" y="736" as="geometry" />
        </mxCell>
        <mxCell id="constraint_transactions_0" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (user_id) REFERENCES users(id)" vertex="1">
          <mxGeometry height="23" width="435" x="1485" y="759" as="geometry" />
        </mxCell>
        <mxCell id="constraint_transactions_1" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (category_id) REFERENCES categories(id)" vertex="1">
          <mxGeometry height="23" width="435" x="1485" y="782" as="geometry" />
        </mxCell>
        <mxCell id="constraint_transactions_2" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (account_id) REFERENCES bank_accounts(id)" vertex="1">
          <mxGeometry height="23" width="435" x="1485" y="805" as="geometry" />
        </mxCell>
        <mxCell id="constraint_transactions_3" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (card_id) REFERENCES cards(id)" vertex="1">
          <mxGeometry height="23" width="435" x="1485" y="828" as="geometry" />
        </mxCell>
        <mxCell id="constraint_transactions_4" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (recurrence_rule_id) REFERENCES recurrence_rules(id)" vertex="1">
          <mxGeometry height="23" width="435" x="1485" y="851" as="geometry" />
        </mxCell>
        <mxCell id="constraint_transactions_5" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;verticalAlign=middle;fontFamily=Helvetica;fontSize=10;fontColor=#59677A;fillColor=#FFFFFF;strokeColor=#E1E7EC;" value="FOREIGN KEY (installment_plan_id) REFERENCES installment_plans(id)" vertex="1">
          <mxGeometry height="23" width="435" x="1485" y="874" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
  <diagram name="02 - Mapa de relacionamentos" id="XsLAYYEgCwQNePSOLcRG">
    <mxGraphModel grid="1" page="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" pageScale="1" pageWidth="1800" pageHeight="1190" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="r_title" parent="1" style="text;html=1;align=left;verticalAlign=middle;fontSize=29;fontStyle=1;fontColor=#17283C;" value="Finance.io  |  MAPA DOS RELACIONAMENTOS" vertex="1">
          <mxGeometry height="45" width="1550" x="50" y="30" as="geometry" />
        </mxCell>
        <mxCell id="r_sub" parent="1" style="text;html=1;align=left;fontSize=15;fontColor=#617086;" value="Relacionamentos por chave estrangeira  •  1:N = uma entidade de origem para muitos registros dependentes" vertex="1">
          <mxGeometry height="28" width="1670" x="50" y="83" as="geometry" />
        </mxCell>
        <mxCell id="rel_addresses_user_id" edge="1" parent="1" source="node_users" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_addresses" value="user_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_bank_accounts_user_id" edge="1" parent="1" source="node_users" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_bank_accounts" value="user_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_cards_account_id" edge="1" parent="1" source="node_bank_accounts" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_cards" value="account_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_categories_user_id" edge="1" parent="1" source="node_users" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_categories" value="user_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_recurrence_rules_user_id" edge="1" parent="1" source="node_users" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_recurrence_rules" value="user_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_recurrence_rules_category_id" edge="1" parent="1" source="node_categories" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_recurrence_rules" value="category_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_recurrence_rules_account_id" edge="1" parent="1" source="node_bank_accounts" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_recurrence_rules" value="account_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_recurrence_rules_card_id" edge="1" parent="1" source="node_cards" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_recurrence_rules" value="card_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_installment_plans_user_id" edge="1" parent="1" source="node_users" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_installment_plans" value="user_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_installment_plans_category_id" edge="1" parent="1" source="node_categories" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_installment_plans" value="category_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_installment_plans_account_id" edge="1" parent="1" source="node_bank_accounts" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_installment_plans" value="account_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_installment_plans_card_id" edge="1" parent="1" source="node_cards" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_installment_plans" value="card_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_transactions_user_id" edge="1" parent="1" source="node_users" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_transactions" value="user_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_transactions_category_id" edge="1" parent="1" source="node_categories" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_transactions" value="category_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_transactions_account_id" edge="1" parent="1" source="node_bank_accounts" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_transactions" value="account_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_transactions_card_id" edge="1" parent="1" source="node_cards" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_transactions" value="card_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_transactions_recurrence_rule_id" edge="1" parent="1" source="node_recurrence_rules" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_transactions" value="recurrence_rule_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel_transactions_installment_plan_id" edge="1" parent="1" source="node_installment_plans" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#A2ADBC;strokeWidth=1.2;endArrow=block;endFill=1;fontSize=10;fontColor=#5B6673;labelBackgroundColor=#FFFFFF;" target="node_transactions" value="installment_plan_id  ·  1:N">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="node_users" parent="1" style="rounded=1;arcSize=9;whiteSpace=wrap;html=1;align=left;spacingLeft=16;verticalAlign=middle;spacingTop=10;fontFamily=Helvetica;fontSize=14;fontStyle=1;fontColor=#12304E;fillColor=#EAF3FB;strokeColor=#12304E;strokeWidth=2;" value="USERS&amp;#xa;PK  id: UUID&amp;#xa;Entidade principal" vertex="1">
          <mxGeometry height="110" width="330" x="65" y="380" as="geometry" />
        </mxCell>
        <mxCell id="node_addresses" parent="1" style="rounded=1;arcSize=9;whiteSpace=wrap;html=1;align=left;spacingLeft=16;verticalAlign=middle;spacingTop=10;fontFamily=Helvetica;fontSize=14;fontStyle=1;fontColor=#17657A;fillColor=#E8F7FA;strokeColor=#17657A;strokeWidth=2;" value="ADDRESSES&amp;#xa;PK  id: UUID&amp;#xa;FK  user_id" vertex="1">
          <mxGeometry height="110" width="330" x="480" y="130" as="geometry" />
        </mxCell>
        <mxCell id="node_bank_accounts" parent="1" style="rounded=1;arcSize=9;whiteSpace=wrap;html=1;align=left;spacingLeft=16;verticalAlign=middle;spacingTop=10;fontFamily=Helvetica;fontSize=14;fontStyle=1;fontColor=#245E4B;fillColor=#EAF6F0;strokeColor=#245E4B;strokeWidth=2;" value="BANK_ACCOUNTS&amp;#xa;PK  id: UUID&amp;#xa;FK  user_id" vertex="1">
          <mxGeometry height="110" width="330" x="480" y="330" as="geometry" />
        </mxCell>
        <mxCell id="node_categories" parent="1" style="rounded=1;arcSize=9;whiteSpace=wrap;html=1;align=left;spacingLeft=16;verticalAlign=middle;spacingTop=10;fontFamily=Helvetica;fontSize=14;fontStyle=1;fontColor=#17657A;fillColor=#E8F7FA;strokeColor=#17657A;strokeWidth=2;" value="CATEGORIES&amp;#xa;PK  id: UUID&amp;#xa;FK  user_id" vertex="1">
          <mxGeometry height="110" width="330" x="480" y="570" as="geometry" />
        </mxCell>
        <mxCell id="node_cards" parent="1" style="rounded=1;arcSize=9;whiteSpace=wrap;html=1;align=left;spacingLeft=16;verticalAlign=middle;spacingTop=10;fontFamily=Helvetica;fontSize=14;fontStyle=1;fontColor=#245E4B;fillColor=#EAF6F0;strokeColor=#245E4B;strokeWidth=2;" value="CARDS&amp;#xa;PK  id: UUID&amp;#xa;FK  account_id" vertex="1">
          <mxGeometry height="110" width="330" x="890" y="235" as="geometry" />
        </mxCell>
        <mxCell id="node_recurrence_rules" parent="1" style="rounded=1;arcSize=9;whiteSpace=wrap;html=1;align=left;spacingLeft=16;verticalAlign=middle;spacingTop=10;fontFamily=Helvetica;fontSize=14;fontStyle=1;fontColor=#674D96;fillColor=#F4EFFB;strokeColor=#674D96;strokeWidth=2;" value="RECURRENCE_RULES&amp;#xa;PK  id: UUID&amp;#xa;FK  user_id, category_id, account_id, card_id" vertex="1">
          <mxGeometry height="110" width="330" x="890" y="560" as="geometry" />
        </mxCell>
        <mxCell id="node_installment_plans" parent="1" style="rounded=1;arcSize=9;whiteSpace=wrap;html=1;align=left;spacingLeft=16;verticalAlign=middle;spacingTop=10;fontFamily=Helvetica;fontSize=14;fontStyle=1;fontColor=#674D96;fillColor=#F4EFFB;strokeColor=#674D96;strokeWidth=2;" value="INSTALLMENT_PLANS&amp;#xa;PK  id: UUID&amp;#xa;FK  user_id, category_id, account_id, card_id" vertex="1">
          <mxGeometry height="110" width="330" x="1310" y="340" as="geometry" />
        </mxCell>
        <mxCell id="node_transactions" parent="1" style="rounded=1;arcSize=9;whiteSpace=wrap;html=1;align=left;spacingLeft=16;verticalAlign=middle;spacingTop=10;fontFamily=Helvetica;fontSize=14;fontStyle=1;fontColor=#B15D2C;fillColor=#FFF5E9;strokeColor=#B15D2C;strokeWidth=2;" value="TRANSACTIONS&amp;#xa;PK  id: UUID&amp;#xa;FK  user_id, category_id, account_id, card_id, recurrence_rule_id, installment_plan_id" vertex="1">
          <mxGeometry height="110" width="330" x="1310" y="810" as="geometry" />
        </mxCell>
        <mxCell id="legend" parent="1" style="text;html=1;whiteSpace=wrap;align=left;fontSize=13;fontColor=#617086;" value="NOTAÇÃO: setas partem da tabela referenciada (PK) para a tabela dependente (FK). Relacionamentos opcionais dependem da nulidade da coluna FK." vertex="1">
          <mxGeometry height="55" width="1650" x="55" y="1080" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
