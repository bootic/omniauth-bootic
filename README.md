# OmniAuth Bootic

This is the official OmniAuth strategy for authenticating to Bootic. Bootic's API is in alpha and not production ready (coming soon).

Please refer to the [Omniauth](https://github.com/intridea/omniauth) gem for more detail.

## Basic Usage

```ruby
use OmniAuth::Builder do
  provider :bootic, ENV['BOOTIC_KEY'], ENV['BOOTIC_SECRET']
end
```

### Scopes

Bootic's API lets you set scopes to provide granular access to your Bootic data: 

```ruby
use OmniAuth::Builder do
  provider :bootic, ENV['BOOTIC_KEY'], ENV['BOOTIC_SECRET'], scope: 'public,admin'
end
```

## License

Copyright (c) 2012 Ismael Celis of Inventario SPA.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
