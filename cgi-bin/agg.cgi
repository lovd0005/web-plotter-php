#!/usr/bin/python
# -*- noplot -*-


from matplotlib.backends.backend_agg import FigureCanvasAgg as FigureCanvas
from matplotlib.figure import Figure
import cStringIO, sys, numpy
homedir = '/home/user1/cwu'
sys.path.insert(0, homedir + '/pyEnv/lib/python2.4/site-packages/')
try:
    import json
except ImportError:
    import simplejson as json
workspace = '/home/user1/cwu/Workspace/'
sys.path.insert(0, workspace)
import spectrum.domain as domain
import spectrum.spectrums as spectrums
data = json.loads(sys.argv[1])

fig = Figure()
canvas = FigureCanvas(fig)
# ax = fig.add_subplot(111)
ax = fig.gca()
numpoints = int(data['numpoints'])
xmin = int( data['xmin'])
xmax = int( data['xmax'])
f = domain.axis_frequences(numpoints,xmin, xmax)
# f = domain.axis_frequences(6 ,1 ,10)
for x in data['spectrums']:
    if x['toPlot'] == '1':
        omega = getattr(spectrums, x['func_name'])(f)
        ax.loglog(f,omega)
# ax.set_title('LIGO_S5')
ax.grid(True)
ax.set_xlabel('Frequency nu [Hz]')
ax.set_ylabel('Energy Spectrum Omega')
tmpimg = cStringIO.StringIO()
canvas.print_figure(tmpimg)
tmppdf = cStringIO.StringIO()
canvas.print_figure(tmppdf, format="pdf")




print "<div class=\"row\">"
print "<img src=\"data:image/png;base64,%s\" class=\"img-rounded span6\"/>" % tmpimg.getvalue().encode("base64").strip()
print "<a href=\"data:application/pdf;base64,%s\">Save PDF as</a>" % tmppdf.getvalue().encode("base64").strip()
print "</div>"
# print "<div class=\"row\">"
# print "<pre class=\"span10\">"
# print(json.dumps(data, sort_keys=True, indent=4, separators=(',', ': ')))
# print json.dumps(data['xmin'], sort_keys=True, indent=4, separators=(',', ': ')) 
# print json.dumps(data['spectrums'], sort_keys=True, indent=4, separators=(',', ': ')) 
# for x in data['spectrums']:
#     # print type(x).__name__
#     if x['toPlot'] == '1':
#         print x['color']
#     # print x
# print xmin 
# print xmax
# print numpoints
# print "</pre>"
# print "</div>"

