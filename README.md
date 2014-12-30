riak-data-loader
================

## Overview

This is a set of simple Ruby scripts and supporting scripts to take data
from the Twitter streaming API and load it into Riak.

## Usage

### Twitter Auth

Create a `.twauth` file in your home dir. It's YAML with this form (all values will be different, obviously):

```yaml
consumer_key:        ySASg3XkTGbzVJew0Nl0
consumer_secret:     ySASg3XkTGbzVJew0Nl0
access_token:        ySASg3XkTGbzVJew0Nl0
access_token_secret: ySASg3XkTGbzVJew0Nl0
```

### Riak Setup


