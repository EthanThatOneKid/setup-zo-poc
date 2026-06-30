# setup-zo-poc

A tiny public repo used to test Zo webhook-driven sync flow.

## Demo sync target

When Zo processes a push to `main`, it mirrors the synced pack into:

`/home/workspace/code/github.com/EthanThatOneKid/setup-zo-poc-mirror/demo/hello.zopack.md`

## One-command verification

Run:

```bash
bash verify-sync.sh
```

That script checks the source pack against the mirrored copy and prints both timestamps.
