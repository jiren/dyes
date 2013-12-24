# Dyes

Dyes : dynamic elasticsearch indexes

Create elasticsearch index based on relations.

i.e 

 Domain -- has many --> Pages

 Each domain object has it's own index and Page are going to store in respective domain.

 Domain(test.com) Index --> n x Page(test.com)
 Domain(test1.com) Index --> n x Page(test1.com)

## Installation

Add this line to your application's Gemfile:

    gem 'dyes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dyes

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
