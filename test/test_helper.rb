ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def assert_valid_fixture(items)
    assert items.map(&:valid?).all?, (items.reject(&:valid?).map { |c| (c.respond_to?(:name) ? "#{c.name} " : '') + c.errors.full_messages.to_sentence })
  end

  # you can use byebug, but it will stop rails so you can not navigate to other
  # pages or make another requests in chrome while testing
  def pause
    $stderr.write('Press CTRL+j or ENTER to continue') && $stdin.gets
  end
end
