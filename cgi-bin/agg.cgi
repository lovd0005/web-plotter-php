#!/usr/bin/python
# -*- noplot -*-


from matplotlib.backends.backend_agg import FigureCanvasAgg as FigureCanvas
from matplotlib.figure import Figure
from matplotlib import rc
import cStringIO, sys, os
os.environ['PATH'] = os.environ['PATH'] + ':/usr/local/bin:/usr/texbin'
homedir = '/home/user1/cwu'
# sitepackages = homedir + '/pyEnv/lib/python2.4/site-packages/'
sitepackages = '/Users/Chengjian/pyEnv/lib/python2.5/site-packages/'
sys.path.insert(0, sitepackages)
try:
    import json
except ImportError:
    import simplejson as json
# workspace = '/home/user1/cwu/Workspace/'
workspace = '/Users/Chengjian/Workshop/'
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
# print type(data['spectrums']).__name__
if type(data['spectrums']) == list:
    for item in data['spectrums']:
        parameters = ""
        if 'params' in item:
            for para in item['params']:
                parameters += ', ' + para['variable'] + '=' + str(para['value']) 
        omega = eval('spectrums.' + item['func_name'] + '(f ' + parameters + ')')
        ax.loglog(f,omega)
        
if type(data['spectrums']) == dict:
    for key,item in data['spectrums'].items():
        parameters = ""
        if 'params' in item:
            for para in item['params']:
                parameters += ', ' + para['variable'] + '=' + str(para['value']) 
        omega = eval('spectrums.' + item['func_name'] + '(f ' + parameters + ')')
        ax.loglog(f,omega)

        
# for key in data['spectrums']:
#     # print json.dumps(data['spectrums'])
#     print type(key).__name__
#     if 'params' in data['spectrums'][key]:
#         print json.dumps(spectrum['params'])
    # omega = getattr(spectrums, spectrum['func_name'])(f)
    # ax.loglog(f,omega)
# ax.set_title('LIGO_S5')
ax.grid(True)
rc('text', usetex=True)
rc('font', family='serif')
ax.set_xlabel(r'Frequency $\nu$ [Hz]')
ax.set_ylabel(r'Energy Spectrum $\Omega$')
tmpimg = cStringIO.StringIO()
canvas.print_figure(tmpimg)
tmppdf = cStringIO.StringIO()
canvas.print_figure(tmppdf, format="pdf")




print "<div class=\"row\">"
print "<img src=\"data:image/png;base64,%s\" class=\"img-rounded span6\"/>" % tmpimg.getvalue().encode("base64").strip()
print "<a href=\"data:application/pdf;base64,%s\">Save PDF as</a>" % tmppdf.getvalue().encode("base64").strip()
print "</div>"
print "<div class=\"row\">"
print "<pre class=\"span10\">"
# print(json.dumps(data, sort_keys=True, indent=4, separators=(',', ': ')))
# print(json.dumps(data['spectrums']))
# print json.dumps(data['xmin'], sort_keys=True, indent=4, separators=(',', ': ')) 
# print json.dumps(data['spectrums'], sort_keys=True, indent=4, separators=(',', ': ')) 
# for x in data['spectrums']:
#     # print type(x).__name__
#     if x['toPlot'] == '1':
#         print x['color']
#     # print x
# print xmin 
# print xmax
print "</pre>"
print "</div>"

