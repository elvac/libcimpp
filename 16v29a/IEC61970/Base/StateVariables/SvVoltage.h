///////////////////////////////////////////////////////////
//  SvVoltage.h
//  Implementation of the Class SvVoltage
//  Original author: kdd
///////////////////////////////////////////////////////////

#ifndef SVVOLTAGE_H
#define SVVOLTAGE_H

#include "IEC61970/Base/Domain/AngleDegrees.h"
#include "IEC61970/Base/Domain/Voltage.h"
#include "IEC61970/Base/StateVariables/StateVariable.h"
#include "IEC61970/Base/Topology/TopologicalNode.h"

namespace IEC61970
{
	namespace Base
	{
		namespace StateVariables
		{
			/**
			 * State variable for voltage.
			 */
			class SvVoltage : public IEC61970::Base::StateVariables::StateVariable
			{

			public:
				SvVoltage();
				virtual ~SvVoltage();
				/**
				 * The voltage angle of the topological node complex voltage with respect to
				 * system reference.
				 */
				IEC61970::Base::Domain::AngleDegrees angle;
				/**
				 * The voltage magnitude of the topological node.
				 */
				IEC61970::Base::Domain::Voltage v;
				/**
				 * The topological node associated with the voltage state.
				 */
				IEC61970::Base::Topology::TopologicalNode *TopologicalNode;

			};

		}

	}

}
#endif // SVVOLTAGE_H
