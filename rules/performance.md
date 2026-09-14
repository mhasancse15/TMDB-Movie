# Performance Rules

Look for:
- unnecessary rebuilds
- expensive work in build()
- unbounded lists
- repeated API calls
- missing pagination
- uncached images
- synchronous heavy work on UI isolate
- memory leaks from listeners/controllers

Measure before making complex optimizations.
