require_relative '../spec_helper.rb'
require_relative '../../lib/models/MainMenu.rb'
require 'net/http'
require 'pry'

describe 'MainMenu' do

    context 'Connecting to the API' do

        it 'On successful connection, @connection_strng is set to "Connected"' do
            allow(Net::HTTP).to receive(:get_response).and_return(Net::HTTPOK.new(1.0, '200', 'OK'))
            test_menu = MainMenu.new

            expect(test_menu.connection_string).to eq("Connected")
        end

        it 'On a non successful connection, @connection_strng is set to "Non-Connected"' do
            allow(Net::HTTP).to receive(:get_response).and_return(Net::HTTPRequestTimeout.new(1.0, '408', 'Request Timeout'))
            test_menu = MainMenu.new

            expect(test_menu.connection_string).to eq("Not Connected. Application will not work as expected")
        end
    end
end
