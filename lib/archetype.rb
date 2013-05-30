# Copyright 2013 Civilized Discourse Construction Kit, Inc.
#
# Licensed under the GNU General Public License Version 2.0 (or later); you may not use this work except in compliance with the License. You may obtain a copy of the License in the LICENSE file, or at:
#
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
#
# Discourse logo and “Discourse Forum” ®, Civilized Discourse Construction Kit, Inc.

class Archetype
  include ActiveModel::Serialization

  attr_accessor :id, :options

  def initialize(id, options)
    @id = id
    @options = options
  end

  def attributes
    {'id' => @id,
     'options' => @options}
  end

  def self.default
    'regular'
  end

  def self.poll
    'poll'
  end

  def self.private_message
    'private_message'
  end

  def self.list
    return [] unless @archetypes.present?
    @archetypes.values
  end

  def self.register(name, options={})
    @archetypes ||= {}
    @archetypes[name] = Archetype.new(name, options)
  end
  register 'regular'
  register 'private_message'

end
