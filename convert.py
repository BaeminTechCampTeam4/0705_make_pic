import binascii
from datetime import datetime
import time

start_time = time.time()

def chunkstring(string, length):
    return (string[0+i:length+i] for i in range(0, len(string), length))

# Open in binary mode (so you don't read two byte line endings on Windows as one byte)
# and use with statement (always do this to avoid leaked file descriptors, unflushed files)
with open('hexdata.txt', 'r') as f:
    hexdata = f.read()
    dtn = str(datetime.now())
    hex_list = chunkstring(hexdata, 8)
    with open(f'{dtn}.html', 'a+') as html:
        html.write('<div style="width:256px">')
        for k, hex in enumerate(hex_list, start=1):
            hex = hex[0:6]
            html.write(f"""
                <div style='width:1px;height:1px;background-color:#{hex};padding:0;margin:0;float:left;'></div>
            """)
        html.write('</div>')
print("--- %s seconds ---" % (time.time() - start_time))
