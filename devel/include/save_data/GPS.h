// Generated by gencpp from file save_data/GPS.msg
// DO NOT EDIT!


#ifndef SAVE_DATA_MESSAGE_GPS_H
#define SAVE_DATA_MESSAGE_GPS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace save_data
{
template <class ContainerAllocator>
struct GPS_
{
  typedef GPS_<ContainerAllocator> Type;

  GPS_()
    : latitude(0.0)
    , longitude(0.0)  {
    }
  GPS_(const ContainerAllocator& _alloc)
    : latitude(0.0)
    , longitude(0.0)  {
  (void)_alloc;
    }



   typedef double _latitude_type;
  _latitude_type latitude;

   typedef double _longitude_type;
  _longitude_type longitude;





  typedef boost::shared_ptr< ::save_data::GPS_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::save_data::GPS_<ContainerAllocator> const> ConstPtr;

}; // struct GPS_

typedef ::save_data::GPS_<std::allocator<void> > GPS;

typedef boost::shared_ptr< ::save_data::GPS > GPSPtr;
typedef boost::shared_ptr< ::save_data::GPS const> GPSConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::save_data::GPS_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::save_data::GPS_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace save_data

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'save_data': ['/home/ubuntu/catkin_ws/src/save_data/msg'], 'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::save_data::GPS_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::save_data::GPS_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::save_data::GPS_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::save_data::GPS_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::save_data::GPS_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::save_data::GPS_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::save_data::GPS_<ContainerAllocator> >
{
  static const char* value()
  {
    return "680c6dc7da65a2421a822205dcbdb600";
  }

  static const char* value(const ::save_data::GPS_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x680c6dc7da65a242ULL;
  static const uint64_t static_value2 = 0x1a822205dcbdb600ULL;
};

template<class ContainerAllocator>
struct DataType< ::save_data::GPS_<ContainerAllocator> >
{
  static const char* value()
  {
    return "save_data/GPS";
  }

  static const char* value(const ::save_data::GPS_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::save_data::GPS_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 latitude\n\
float64 longitude\n\
";
  }

  static const char* value(const ::save_data::GPS_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::save_data::GPS_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.latitude);
      stream.next(m.longitude);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GPS_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::save_data::GPS_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::save_data::GPS_<ContainerAllocator>& v)
  {
    s << indent << "latitude: ";
    Printer<double>::stream(s, indent + "  ", v.latitude);
    s << indent << "longitude: ";
    Printer<double>::stream(s, indent + "  ", v.longitude);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SAVE_DATA_MESSAGE_GPS_H