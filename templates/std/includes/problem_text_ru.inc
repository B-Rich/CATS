<h2><TMPL_IF code>������ <TMPL_VAR code>. </TMPL_IF><TMPL_VAR title ESCAPE=HTML></h2>
<TMPL_IF author>�����: <TMPL_VAR author ESCAPE=HTML><br><br></TMPL_IF>
<table class="nobr">
<tr>
  <td width="1%">������� ����:</td><td><TMPL_VAR input_file ESCAPE=HTML></td>
  <td>&nbsp;</td>
  <td width="1%">����������� ������� �� ����:</td><td><TMPL_VAR time_limit> ���</td></tr>
<tr>
  <td>�������� ����:</td><td><TMPL_VAR output_file ESCAPE=HTML></td>
  <td>&nbsp;</td>
  <td>����������� ������ �� ����:</td><td><TMPL_VAR memory_limit> ��</td></tr>
  <TMPL_IF show_points><tr><td>������������ ������:</td><td><TMPL_VAR max_points> ������</td>
  <td colspan="3">&nbsp;</td></tr></TMPL_IF>
</table>
<TMPL_IF keywords>�������� �����: <TMPL_VAR keywords><br/><br/></TMPL_IF>
<TMPL_IF statement>
  <h3>�������</h3>
  <TMPL_VAR statement>
</TMPL_IF>
<TMPL_IF explanation>
  <h3>������</h3>
  <TMPL_VAR explanation>
<TMPL_ELSE>
<TMPL_IF input_format>
  <h3>������ �������� �����</h3>
  <TMPL_VAR input_format>
</TMPL_IF>
<TMPL_IF formal_input>
  <h3>���������� ����</h3>
  <pre><TMPL_VAR formal_input></pre>
</TMPL_IF>
<TMPL_IF output_format>
  <h3>������ ��������� �����</h3>
  <TMPL_VAR output_format>
</TMPL_IF>    
<TMPL_IF pconstraints>
  <h3>�����������</h3>
  <TMPL_VAR pconstraints>
</TMPL_IF>
<TMPL_IF extended_samples>
<TMPL_LOOP samples>
<h4>������ �������� ����� &#8470;<TMPL_VAR rank></h4>
<pre><code><TMPL_VAR in_file></code></pre>
<h4>������ ��������� ����� &#8470;<TMPL_VAR rank></h4>
<pre><code><TMPL_VAR out_file></code></pre>
</TMPL_LOOP>
<TMPL_ELSE>
<h3>������� ������</h3>
<table class="sample" id="sample<TMPL_VAR id>">
<tr><th>&#8470;</th><th>������� ����</th><th>�������� ����</th></tr>
<TMPL_LOOP samples>
<tr>
  <td><TMPL_VAR rank></td>
  <td><pre><code><TMPL_VAR in_file></code></pre></td>
  <td><pre><code><TMPL_VAR out_file></code></pre></td>
</tr>
</TMPL_LOOP>
</table>
</TMPL_IF>
</TMPL_IF>