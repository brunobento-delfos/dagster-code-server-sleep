# Dagster Code Server issue
Small repo showcasing code server behavior.

## Running it
`docker compose up --build`
and check localhost:3010.

## Steps 
- The code server will take 10s to finally load (sleep time in `src/__init__.py`)
- Open `parallel job` and run it
- If you keep re-executing it, you'll notice it always takes 10 seconds to start 
running (see difference between ENGINE_EVENT and RUN_START)

## What I expected
I wanted it to take 10s only the first time, then when you re-execute it, the 
code won't need to be re-loaded again.
